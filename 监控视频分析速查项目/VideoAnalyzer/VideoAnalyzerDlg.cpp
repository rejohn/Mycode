
// VideoAnalyzerDlg.cpp : ʵ���ļ�
//

#include "stdafx.h"
#include "VideoAnalyzer.h"
#include "VideoAnalyzerDlg.h"

#include "afxdialogex.h"
#include <afxpriv.h>
#ifdef _DEBUG
#define new DEBUG_NEW
#endif

//ȫ�ֱ���
CvFont font;				 //����
CvRect box;				     //���ο�
bool drawing_box;			 //�Ƿ����ڻ����ο�
bool box_choosed = false;			 
UINT threadRun(LPVOID pParam)
{
	CVideoAnalyzerDlg* v=(CVideoAnalyzerDlg*)pParam;
	v->con->Run();
	v->flag=0;
	return 0;
}
UINT threadMsg(LPVOID pParam)
{
	
	CVideoAnalyzerDlg* v=(CVideoAnalyzerDlg*)pParam;
	
	int pre = v->con->GetCi();
	int count=0;
	CString s;
	CString tem;
	while(1)
	{
		int now = v->con->GetCi();
		if(pre!=now )
		{
			for (int i=pre;i<now;i++)
			{	
				tem=v->con->showTime(v->con->GetTs(i+1));
				v->messageReport(tem);
				s.Format(_T("%d"),count);
				v->list.InsertItem(count,s);
				v->list.SetItemText(count,1,tem);
				count++;
			}
			pre=now;
			
		}
		if(v->flag==0)
		{
			v->messageReport(_T("������ɣ�"));
			break;
		}
	}
	return 0;
}
void my_mouse_callback(int event,int x,int y,int flags,void* param)
{
	switch(event)
	{
	case CV_EVENT_MOUSEMOVE:
		{
			if(drawing_box)
			{
				box.width=x-box.x;		//���þ��ο���
				box.height=y-box.y;		//���þ��ο�߶�	
			}
		}
		break;
	case CV_EVENT_LBUTTONDOWN:
		{
			drawing_box=true;			//��־�Ѿ����˾���
			box=cvRect(x,y,0,0);		//ȡ����ʼ������
		}
		break;
	case CV_EVENT_LBUTTONUP:
		{
			drawing_box=false;			//�����		
		}
		break;
	}
}
void  CVideoAnalyzerDlg::clearAll()
{
	edit_content="";
	list.DeleteAllItems();
	line=0;

	con=NULL;
	capture=NULL;
	fileName="";
	

}

// ����Ӧ�ó��򡰹��ڡ��˵���� CAboutDlg �Ի���

class CAboutDlg : public CDialogEx
{
public:
	CAboutDlg();

// �Ի�������
	enum { IDD = IDD_ABOUTBOX };

	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV ֧��

// ʵ��
protected:
	DECLARE_MESSAGE_MAP()
};

CAboutDlg::CAboutDlg() : CDialogEx(CAboutDlg::IDD)
{
}

void CAboutDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
}

BEGIN_MESSAGE_MAP(CAboutDlg, CDialogEx)
END_MESSAGE_MAP()


// CVideoAnalyzerDlg �Ի���



CVideoAnalyzerDlg::CVideoAnalyzerDlg(CWnd* pParent /*=NULL*/)
	: CDialogEx(CVideoAnalyzerDlg::IDD, pParent)
{
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CVideoAnalyzerDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);

	//�����ؼ�
	DDX_Control(pDX,IDC_OCX1,m_player);
	DDX_Control(pDX,IDC_LIST2,list);
	DDX_Control(pDX,IDC_EDIT1,edit);

}

BEGIN_MESSAGE_MAP(CVideoAnalyzerDlg, CDialogEx)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_BN_CLICKED(IDC_MFCBUTTON1, &CVideoAnalyzerDlg::OnBnClickedMfcbutton1)
	ON_BN_CLICKED(IDC_MFCBUTTON2, &CVideoAnalyzerDlg::OnBnClickedMfcbutton2)
	ON_BN_CLICKED(IDC_MFCBUTTON3, &CVideoAnalyzerDlg::OnBnClickedMfcbutton3)
	ON_NOTIFY(NM_DBLCLK, IDC_LIST2, &CVideoAnalyzerDlg::OnNMDblclkList2)
	ON_WM_CLOSE()						//���عرհ�ť
END_MESSAGE_MAP()


// CVideoAnalyzerDlg ��Ϣ�������

