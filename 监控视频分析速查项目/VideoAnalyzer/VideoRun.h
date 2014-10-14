#pragma once
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <cv.h>
#include <highgui.h>
#include <ctype.h>

class VideoRun
{
public:
	VideoRun(CvCapture *c);
	void Run();
	void Change(IplImage *a,IplImage *b);
	int Distance(uchar *data1,uchar *data2);
	int GetHeight(){return height;}
	int GetWidth(){return width;}
	int GetFps(){return fps;}
	int GetNum(){return num;}
	int GetTs(int x){return ts[x];}
	int GetCi(){return ci;}
	CString showTime();
	CString showTime(int t);

	//IplImage *GetPi(int x){return pi[x];}
	~VideoRun(void);
	CvRect rect;
	void setRect(int x,int y,int width,int height);
private:
	//IplImage * pi[101];
	int ci;

	int ts[101];
	CvCapture *video;
	int height;
	int width;
	int fps;
	int num;
};

