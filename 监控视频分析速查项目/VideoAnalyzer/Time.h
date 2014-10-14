#pragma once
class Time
{
public:
	Time(int,int,int);
	Time(int);
	void setTime(int,int,int);
	void setTime(int);
	void printTime();
	~Time();
private:
	int hour;
	int minute;
	int second;
};