BOOL CVideoAnalyzerDlg::OnInitDialog()
{
	CDialogEx::OnInitDialog();

	// ��������...���˵�����ӵ�ϵͳ�˵��С�

	// IDM_ABOUTBOX ������ϵͳ���Χ�ڡ�
	ASSERT((IDM_ABOUTBOX & 0xFFF0) == IDM_ABOUTBOX);
	ASSERT(IDM_ABOUTBOX < 0xF000);

	CMenu* pSysMenu = GetSystemMenu(FALSE);
	if (pSysMenu != NULL)
	{
		BOOL bNameValid;
		CString strAboutMenu;
		bNameValid = strAboutMenu.LoadString(IDS_ABOUTBOX);
		ASSERT(bNameValid);
		if (!strAboutMenu.IsEmpty())
		{
			pSysMenu->AppendMenu(MF_SEPARATOR);
			pSysMenu->AppendMenu(MF_STRING, IDM_ABOUTBOX, strAboutMenu);
		}
	}

	// ���ô˶Ի����ͼ�ꡣ��Ӧ�ó��������ڲ��ǶԻ���ʱ����ܽ��Զ�
	//  ִ�д˲���
	SetIcon(m_hIcon, TRUE);			// ���ô�ͼ��
	SetIcon(m_hIcon, FALSE);		// ����Сͼ��

	// TODO: �ڴ���Ӷ���ĳ�ʼ������
	
	m_playerCtrl=m_player.get_controls();  //mplayer�Ŀ�������
	line=0;								   //����Ϣ��������ʼ��Ϊ0
	edit.ShowScrollBar(SB_VERT);		   //��Ϣ������
	
	list.SetExtendedStyle(LVS_EX_FULLROWSELECT|LVS_LIST);    //�����б���ʽ
	list.InsertColumn(0,_T("���"),LVCFMT_LEFT, 50 );        //�����б��ͷ
	list.InsertColumn(1,_T("ʱ���"),LVCFMT_LEFT,115);
	
	return TRUE;  // ���ǽ��������õ��ؼ������򷵻� TRUE
}

void CVideoAnalyzerDlg::OnSysCommand(UINT nID, LPARAM lParam)
{
	if ((nID & 0xFFF0) == IDM_ABOUTBOX)
	{
		CAboutDlg dlgAbout;
		dlgAbout.DoModal();
	}
	else
	{
		CDialogEx::OnSysCommand(nID, lParam);
	}
}

// �����Ի��������С����ť������Ҫ����Ĵ���
//  �����Ƹ�ͼ�ꡣ����ʹ���ĵ�/��ͼģ�͵� MFC Ӧ�ó���
//  �⽫�ɿ���Զ���ɡ�

void CVideoAnalyzerDlg::OnPaint()
{
	if (IsIconic())
	{
		CPaintDC dc(this); // ���ڻ��Ƶ��豸������

		SendMessage(WM_ICONERASEBKGND, reinterpret_cast<WPARAM>(dc.GetSafeHdc()), 0);

		// ʹͼ���ڹ����������о���
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// ����ͼ��
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialogEx::OnPaint();
	}
}

//���û��϶���С������ʱϵͳ���ô˺���ȡ�ù��
//��ʾ��
HCURSOR CVideoAnalyzerDlg::OnQueryDragIcon()
{
	return static_cast<HCURSOR>(m_hIcon);
}

//���عر�ͼ��
void CVideoAnalyzerDlg::OnClose()
{
	exit(0);
}

//��Ϣ�����Ϣ��ʾ
void CVideoAnalyzerDlg::messageReport(CString content)
{
	line++;
	CString temp;
	temp.Format(_T("%d"),line);
	edit_content+= temp;
	edit_content+=" ";
	edit_content+=content;
	edit_content+="\r\n";
	


	edit.SetWindowTextW(edit_content);
	edit.LineScroll(edit.GetLineCount());		//ʹ��Ϣ�õ�
}



void CVideoAnalyzerDlg::OnBnClickedMfcbutton1()
{
	// TODO: �ڴ���ӿؼ�֪ͨ����������
	 CString FilePathName;						 //�ļ���

	 //���ļ��Ի���
	 CFileDialog dlg(TRUE,NULL,NULL, OFN_OVERWRITEPROMPT, _T("All files(*.*)|*.*|AVI files(*.avi)|*.avi|MP4 files(*.mp4)|*.mp4|MOV files(*.mov)|*.mov"));///TRUEΪOPEN�Ի���FALSEΪSAVE AS�Ի���
	
	 if(dlg.DoModal()==IDOK)
	 { 
		 clearAll();							   	 //��ԭ

		 FilePathName=dlg.GetPathName();			 //����ļ�·��
		 messageReport(_T("�򿪣�")+FilePathName);   //��Ϣ��ʾ

		//cstring to const char��  ��cstring����תΪchar*��
		 FilePathName.Replace(_T("\\"),_T("\\\\"));   
		 USES_CONVERSION;
		 LPSTR lpszTest = T2A(FilePathName);
		 fileName =(const char*)lpszTest;


		 capture = cvCreateFileCapture(fileName);	//ͨ��·����avi�ļ���
		 if (!capture)
		 {	

			 messageReport(_T("���ļ�ʧ�ܣ�"));		
			 return;
		 }
		 con = new VideoRun(capture);				//�����Ƶ���Ŷ���
		 messageReport(_T("��Ƶ���ȣ�")+con->showTime());  //��ȡ��Ƶʱ�� 

		 m_player.put_URL(FilePathName);			//��m_player�ؼ��ϲ���

	 }
}


