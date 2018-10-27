package com.droneSystem.javacv;

import java.awt.image.BufferedImage;
import java.io.File;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.TimeUnit;

import javax.imageio.ImageIO;

import org.bytedeco.javacpp.avcodec;
import org.bytedeco.javacv.FFmpegFrameGrabber;
import org.bytedeco.javacv.FFmpegFrameRecorder;
import org.bytedeco.javacv.Frame;
import org.bytedeco.javacv.Java2DFrameConverter;
import org.json.me.JSONObject;

import com.droneSystem.util.HttpUtil;

import com.droneSystem.hibernate.CarNum;
import com.droneSystem.hibernate.Drone;
import com.droneSystem.hibernate.Record;
import com.droneSystem.hibernate.SandVolume;
import com.droneSystem.hibernate.SnowVolume;
import com.droneSystem.hibernate.TrafficFlow;
import com.droneSystem.hibernate.Video;
import com.droneSystem.manager.CarNumManager;
import com.droneSystem.manager.RecordManager;
import com.droneSystem.manager.SandVolumeManager;
import com.droneSystem.manager.SnowVolumeManager;
import com.droneSystem.manager.TrafficFlowManager;

//��ȡ����ַ���ұ�����Ƶ֡���ͳ�ȥ������¼����Ƶ֡���汾��
public class framerecorder {
	public static String videoFramesPath = "D:/test1";

