
// VideoAnalyzer.h : PROJECT_NAME Ӧ�ó������ͷ�ļ�
//

#pragma once

#ifndef __AFXWIN_H__
	#error "�ڰ������ļ�֮ǰ������stdafx.h�������� PCH �ļ�"
#endif

#include "resource.h"		// ������


// CVideoAnalyzerApp:
// �йش����ʵ�֣������ VideoAnalyzer.cpp
//

class CVideoAnalyzerApp : public CWinApp
{
public:
	CVideoAnalyzerApp();

// ��д
public:
	virtual BOOL InitInstance();

// ʵ��

	DECLARE_MESSAGE_MAP()
};

extern CVideoAnalyzerApp theApp;