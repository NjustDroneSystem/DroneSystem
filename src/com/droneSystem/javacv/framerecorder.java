package com.droneSystem.javacv;

import java.awt.image.BufferedImage;
import java.io.File;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.TimeUnit;
import com.mathworks.toolbox.javabuilder.*;
import WinRPCA.*;

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
import com.droneSystem.hibernate.InfraredVolume;
import com.droneSystem.hibernate.Record;
import com.droneSystem.hibernate.SandVolume;
import com.droneSystem.hibernate.SnowVolume;
import com.droneSystem.hibernate.TrafficFlow;
import com.droneSystem.hibernate.Video;
import com.droneSystem.manager.CarNumManager;
import com.droneSystem.manager.InfraredVolumeManager;
import com.droneSystem.manager.RecordManager;
import com.droneSystem.manager.SandVolumeManager;
import com.droneSystem.manager.SnowVolumeManager;
import com.droneSystem.manager.TrafficFlowManager;

//获取流地址并且保存视频帧发送出去，并且录制视频帧保存本地
public class framerecorder {
	public static String videoFramesPath = "D:/test1/";
	public static String videoFilePath = "D:/DevTools/apache-tomcat-7.0.39-windows-x64/webapps/droneSystem/Inc/";
	public static void frameRecord(String inputFile, String outputFile,
			int audioChannel, int type, int id, Drone drone, Video video)
			throws Exception, org.bytedeco.javacv.FrameRecorder.Exception {

		boolean isStart = true;// 该变量建议设置为全局控制变量，用于控制录制结束
		try {
			// 获取视频源
			FFmpegFrameGrabber grabber = new FFmpegFrameGrabber(inputFile);
			grabber.setOption("rtsp_transport", "http");
			// 车流量要求截图分辨率较小以加快算法速度，雪阻、沙阻要求截图清晰以提高算法精度,红外要求图片大小为250*200
			if(type == 3) {
				grabber.setImageWidth(576);
			 	grabber.setImageHeight(320);
			} else if(type == 1 || type == 2){
				grabber.setImageWidth(1080);
			 	grabber.setImageHeight(720);
			} else if(type == 4){
				grabber.setImageWidth(250);
				grabber.setImageHeight(200);
			}
			
			// 流媒体输出地址，分辨率（长，高），是否录制音频（0:不录制/1:录制）
			FFmpegFrameRecorder recorder = new FFmpegFrameRecorder(videoFilePath+outputFile,
					1920, 1080, audioChannel);
			recorder.setVideoCodec(avcodec.AV_CODEC_ID_H264); // avcodec.AV_CODEC_ID_H264，编码
			recorder.setInterleaved(true);
			recorder.setFrameRate(8);
			//recorder.setVideoBitrate(3000000);
			// 开始取视频源
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
		InfraredVolumeManager infraredVMgr = new InfraredVolumeManager();
		RecordManager reMgr = new RecordManager();
		CarNumManager carMgr = new CarNumManager();
		SnowVolume snowv = new SnowVolume();
		SandVolume sandv = new SandVolume();
		InfraredVolume infraredv = new InfraredVolume();
		double latitude = drone.getLatitude();
		double longitude = drone.getLongitude();
		Object[] InfraredCar = null; 
        WinRPCA winrpca = null;
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
		if (reqType == 4) {
			infraredv = infraredVMgr.findById(id);
		}
		try {// 建议在线程中使用该方法
			grabber.start();
			recorder.start();
			Frame frame = null;
			int flag = 0;
			String fileName;
			File outPut;
			while (status && (frame = grabber.grabFrame()) != null) {
				recorder.record(frame);
				//if(flag % 2 == 0){
					fileName = videoFramesPath + "/img_"
							+ String.valueOf(flag) + ".jpg";
					outPut = new File(fileName);
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
					
					
					 if(reqType == 1 && flag % 20 ==1){
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
						 record.setValueRight(0.0);
						 reMgr.save(record);
					 }
					 if(reqType == 2 && flag % 20 ==1){
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
						 record.setValueRight(0.0);
						 reMgr.save(record);
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
						//TimeUnit.MILLISECONDS.sleep(5);
					}
					if(reqType == 4 && flag % 100 ==1){
						winrpca = new WinRPCA(); 
		                InfraredCar = winrpca.winRPCA_median(1,fileName); //调用红外算法，得到实时红外车辆数目
		                System.out.println(InfraredCar[0]); //InfraredCar需要保存并post到前端
		                //存InfraredCar
		                infraredv.setInfraredVolume(Integer.parseInt(InfraredCar[0].toString()));
		                infraredv.setTime(time);
		                infraredVMgr.update(infraredv);
						record.setValueLeft(Double.parseDouble(InfraredCar[0].toString()));
						record.setValueRight(0.0);
						reMgr.save(record);
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
		// 创建BufferedImage对象
		Java2DFrameConverter converter = new Java2DFrameConverter();
		BufferedImage bufferedImage = converter.getBufferedImage(frame);
		return bufferedImage;
	}

}
