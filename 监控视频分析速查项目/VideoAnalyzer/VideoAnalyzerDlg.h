
// VideoAnalyzerDlg.h : 头文件
//

#pragma once
#include "CWMPPlayer4.h"
#include "VideoRun.h"
#include "CWMPControls.h"  
// CVideoAnalyzerDlg 对话框
class CVideoAnalyzerDlg : public CDialogEx
{
// 构造
public:
	CVideoAnalyzerDlg(CWnd* pParent = NULL);	// 标准构造函数

// 对话框数据
	enum { IDD = IDD_VIDEOANALYZER_DIALOG };

	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV 支持


// 实现
protected:
	HICON m_hIcon;

	// 生成的消息映射函数
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnClose();
	DECLARE_MESSAGE_MAP()

public:
	CWMPPlayer4 m_player;        //播放器控件
	CWMPControls m_playerCtrl;   //播放器控制器
	const char * fileName;       //视频文件路径
	CvCapture * capture;         //视频获取结构 
	CEdit  edit;                 //消息编辑框控件
	CListCtrl list;				 //播放列表控件	
    CString edit_content;        //消息内容
    int line;					 //消息行数
	VideoRun *con;				 //视频播放引用对象
	
	int flag;					 //标志线程是否还运行中
    void messageReport(CString content);     //消息显示
	void clearAll();						 //还原初始化状态

	afx_msg void OnBnClickedMfcbutton1();
	afx_msg void OnBnClickedMfcbutton2();
	afx_msg void OnBnClickedMfcbutton3();
	afx_msg void OnNMDblclkList2(NMHDR *pNMHDR, LRESULT *pResult);

};
