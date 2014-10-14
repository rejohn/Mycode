
// VideoAnalyzerDlg.h : ͷ�ļ�
//

#pragma once
#include "CWMPPlayer4.h"
#include "VideoRun.h"
#include "CWMPControls.h"  
// CVideoAnalyzerDlg �Ի���
class CVideoAnalyzerDlg : public CDialogEx
{
// ����
public:
	CVideoAnalyzerDlg(CWnd* pParent = NULL);	// ��׼���캯��

// �Ի�������
	enum { IDD = IDD_VIDEOANALYZER_DIALOG };

	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV ֧��


// ʵ��
protected:
	HICON m_hIcon;

	// ���ɵ���Ϣӳ�亯��
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnClose();
	DECLARE_MESSAGE_MAP()

public:
	CWMPPlayer4 m_player;        //�������ؼ�
	CWMPControls m_playerCtrl;   //������������
	const char * fileName;       //��Ƶ�ļ�·��
	CvCapture * capture;         //��Ƶ��ȡ�ṹ 
	CEdit  edit;                 //��Ϣ�༭��ؼ�
	CListCtrl list;				 //�����б�ؼ�	
    CString edit_content;        //��Ϣ����
    int line;					 //��Ϣ����
	VideoRun *con;				 //��Ƶ�������ö���
	
	int flag;					 //��־�߳��Ƿ�������
    void messageReport(CString content);     //��Ϣ��ʾ
	void clearAll();						 //��ԭ��ʼ��״̬

	afx_msg void OnBnClickedMfcbutton1();
	afx_msg void OnBnClickedMfcbutton2();
	afx_msg void OnBnClickedMfcbutton3();
	afx_msg void OnNMDblclkList2(NMHDR *pNMHDR, LRESULT *pResult);

};
