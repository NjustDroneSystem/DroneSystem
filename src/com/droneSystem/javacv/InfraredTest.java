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

//获取流地址并且保存视频帧发送出去，并且录制视频帧保存本地

public class InfraredTest {
	 public static String videoFramesPath = "C:/test1/"; 
	 static OpenCVFrameConverter.ToIplImage converter = new OpenCVFrameConverter.ToIplImage();
	 public static void frameRecord(String inputFile, String outputFile, int audioChannel)  
	            throws Exception, org.bytedeco.javacv.FrameRecorder.Exception {  
	          
	        boolean isStart=true;// 该变量建议设置为全局控制变量，用于控制录制结束
	     // 获取视频源
	        FFmpegFrameGrabber grabber = new FFmpegFrameGrabber(inputFile);  
	     // 车流量要求截图分辨率较小以加快算法速度，雪阻、沙阻要求截图清晰以提高算法精度
	        FFmpegFrameRecorder recorder = new FFmpegFrameRecorder(outputFile, 640, 334, audioChannel);  
	     // 流媒体输出地址，分辨率（长，高），是否录制音频（0:不录制/1:录制）
	        recordByFrame(grabber, recorder, isStart);  
	    }
	 
	 private static void recordByFrame(FFmpegFrameGrabber grabber, FFmpegFrameRecorder recorder, Boolean status)  
	            throws Exception, org.bytedeco.javacv.FrameRecorder.Exception {  
	        try {// 开始取视频源
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
		// 创建BufferedImage对象
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
	