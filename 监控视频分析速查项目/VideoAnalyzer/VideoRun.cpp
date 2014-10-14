


#include "stdafx.h"
#include "VideoRun.h"
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <cv.h>
#include <highgui.h>
#include <ctype.h>
#include "Time.h"
#include <iostream>
#include <fstream>
#include <opencv2/opencv.hpp>
using namespace std;
using namespace cv;

VideoRun::VideoRun(CvCapture *c)
{
	video = c;
	height=(int)cvGetCaptureProperty(video,CV_CAP_PROP_FRAME_HEIGHT);
    width=(int)cvGetCaptureProperty(video,CV_CAP_PROP_FRAME_WIDTH);
	num=(int)cvGetCaptureProperty(video,CV_CAP_PROP_FRAME_COUNT);
	fps=(int)cvGetCaptureProperty(video,CV_CAP_PROP_FPS);
	ci = 0;
}

void VideoRun::setRect(int x,int y,int width,int height)
{
	rect.x=x;
	rect.y=y;
	rect.width=width;
	rect.height=height;
}
CString VideoRun::showTime()
{
	int t = this->GetNum()/this->GetFps();
	int th = t/3600; t = t - th * 3600;
    int tm = t/60; 
    int ts = t - tm * 60;
	CString s;
	if(ts>=10&&tm>=10)
		s.Format(_T("%d:%d:%d"),th,tm,ts);
	else {
		if(ts>=10)
		{
			s.Format(_T("%d:0%d:%d"),th,tm,ts);
		}
		else if(tm>=10)
		{
			s.Format(_T("%d:%d:0%d"),th,tm,ts);
		}
		else{
			s.Format(_T("%d:0%d:0%d"),th,tm,ts);
		}
	}
	return s;
}
CString VideoRun::showTime(int t)
{
	int th = t/3600; t = t - th * 3600;
    int tm = t/60; 
    int ts = t - tm * 60;
	CString s;
	if(ts>=10&&tm>=10)
		s.Format(_T("%d:%d:%d"),th,tm,ts);
	else {
		if(ts>=10)
		{
			s.Format(_T("%d:0%d:%d"),th,tm,ts);
		}
		else if(tm>=10)
		{
			s.Format(_T("%d:%d:0%d"),th,tm,ts);
		}
		else{
			s.Format(_T("%d:0%d:0%d"),th,tm,ts);
		}
	}
	return s;
}

void VideoRun::Run()
{
	
	
	IplImage * preFrame = cvCreateImage(cvSize(width,height),IPL_DEPTH_32F,3);
	IplImage * nextFrame = cvCreateImage(cvSize(width,height),IPL_DEPTH_32F,3);
	IplImage * preFrame_gray = cvCreateImage(cvSize(width,height),IPL_DEPTH_8U,1); 
	IplImage * nextFrame_gray = cvCreateImage(cvSize(width,height),IPL_DEPTH_8U,1);
	ofstream out;
	out.open("test.txt",ios::trunc);

	if(!cvGrabFrame(video))
	{	
		printf("Finished!\n");
	}
	preFrame=cvRetrieveFrame(video);

	int pretime=0;
	
	int ti = 1;
	out<<fps<<" "<<num<<endl;
	while(ti*fps<num)
	{
		cvCvtColor(preFrame,preFrame_gray,CV_BGR2GRAY);
		cvSetCaptureProperty(video,CV_CAP_PROP_POS_FRAMES,(double)(ti * fps));
		if(!cvGrabFrame(video))
		{	
			out<<"Finished!\n";
		}
		nextFrame = cvRetrieveFrame(video);
		cvCvtColor(nextFrame,nextFrame_gray,CV_BGR2GRAY);
		uchar *data1=(uchar *)preFrame_gray->imageData;
		uchar *data2=(uchar *)nextFrame_gray->imageData;
		int d=Distance(data1,data2); 
		
		int testtime=(int) cvGetCaptureProperty(video,CV_CAP_PROP_POS_FRAMES)/fps;
		int th = testtime/3600; testtime = testtime - th * 3600;
		int tm = testtime/60; 
		int tss = testtime - tm * 60;
		out<<d<<" "<<th<<":"<<tm<<" "<<tss<<endl;
		
		if(d>200) 
		{
			int pos =(int) cvGetCaptureProperty(video,CV_CAP_PROP_POS_FRAMES);
			int tmptime=pos/fps;
			
			if(tmptime-pretime>1)
			{
				ci++;
				ts[ci] = tmptime;
				
				//cvShowImage("mainWin",tmp);

				
				cvWaitKey(500);
				
			}
			pretime=tmptime;
		}
		ti++;
		preFrame=nextFrame;
	}
	printf("Finished!\n");
	cvDestroyWindow("mainWin");
	ti = 1;
	out.close();
}



int VideoRun::Distance(uchar *a,uchar *b)
{
	int distance=0;
	int h=rect.y+rect.height;
	int w=rect.x+rect.width;
	for(int i=rect.y;i<h;i += 2)
		for(int j=rect.x;j<w;j += 2)
		   {
			   int k=i*width+j;
			   distance += (b[k]-a[k])*(b[k]-a[k]);
		   }
		   distance=distance/rect.height/rect.width*4;
	return distance;
}
VideoRun::~VideoRun()
{
	cvReleaseCapture( &video );
}
