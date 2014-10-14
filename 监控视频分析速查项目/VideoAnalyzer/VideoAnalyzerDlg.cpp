
// VideoAnalyzerDlg.cpp : 实现文件
//

#include "stdafx.h"
#include "VideoAnalyzer.h"
#include "VideoAnalyzerDlg.h"

#include "afxdialogex.h"
#include <afxpriv.h>
#ifdef _DEBUG
#define new DEBUG_NEW
#endif

//全局变量
CvFont font;				 //字体
CvRect box;				     //矩形框
bool drawing_box;			 //是否正在画矩形框
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
			v->messageReport(_T("分析完成！"));
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
				box.width=x-box.x;		//设置矩形框宽度
				box.height=y-box.y;		//设置矩形框高度	
			}
		}
		break;
	case CV_EVENT_LBUTTONDOWN:
		{
			drawing_box=true;			//标志已经画了矩形
			box=cvRect(x,y,0,0);		//取得起始点坐标
		}
		break;
	case CV_EVENT_LBUTTONUP:
		{
			drawing_box=false;			//画完成		
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

// 用于应用程序“关于”菜单项的 CAboutDlg 对话框

class CAboutDlg : public CDialogEx
{
public:
	CAboutDlg();

// 对话框数据
	enum { IDD = IDD_ABOUTBOX };

	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV 支持

// 实现
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


// CVideoAnalyzerDlg 对话框



CVideoAnalyzerDlg::CVideoAnalyzerDlg(CWnd* pParent /*=NULL*/)
	: CDialogEx(CVideoAnalyzerDlg::IDD, pParent)
{
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CVideoAnalyzerDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);

	//关联控件
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
	ON_WM_CLOSE()						//重载关闭按钮
END_MESSAGE_MAP()


// CVideoAnalyzerDlg 消息处理程序

BOOL CVideoAnalyzerDlg::OnInitDialog()
{
	CDialogEx::OnInitDialog();

	// 将“关于...”菜单项添加到系统菜单中。

	// IDM_ABOUTBOX 必须在系统命令范围内。
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

	// 设置此对话框的图标。当应用程序主窗口不是对话框时，框架将自动
	//  执行此操作
	SetIcon(m_hIcon, TRUE);			// 设置大图标
	SetIcon(m_hIcon, FALSE);		// 设置小图标

	// TODO: 在此添加额外的初始化代码
	
	m_playerCtrl=m_player.get_controls();  //mplayer的控制器。
	line=0;								   //消框息框行数初始化为0
	edit.ShowScrollBar(SB_VERT);		   //消息滚动条
	
	list.SetExtendedStyle(LVS_EX_FULLROWSELECT|LVS_LIST);    //设置列表样式
	list.InsertColumn(0,_T("序号"),LVCFMT_LEFT, 50 );        //设置列表表头
	list.InsertColumn(1,_T("时间点"),LVCFMT_LEFT,115);
	
	return TRUE;  // 除非将焦点设置到控件，否则返回 TRUE
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

// 如果向对话框添加最小化按钮，则需要下面的代码
//  来绘制该图标。对于使用文档/视图模型的 MFC 应用程序，
//  这将由框架自动完成。

void CVideoAnalyzerDlg::OnPaint()
{
	if (IsIconic())
	{
		CPaintDC dc(this); // 用于绘制的设备上下文

		SendMessage(WM_ICONERASEBKGND, reinterpret_cast<WPARAM>(dc.GetSafeHdc()), 0);

		// 使图标在工作区矩形中居中
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// 绘制图标
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialogEx::OnPaint();
	}
}

//当用户拖动最小化窗口时系统调用此函数取得光标
//显示。
HCURSOR CVideoAnalyzerDlg::OnQueryDragIcon()
{
	return static_cast<HCURSOR>(m_hIcon);
}

//重载关闭图标
void CVideoAnalyzerDlg::OnClose()
{
	exit(0);
}

//消息框的消息显示
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
	edit.LineScroll(edit.GetLineCount());		//使消息置底
}



void CVideoAnalyzerDlg::OnBnClickedMfcbutton1()
{
	// TODO: 在此添加控件通知处理程序代码
	 CString FilePathName;						 //文件名

	 //打开文件对话框
	 CFileDialog dlg(TRUE,NULL,NULL, OFN_OVERWRITEPROMPT, _T("All files(*.*)|*.*|AVI files(*.avi)|*.avi|MP4 files(*.mp4)|*.mp4|MOV files(*.mov)|*.mov"));///TRUE为OPEN对话框，FALSE为SAVE AS对话框
	
	 if(dlg.DoModal()==IDOK)
	 { 
		 clearAll();							   	 //还原

		 FilePathName=dlg.GetPathName();			 //获得文件路径
		 messageReport(_T("打开：")+FilePathName);   //消息显示

		//cstring to const char＊  讲cstring类型转为char*　
		 FilePathName.Replace(_T("\\"),_T("\\\\"));   
		 USES_CONVERSION;
		 LPSTR lpszTest = T2A(FilePathName);
		 fileName =(const char*)lpszTest;


		 capture = cvCreateFileCapture(fileName);	//通过路径打开avi文件。
		 if (!capture)
		 {	

			 messageReport(_T("打开文件失败！"));		
			 return;
		 }
		 con = new VideoRun(capture);				//获得视频播放对象
		 messageReport(_T("视频长度：")+con->showTime());  //获取视频时间 

		 m_player.put_URL(FilePathName);			//在m_player控件上播放

	 }
}


void CVideoAnalyzerDlg::OnBnClickedMfcbutton2()
{ 
	// TODO: 在此添加控件通知处理程序代码

	
	if (!con)
	{	
			messageReport(_T("没有文件可选取！"));
			return;
	}
	
	//生成预览图引用
	IplImage *browse = cvCreateImage(cvSize(con->GetWidth(),con->GetHeight()),IPL_DEPTH_32F,3);
	if(!cvGrabFrame(capture))				 //抓取视频帧作为预览图对象
	{	
		messageReport(_T("选取失败！"));
		return;
	}
	browse = cvRetrieveFrame(capture);		 //取回抓取的头像，赋给预览引用。
	
	//显示预览图
	cvNamedWindow("预览",CV_WINDOW_AUTOSIZE);
	cvMoveWindow("预览",0,0);
	
	cvInitFont(&font,CV_FONT_HERSHEY_SIMPLEX,0.4,0.4,0,1,8);  //生成字体
	
	
	IplImage* temp=cvCloneImage(browse);
	
	//设置回调函数
	cvSetMouseCallback("预览",(CvMouseCallback)my_mouse_callback);
	messageReport(_T("预览中..."));
	while(1)
	{
		//cvCopy(image,temp); 
		if(drawing_box) 
		{
			cvCopy(browse,temp); //显示新图
			//显示矩形框
			cvRectangle(temp,cvPoint(box.x,box.y),cvPoint(box.x+box.width,box.y+box.height),cvScalar(0x00,0x00,0xff),2);
			char s1[32];
			char s2[32];
			sprintf(s1,"(%d,%d)",box.x,box.y);
			sprintf(s2,"%d",box.y);
			//显示坐标
			cvPutText(temp,s1,cvPoint(box.x,box.y),&font,CV_RGB(0,0,255));	

		}
		cvShowImage("预览",temp);
		if(cvWaitKey(1)==27) 
		{   
			if(box.width==box.height && box.width==0)
			{
				messageReport(_T("选取区域失败！请重新选取区域"));
				cvDestroyWindow("预览");
				break;
			}
			else
			{
				//设置感兴趣区域
				con->setRect(box.x,box.y,box.width,box.height);
				CString s;
				s.Format(_T("  坐标点(%d,%d) \r\n  宽度%d\t高度%d"),box.x,box.y,box.width,box.height);
				messageReport(_T("选取区域为：\r\n")+s);
				box_choosed=true;
				cvDestroyWindow("预览");
				break;
			}
		}
	}
	
}



void CVideoAnalyzerDlg::OnBnClickedMfcbutton3()
{
	// TODO: 在此添加控件通知处理程序代码
	
	if(!con)
	{
			messageReport(_T("请先打开文件并选取区域！"));
			return;
	}
	if(box_choosed==false)
	{
		messageReport(_T("请先选取区域！"));
		return;
	}
	messageReport(_T("视频分析中..."));
	flag=1;//标志run 线程的运行状态，为0时线程退出
	AfxBeginThread(threadRun,this,0,0,0,NULL);
	AfxBeginThread(threadMsg,this,1,0,0,NULL);
	
}



void CVideoAnalyzerDlg::OnNMDblclkList2(NMHDR *pNMHDR, LRESULT *pResult)
{
	LPNMITEMACTIVATE pNMItemActivate = reinterpret_cast<LPNMITEMACTIVATE>(pNMHDR);
		*pResult = 0;
	// TODO: 在此添加控件通知处理程序代码
		int n =con->GetCi();
		for (int i=0;i<n;i++)
		{
			if(list.GetItemState(i, LVIS_SELECTED) == LVIS_SELECTED)
				m_playerCtrl.put_currentPosition(con->GetTs(i+1)-2);
		}

}
