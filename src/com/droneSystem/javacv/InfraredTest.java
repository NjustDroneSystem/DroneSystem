package com.droneSystem.javacv;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import org.bytedeco.javacv.FFmpegFrameGrabber;
import org.bytedeco.javacv.FFmpegFrameRecorder;
import org.bytedeco.javacv.Frame;
import org.bytedeco.javacv.FrameGrabber;
import org.bytedeco.javacv.FrameRecorder;
import org.bytedeco.javacv.Java2DFrameConverter;
import org.bytedeco.javacv.OpenCVFrameConverter;
import com.mathworks.toolbox.javabuilder.*;
import WinRPCA.*;

//��ȡ����ַ���ұ�����Ƶ֡���ͳ�ȥ������¼����Ƶ֡���汾��

public class InfraredTest {
	 public static String videoFramesPath = "C:/test1/"; 
	 static OpenCVFrameConverter.ToIplImage converter = new OpenCVFrameConverter.ToIplImage();
	 public static void frameRecord(String inputFile, String outputFile, int audioChannel)  
	            throws Exception, org.bytedeco.javacv.FrameRecorder.Exception {  
	          
	        boolean isStart=true;// �ñ�����������Ϊȫ�ֿ��Ʊ��������ڿ���¼�ƽ���
	     // ��ȡ��ƵԴ
	        FFmpegFrameGrabber grabber = new FFmpegFrameGrabber(inputFile);  
	     // ������Ҫ���ͼ�ֱ��ʽ�С�Լӿ��㷨�ٶȣ�ѩ�衢ɳ��Ҫ���ͼ����������㷨����
	        FFmpegFrameRecorder recorder = new FFmpegFrameRecorder(outputFile, 640, 334, audioChannel);  
	     // ��ý�������ַ���ֱ��ʣ������ߣ����Ƿ�¼����Ƶ��0:��¼��/1:¼�ƣ�
	        recordByFrame(grabber, recorder, isStart);  
	    }
	 
	 private static void recordByFrame(FFmpegFrameGrabber grabber, FFmpegFrameRecorder recorder, Boolean status)  
	            throws Exception, org.bytedeco.javacv.FrameRecorder.Exception {  
	        try {// ��ʼȡ��ƵԴ
	            grabber.start();  
	            recorder.start();  
	            Frame frame = null; 
	            Object[] result = null; 
	            winRPCA winrpca = null;
	           
	            
	            int flag = 0;
	            while (status&& (frame = grabber.grabFrame()) != null) {  
	            	
	                recorder.record(frame);  
	                String fileName = videoFramesPath + String.valueOf(flag) + ".jpg";
	                File outPut = new File(fileName);  
	                BufferedImage img = FrameToBufferedImage(frame);	             
	                ImageIO.write(img, "jpg", outPut);
	               // String fileName = "C:/Users/wzhang/Documents/MATLAB/Tensor-IPI/001.bmp";
	                winrpca = new winRPCA();
	                result = winrpca.winRPCA_median(1,fileName);
	                System.out.println(result[0]);
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
	 
	
	 
	 public static void main(String[] args)  
			 throws FrameRecorder.Exception, FrameGrabber.Exception, InterruptedException, Exception {  
	         String inputFile = "C:/temp/Infrared2.mp4";  
	         // Decodes-encodes  
	         String outputFile = "C:/Users/recorde7.mp4";  
	         frameRecord(inputFile, outputFile,1);  
	}  
}
	