void CVideoAnalyzerDlg::OnBnClickedMfcbutton2()
{ 
	// TODO: �ڴ���ӿؼ�֪ͨ����������

	
	if (!con)
	{	
			messageReport(_T("û���ļ���ѡȡ��"));
			return;
	}
	
	//����Ԥ��ͼ����
	IplImage *browse = cvCreateImage(cvSize(con->GetWidth(),con->GetHeight()),IPL_DEPTH_32F,3);
	if(!cvGrabFrame(capture))				 //ץȡ��Ƶ֡��ΪԤ��ͼ����
	{	
		messageReport(_T("ѡȡʧ�ܣ�"));
		return;
	}
	browse = cvRetrieveFrame(capture);		 //ȡ��ץȡ��ͷ�񣬸���Ԥ�����á�
	
	//��ʾԤ��ͼ
	cvNamedWindow("Ԥ��",CV_WINDOW_AUTOSIZE);
	cvMoveWindow("Ԥ��",0,0);
	
	cvInitFont(&font,CV_FONT_HERSHEY_SIMPLEX,0.4,0.4,0,1,8);  //��������
	
	
	IplImage* temp=cvCloneImage(browse);
	
	//���ûص�����
	cvSetMouseCallback("Ԥ��",(CvMouseCallback)my_mouse_callback);
	messageReport(_T("Ԥ����..."));
	while(1)
	{
		//cvCopy(image,temp); 
		if(drawing_box) 
		{
			cvCopy(browse,temp); //��ʾ��ͼ
			//��ʾ���ο�
			cvRectangle(temp,cvPoint(box.x,box.y),cvPoint(box.x+box.width,box.y+box.height),cvScalar(0x00,0x00,0xff),2);
			char s1[32];
			char s2[32];
			sprintf(s1,"(%d,%d)",box.x,box.y);
			sprintf(s2,"%d",box.y);
			//��ʾ����
			cvPutText(temp,s1,cvPoint(box.x,box.y),&font,CV_RGB(0,0,255));	

		}
		cvShowImage("Ԥ��",temp);
		if(cvWaitKey(1)==27) 
		{   
			if(box.width==box.height && box.width==0)
			{
				messageReport(_T("ѡȡ����ʧ�ܣ�������ѡȡ����"));
				cvDestroyWindow("Ԥ��");
				break;
			}
			else
			{
				//���ø���Ȥ����
				con->setRect(box.x,box.y,box.width,box.height);
				CString s;
				s.Format(_T("  �����(%d,%d) \r\n  ���%d\t�߶�%d"),box.x,box.y,box.width,box.height);
				messageReport(_T("ѡȡ����Ϊ��\r\n")+s);
				box_choosed=true;
				cvDestroyWindow("Ԥ��");
				break;
			}
		}
	}
	
}



void CVideoAnalyzerDlg::OnBnClickedMfcbutton3()
{
	// TODO: �ڴ���ӿؼ�֪ͨ����������
	
	if(!con)
	{
			messageReport(_T("���ȴ��ļ���ѡȡ����"));
			return;
	}
	if(box_choosed==false)
	{
		messageReport(_T("����ѡȡ����"));
		return;
	}
	messageReport(_T("��Ƶ������..."));
	flag=1;//��־run �̵߳�����״̬��Ϊ0ʱ�߳��˳�
	AfxBeginThread(threadRun,this,0,0,0,NULL);
	AfxBeginThread(threadMsg,this,1,0,0,NULL);
	
}



void CVideoAnalyzerDlg::OnNMDblclkList2(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMITEMACTIVATE pNMItemActivate = reinterpret_cast<LPNMITEMACTIVATE>(pNMHDR);
		*pResult = 0;
	// TODO: �ڴ���ӿؼ�֪ͨ����������
		int n =con->GetCi();
		for (int i=0;i<n;i++)
		{
			if(list.GetItemState(i, LVIS_SELECTED) == LVIS_SELECTED)
				m_playerCtrl.put_currentPosition(con->GetTs(i+1)-2);
		}

}
