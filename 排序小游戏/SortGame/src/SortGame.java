
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import sun.audio.*; 
import java.io.*;
import javax.swing.*;
import java.util.*;

public class SortGame extends JFrame{
	
	private static final long serialVersionUID = 1L;//   ���˾Ͳ�����= =����
	private Vector<String>optionalNum=new Vector<String>();//���ڳ�ʼ��
	private JPanel p=new JPanel();
	CardLayout card=new CardLayout();
	private JButton b[]=new JButton[25];//��ť
	static int ButtonNum[] =new int [25]; //��ť�ϵ��� �հ�ťΪ0
	int counter=0;
	public  static JLabel timesLabel=new JLabel();//��ʾ���ò�����
	private JMenuBar mBar ;
	Timer t=new Timer();
	JMenu[] m={new JMenu("��ʼ"),new  JMenu("�ȼ�"),new JMenu("����"),new JMenu("���а�")};//�˵�
	static int Level = 3;//Ĭ��Ϊ3��3Ϊ�ͼ���4Ϊ�м���5Ϊ�߼�
	JMenuItem[] m1 ={new JMenuItem("������Ϸ(R)"),new JMenuItem ("�˳�(E)")};
	JMenuItem[] m2 ={new JMenuItem("����(3X3)"),new JMenuItem("�м�(4X4)"),new JMenuItem("�߼�(5X5)")};
	JMenuItem[] m3 ={new JMenuItem("��������(A)")};
	JMenuItem[] m4= {new JMenuItem("�鿴���а�(P)"),new JMenuItem("��ʼ�����а�(I)")};
	
	
	public SortGame() throws ClassNotFoundException, InstantiationException, IllegalAccessException, UnsupportedLookAndFeelException, IOException{
		super("����С��Ϸ");
		//UIManager.setLookAndFeel("javax.swing.plaf.nimbus.NimbusLookAndFeel");//�ı����
		//javax.swing.plaf.metal.MetalLookAndFeel
		//javax.swing.plaf.nimbus.NimbusLookAndFeel
		//com.sun.java.swing.plaf.motif.MotifLookAndFeel
		//com.sun.java.swing.plaf.windows.WindowsLookAndFeel
		//com.sun.java.swing.plaf.windows.WindowsClassicLookAndFeel  �ҵĵ����ϵĿ�ѡ�Ľ�����

		addMenu();
		timesLabel.setText("��ʼ��Ϸ�ɣ���");
		init();//��ʼ������
		t.start();
		
	}
	
	
	private void init(){
		p.removeAll();
		
		timesLabel.setHorizontalAlignment(JLabel.CENTER);//���־���
		Container c=getContentPane();
		c.setLayout(new BorderLayout());	 
		 p.setLayout(new GridLayout(Level,Level));	 
		 p.setBackground(Color.gray);
		 c.add(p,BorderLayout.CENTER);//�����Ϸ���
		 c.add(timesLabel,BorderLayout.SOUTH);//��ӼƲ���
		 addButton();	
	  	 addKeyControl();
		
	}
	
	
	private void addMenu(){
		mBar=new JMenuBar();
		setJMenuBar(mBar);//��Ӳ˵�
		
		//���ÿ�ݼ�
	     m1[0].setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_R,ActionEvent.CTRL_MASK));
	     m1[1].setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_E,ActionEvent.CTRL_MASK));
	     m2[0].setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_3,ActionEvent.CTRL_MASK));
	     m2[1].setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_4,ActionEvent.CTRL_MASK));
	     m2[2].setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_5,ActionEvent.CTRL_MASK));
	     m3[0].setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_A,ActionEvent.CTRL_MASK));
	     m4[0].setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_P,ActionEvent.CTRL_MASK));

		//����Ӳ˵�
		m[0].add(m1[0]);
		m[0].add(m1[1]);
		m[1].add(m2[0]);
		m[1].add(m2[1]);
		m[1].add(m2[2]);
		m[2].add(m3[0]);	
		m[3].add(m4[0]);
		m[3].add(m4[1]);
	
		
		for (int i=0;i<=3;i++)
			mBar.add(m[i]);
		//��Ӳ˵��¼�
	
		m1[0].addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent e) {		 
				counter=0;

				init();
			}	
		}
		);//end addActionListener
		m1[1].addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent e) {
			 	System.exit(0);
			}	
		}
		);//end addActionListener
		m2[0].addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent e) 
			{
			    
				setSize(400, 420);
				 counter=0;
			 	Level=3;
			 	init();
			}	
		}
		);//end addActionListener
		m2[1].addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent e) {
				counter=0;
				setSize(550, 570);
			 	Level=4;
			 	init();
			}	
		}
		);//end addActionListener
		m2[2].addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent e) { 
				setSize(700, 720);
				counter=0;
			 	Level=5;
			 	init();
			}	
		}
		);//end addActionListener
		m3[0].addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent e) {
				initHelp();
			
			}	
		}
		);//end addActionListener
		
		m4[0].addActionListener(new ActionListener(){
	

			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				try {
					Showrank();
				} catch (IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		}

		);//end addActionListener
		m4[1].addActionListener(new ActionListener(){
			

			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub

					try {
						initrank();
					} catch (IOException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
			
			}
		}
		);//end addActionListener
	}
	
	
	private void addButton(){//���������Ӱ�ť  �� ��� �¼�����
		for(int i=0; i<Level*Level; i++) {
			b[i] = new JButton();
			b[i].setFont(new Font("Segoe Script",Font.BOLD,35));
			b[i].addActionListener( new ActionListener(){
					
					public void actionPerformed(ActionEvent e) {
						int num =-1;//��¼�����¼���ť�ϵ�����
						int location = -1; //��¼�����¼��İ�ť
						int aim = -1;  //�հ�ť��Ҫ�����ֹ�ȥ
						int i=0;		
						if (e.getActionCommand()!="")//��հ�ť�����¼�����
						{num = Integer.parseInt(e.getActionCommand());		
						while(i<Level*Level){
							if(num == ButtonNum[i++]){
								location = i-1;
						        break;
							}
						}
					
						int candidates[] = {location-1, location+1, location-Level, location+Level};//�����ƶ��ĸ�����
						for (int k=0;k<Level;k++)
						{
							if (location==Level*k){
								candidates[0] = -1;  //   �۳��������Ƶ�
								break;
							}
							else if (location==Level*(k+1)-1){
								 candidates[1] = -1; //   �۳��������Ƶ�
								break;
							}	
						}
						for(int j=0; j<4; j++){//�ҳ��հ�ť
							if(check(candidates[j]))
								aim = candidates[j];
						}
		
						if(aim >= 0 && aim < Level*Level){
							
						  try {
							MoveButton(aim,location);
						} catch (IOException e1) {
							// TODO Auto-generated catch block
							e1.printStackTrace();
						}				     //��ť�ƶ�
					
						}

						if(evaluate()){
							try {
								showend();
							} catch (IOException e1) {
								// TODO Auto-generated catch block
								e1.printStackTrace();
							}	
						}
					}				
					}//end actionPerformed
					}	
					);//end addActionLIstener
			p.add(b[i]);		
			//ButtonNum[i] = 0;
		}
		b[0].requestFocus();
		initButton();
		while (!checkValid()){//�����������Ļ������³�ʼ��
			initButton();
		}
	}
	

	private void initButton(){//�����ʼ����ť
		timesLabel.setVisible(true);
		for(int i=0; i<Level*Level; i++) {
			optionalNum.add(String.valueOf(i));
		}
		int index = -1;
		String str = null;
		for(int i=0; i<Level*Level; i++){
			index = (int)(Math.random()*optionalNum.size());//������0��������С-1����
			str = optionalNum.get(index);
			if(str.equals("0")){
			    b[i].setText("");
			    ButtonNum[i] = 0;
			}
			else {
			  b[i].setText(str);
			    ButtonNum[i] = Integer.parseInt(str) ;

			}
			optionalNum.remove(index);
		}	
		t.startTime = System.currentTimeMillis();  
    
	}//initButton
	
	
	private boolean check(int index) {//�ж��Ƿ�Ϊ�հ�ť
		if(index >= 0 && index < Level*Level && ButtonNum[index] == 0)
			return true;
		else
		    return false;
	}
	
	
	private void addKeyControl(){
		for(int i=0; i<Level*Level; i++) {
			b[i].addKeyListener(new KeyAdapter(){
			
				public void keyPressed(KeyEvent a) {
					int empty=findEmpty();
					b[empty].requestFocus();//���ý���

				
					int activebutton=-1;
					if (a.getKeyCode()==KeyEvent.VK_UP)
						{
					     	System.out.println(empty);
							activebutton=empty+Level;
							if (activebutton<Level*Level)
							{	System.out.println("active"+activebutton);
								try {
									MoveButton(empty,activebutton);
								} catch (IOException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								}
							}
						}
					if (a.getKeyCode()==KeyEvent.VK_DOWN)
					{
						System.out.println(empty);
						activebutton=empty-Level;
						if (activebutton>=0)
						{	System.out.println("active"+activebutton);
						try {
							MoveButton(empty,activebutton);
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
					}
					if (a.getKeyCode()==KeyEvent.VK_RIGHT)
					{
						System.out.println(empty);
						activebutton=empty-1;
						if (empty%Level!=0)
						{	System.out.println("active"+activebutton);
						try {
							MoveButton(empty,activebutton);
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
					}
					if (a.getKeyCode()==KeyEvent.VK_LEFT)
					{
						//System.out.println(empty);
						activebutton=empty+1;
						if (activebutton%Level!=0)
						{	//System.out.println("active"+activebutton);
						try {
							MoveButton(empty,activebutton);
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
					
					}
					if(evaluate()){
						try {
							showend();
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}	
					}
				}
			});//end addkeyListener
		}
	}
	
	
	public static  boolean evaluate() {//�ж���Ϸ�Ƿ����
		int i,j;
		for(i=0; i<Level*Level; i++){
			if(ButtonNum[i] != i)
				break;
		}
		if(i == Level*Level)  return true;
		
		for(i=0; i<Level*Level-1; i++){
			if(ButtonNum[i] != i+1)
				break;
		}
		if(i ==Level*Level-1)  return true;
		
		for(i=0,j=Level*Level-1; j>=0; i++,j--){
			if(ButtonNum[j] != i)
				break;
		}
		if(i == Level*Level)  return true;
		
		for(i=0,j=Level*Level-1; j>0; i++,j--){
			if(ButtonNum[j] != i+1)
				break;
		}
		if(i == Level*Level-1)  return true;
		
		return false;
	}
	
	
	boolean checkValid(){//�ж����ɵ������ܷ񾭹��ƶ�������ɹ���
		int c=0;
		int d=0;
		for (int i=0;i<Level*Level;i++)
			{if (ButtonNum[i]==0)
				d=i;
			for(int j=i+1;j<Level*Level;j++)
				if (ButtonNum[i]>ButtonNum[j])
					c++;
			}
		System.out.println(c-d);
		if ((c-d) % 2==0)
		   return true;
		else 
			return false;
	}
	
	
	
	private void initHelp(){
		p.removeAll();
		p.setLayout(new BorderLayout());
		timesLabel.setVisible(false);
		setSize(600,600);
     	ImageIcon background = new ImageIcon("about.jpg");//����ͼƬ
     	JLabel label = new JLabel(background);//�ѱ���ͼƬ��ʾ��һ����ǩ����
		p.add(label);
		
	}

	
	private void showend() throws IOException{
		String Filename="2488.wav";//��Ч
		InputStream in = new FileInputStream(Filename);
		AudioStream sound= new AudioStream(in);

		
		String Filename2="2495.wav";//��Ч
		InputStream in2 = new FileInputStream(Filename2);
		AudioStream sound2= new AudioStream(in2);
		
		
		String s=t.time;
		int choice;
	if (rank(s))
	{
		AudioPlayer.player.start(sound2);
		
		 choice = JOptionPane.showConfirmDialog(null, "�����ʱ��:"+s+"\n�ð������˼�¼������Ҫ�ټ�����ս��",null,JOptionPane.YES_NO_OPTION);
	}
	else
		{
		AudioPlayer.player.start(sound);
		
		choice = JOptionPane.showConfirmDialog(null, "�����ʱ��:"+s+"\n��Ȼû�Ƽ�¼�����ټ�����ս��",null,JOptionPane.YES_NO_OPTION);
		}
	
	
	if(choice == JOptionPane.YES_OPTION)
	    {
	    //	timesLabel.setText("��ʼ��Ϸ�ɣ���");
	      //  counter=0;
	    	initButton();
			while (!checkValid()){//�����������Ļ������³�ʼ��
				initButton();
			}
	    }
	    else
	    	System.exit(0);
	}
	
	private void initrank() throws IOException{//��ʼ�����а�
		BufferedWriter  bw = new BufferedWriter(new FileWriter("rank.txt"));
		String str =new String("99:99:99");
		bw.write(str);
		bw.newLine();
	    bw.write(str);
	    bw.newLine();
	    bw.write(str);
	    bw.flush();
		bw.close();
		Showrank();
	}
	
	
	private void Showrank() throws IOException{//���а�
		p.removeAll();
		p.setBackground(Color.white);
		timesLabel.setVisible(false);
		
		String s3="������3X3�������ʱ���ǣ�"+getLevel3();
		String s4="�м���4X4�������ʱ���ǣ�"+getLevel4();
		String s5="�߼���5X5�������ʱ���ǣ�"+getLevel5();
		 
		JLabel L3=new JLabel(s3,JLabel.CENTER);
		JLabel L4=new JLabel(s4,JLabel.CENTER);
		JLabel L5=new JLabel(s5,JLabel.CENTER);
		
		L3.setFont(new Font("����",Font.BOLD, Level*4));
		L4.setFont(new Font("����",Font.BOLD,Level*4));
		L5.setFont(new Font("����",Font.BOLD, Level*4));
		
		
		L3.setBackground(Color.gray);
		L4.setBackground(Color.gray);
		L5.setBackground(Color.gray);
		
		p.add(L3,BorderLayout.NORTH);
		p.add(L4,BorderLayout.CENTER);
		p.add(L5,BorderLayout.SOUTH);

		
	}
	
	private int findEmpty(){//�ҿհ�ť
		int empty=-1;
		for (int i=0;i<Level*Level;i++)
		{

			if (b[i].getActionCommand().equals(""))
				empty=i;
			
		}
		return empty;
	}
	
	
	
	private void MoveButton(int emptykey,int movekey) throws IOException
	{
		counter++;
		//    timesLabel.setText("���Ѿ�����"+counter+"��");		
	    //��ť�ƶ�

		String tempStr = b[movekey].getText(); 
		int tempNum = ButtonNum[movekey];
		b[movekey].setText("");
		ButtonNum[movekey] = 0;
		b[emptykey].setText(tempStr);
		ButtonNum[emptykey] = tempNum;
		
		String Filename="844.WAV";//��Ч
		InputStream in = new FileInputStream(Filename);
		AudioStream sound= new AudioStream(in);
		AudioPlayer.player.start(sound);
	}
	
	
	private boolean  rank(String s){
		boolean Flag=false;
		try
		{
			int n = 1;
			BufferedReader  in = new BufferedReader(new FileReader("rank.txt"));
			String str[] = new String[5];
			String ss=new String();
			while((ss=in.readLine())!=null){
			  // System.out.println(ss);
			   str[n]=ss;
			   n++;// if(<0)
		   }
		   if(s.compareTo(str[Level-2])<0)
		   { str[Level-2]=s;Flag=true;}
		   
		     // System.out.println(s);
		     // System.out.println(str[Level-2]);
		    in.close();
		    BufferedWriter  bw = new BufferedWriter(new FileWriter("rank.txt"));
			bw.write(str[1]);
			bw.newLine();
		    bw.write(str[2]);
		    bw.newLine();
		    bw.write(str[3]); 
		    bw.flush(); 
			bw.close();
		
	   
		 }catch(IOException e){
			      System.err.println("�����쳣"+e);
			      e.printStackTrace();
		       }
		return Flag;
		
	}
	
	private String  getLevel3() throws IOException{
		BufferedReader  in = new BufferedReader(new FileReader("rank.txt"));
		 String ss1=new String();
		 ss1=in.readLine();
		 in.close();
		 return ss1;
		
	} 
	private String  getLevel4() throws IOException{
		BufferedReader  in = new BufferedReader(new FileReader("rank.txt"));

		 String ss2=new String();
		 ss2=in.readLine();
		 ss2=in.readLine();
		 in.close();
		 return ss2;
		
	} 
	
	private String  getLevel5() throws IOException{
		BufferedReader  in = new BufferedReader(new FileReader("rank.txt"));
		 String ss3=new String();
		 ss3=in.readLine();
		 ss3=in.readLine();
		 ss3=in.readLine();
		 in.close();
		 return ss3;
		
	} 
	

	


}//end public class
class  Timer extends Thread{
    public long startTime ;  
    public String time ;
    public  long longtime ;
	public void run(){ //��ʱ��
		 
	      startTime = System.currentTimeMillis();  
	     while(true){  
	          longtime = (System.currentTimeMillis()-startTime)/1000;  
	        time = String.format("%02d:%02d:%02d", longtime/3600,longtime/60,longtime%60);  
	       SortGame. timesLabel.setText("�㵱ǰ����ʱ�䣺"+ time);
	         try {  
	             Thread.sleep(1000);  
	         } catch (InterruptedException e) {  
	             e.printStackTrace();  
	         }  
	     }  
	 }  //end run
}