	public static void frameRecord(String inputFile, String outputFile,
			int audioChannel, int type, int id, Drone drone, Video video)
			throws Exception, org.bytedeco.javacv.FrameRecorder.Exception {

		boolean isStart = true;// �ñ�����������Ϊȫ�ֿ��Ʊ��������ڿ���¼�ƽ���
		try {
			// ��ȡ��ƵԴ
			FFmpegFrameGrabber grabber = new FFmpegFrameGrabber(inputFile);
			grabber.setOption("rtsp_transport", "http");
			grabber.setImageWidth(576);
		 	grabber.setImageHeight(320);
			// ��ý�������ַ���ֱ��ʣ������ߣ����Ƿ�¼����Ƶ��0:��¼��/1:¼�ƣ�
			FFmpegFrameRecorder recorder = new FFmpegFrameRecorder(outputFile,
					1920, 1080, audioChannel);
			recorder.setVideoCodec(avcodec.AV_CODEC_ID_H264); // avcodec.AV_CODEC_ID_H264������
			recorder.setInterleaved(true);
			recorder.setFrameRate(15);
			// ��ʼȡ��ƵԴ
			Long now = System.currentTimeMillis();
			recordByFrame(grabber, recorder, isStart, type, id, drone, video);
			Long now1 = System.currentTimeMillis();
			System.out.println("Total Using time: "+(now1-now));
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public static void recordByFrame(FFmpegFrameGrabber grabber,
			FFmpegFrameRecorder recorder, Boolean status, int reqType, int id,
			Drone drone, Video video) throws Exception,
			org.bytedeco.javacv.FrameRecorder.Exception {
		SnowVolumeManager snowVMgr = new SnowVolumeManager();
		SandVolumeManager sandVMgr = new SandVolumeManager();
		TrafficFlowManager TFMgr = new TrafficFlowManager();

		RecordManager reMgr = new RecordManager();
		CarNumManager carMgr = new CarNumManager();
		SnowVolume snowv = new SnowVolume();
		SandVolume sandv = new SandVolume();
		double latitude = drone.getLatitude();
		double longitude = drone.getLongitude();
		TrafficFlow tf = new TrafficFlow();
		if (reqType == 1) {
			snowv = snowVMgr.findById(id);
		}
		if (reqType == 2) {
			sandv = sandVMgr.findById(id);
		}
		if (reqType == 3) {
			tf = TFMgr.findById(id);
		}
		try {// �������߳���ʹ�ø÷���
			grabber.start();
			recorder.start();
			Frame frame = null;
			int flag = 0;
			while (status && (frame = grabber.grabFrame()) != null) {
				recorder.record(frame);
				//if(flag % 2 == 0){
					String fileName = videoFramesPath + "/img_"
							+ String.valueOf(flag) + ".jpg";
					File outPut = new File(fileName);
					frame = grabber.grabImage();
					if (frame != null) {
						Long now = System.currentTimeMillis();
						ImageIO.write(FrameToBufferedImage(frame), "jpg", outPut);
						Long now1 = System.currentTimeMillis();
						System.out.println("Using time: "+(now1-now));
					} else {
						break;
					}
					Timestamp time = new Timestamp(System.currentTimeMillis());
					//System.out.println(time);
	
					Record record = new Record();
					record.setDrone(drone);
					record.setType(reqType);
					record.setTime(time);
					record.setVideo(video);
					
					
					 if(reqType == 1 && flag % 45 ==1){
						 String Volume = HttpUtil.doPost("http://127.0.0.1:4050",
									"{\"UAVID\":\"1\", \"ImgSrc\":\"" + fileName
											+ "\",\"Lat\":\"" + latitude + "\",\"Lon\":\""
											+ longitude + "\", \"ReqType\":\"" + reqType
											+ "\"}");
							JSONObject resp = new JSONObject(Volume);
						 snowv.setSnowVolume(Double.parseDouble(resp.getString("Value")));
						 snowv.setTime(time);
						 snowVMgr.update(snowv);
						 record.setValueLeft(Double.parseDouble(resp.getString("Value")));
						
					 }
					 if(reqType == 2 && flag % 45 ==1){
						 String Volume = HttpUtil.doPost("http://127.0.0.1:4050",
									"{\"UAVID\":\"1\", \"ImgSrc\":\"" + fileName
											+ "\",\"Lat\":\"" + latitude + "\",\"Lon\":\""
											+ longitude + "\", \"ReqType\":\"" + reqType
											+ "\"}");
							JSONObject resp = new JSONObject(Volume);
						 sandv.setSandVolume(Double.parseDouble(resp.getString("Value")));
						 sandv.setTime(time);
						 sandVMgr.update(sandv);
						 record.setValueLeft(Double.parseDouble(resp.getString("Value")));
					 }
					if (reqType == 3) {
						String Volume = HttpUtil.doPost("http://127.0.0.1:4050",
								"{\"UAVID\":\"1\", \"ImgSrc\":\"" + fileName
										+ "\",\"Lat\":\"" + latitude + "\",\"Lon\":\""
										+ longitude + "\", \"ReqType\":\"" + reqType
										+ "\"}");
						JSONObject resp = new JSONObject(Volume);
						tf.setVolumeLeft(Double.parseDouble(resp
								.getString("ValueLeft")));
						tf.setVolumeRight(Double.parseDouble(resp
								.getString("ValueRight")));
						// tf.setVolumeLeft(1.1);
						// tf.setVolumeRight(1.1);
						tf.setTime(time);
						TFMgr.update(tf);
						record.setValueLeft(Double.parseDouble(resp
								.getString("ValueLeft")));
						record.setValueRight(Double.parseDouble(resp
								.getString("ValueRight")));
						// record.setValueLeft(1.1);
						// record.setValueRight(1.1);
						reMgr.save(record);
						CarNum carNum = new CarNum();
						carNum.setTrafficFlow(tf);
						carNum.setTime(time);
						carNum.setVideo(video);
						carNum.setCarNumLeft(Integer.parseInt(resp
								.getString("TrackLeft")));
						carNum.setCarNumRight(Integer.parseInt(resp
								.getString("TrackRight")));
						// carNum.setCarNumLeft(num);
						// carNum.setCarNumRight(num);
						carMgr.save(carNum);
						TimeUnit.MILLISECONDS.sleep(5);
					}
				//}
				flag++;

			}
			recorder.stop();
			grabber.stop();
		} finally {
			if (grabber != null) {
				grabber.stop();
			}
		}
	}

	public static BufferedImage FrameToBufferedImage(Frame frame) {
		// ����BufferedImage����
		Java2DFrameConverter converter = new Java2DFrameConverter();
		BufferedImage bufferedImage = converter.getBufferedImage(frame);
		return bufferedImage;
	}

}
