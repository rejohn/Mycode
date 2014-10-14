using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApplication2
{
    public partial class Form1 : Form
    {
        DateTime zero = Convert.ToDateTime("2013-10-28 00:00:00");
        DateTime time;
        DateTime time2;
        int cishu = 0;
        bool flag = true;
        
        
        


        
        public Form1()
        {
            InitializeComponent();
            
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

       

        private void button6_Click(object sender, EventArgs e)
        {
            time = time.AddSeconds(-1);
            label1.Text = time.ToString("HH:mm:ss");
        }

       

        private void Form1_Load(object sender, EventArgs e)
        {
            timer1.Interval = 1000;
            time = zero.AddSeconds(13);
            
            
      
            label1.Text = time.ToString("HH:mm:ss");
            

        }

        private void button7_Click(object sender, EventArgs e)
        {
            
            if (button7.Text == "开始")
            {
                if (flag==true)
                {
                    if (time.ToLongTimeString() == zero.ToLongTimeString())
                    {
                        time = zero.AddSeconds(-1);
                    }
                    time2 = time;
                    flag = false;
                    label3.Text = time2.ToString("HH:mm:ss");
                }
                button7.Text = "暂停";
                button1.Enabled = false;
                button2.Enabled = false;
                button3.Enabled = false;
                button4.Enabled = false;
                button5.Enabled = false;
                button6.Enabled = false;
                timer1.Enabled = true;
                
 
            }
            else if (button7.Text == "暂停")
            {
                button7.Text = "开始";
                timer1.Enabled = false;
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            time=time.AddSeconds(1);
           
            label1.Text = time.ToString("HH:mm:ss");
        }

        private void button1_Click(object sender, EventArgs e)
        {
            time=time.AddHours(1);
            label1.Text = time.ToString("HH:mm:ss");
        }

        private void button4_Click(object sender, EventArgs e)
        {
            time = time.AddHours(-1);
            label1.Text = time.ToString("HH:mm:ss");
        }

        private void button2_Click(object sender, EventArgs e)
        {
            time = time.AddMinutes(1);
            label1.Text = time.ToString("HH:mm:ss");
        }

        private void button5_Click(object sender, EventArgs e)
        {
            time = time.AddMinutes(-1);
            label1.Text = time.ToString("HH:mm:ss");
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            
            if (time.ToLongTimeString() == zero.ToLongTimeString())
            {
              
                System.Media.SystemSounds.Exclamation.Play(); 
         
               
                cishu++;
                time = time2;
                label7.Text = cishu.ToString();
                label1.Text = time.ToString("HH:mm:ss");
 
            }
            time = time.AddSeconds(-1);
            label1.Text = time.ToString("HH:mm:ss");
            
        }

        private void button8_Click(object sender, EventArgs e)
        {
            if( MessageBox.Show( "确定重置吗？", "提示", MessageBoxButtons.YesNo ) == DialogResult.Yes )
            {
                time = time2 = Convert.ToDateTime("2013-10-28 00:00:13");
                
                label1.Text = time.ToString("HH:mm:ss");
                button7.Text = "开始";
                button1.Enabled = true;
                button2.Enabled = true;
                button3.Enabled = true;
                button4.Enabled = true;
                button5.Enabled = true;
                button6.Enabled = true;

                timer1.Enabled = false;
                cishu = 0;
                flag = true;
                label3.Text = "00:00:00";
                label7.Text = cishu.ToString();
            }
            

        }
        private void label1_MouseWheel(object sender, MouseEventArgs e)
        {
            if (e.Delta > 0)
            {
                time = time.AddSeconds(1);
                label1.Text = time.ToString("HH:mm:ss");
            }
            else
            {
                time = time.AddSeconds(-1);
                label1.Text = time.ToString("HH:mm:ss");
            }
 
        }
     

        private void label1_Click(object sender, EventArgs e)
        {
            this.label1.Focus();
        }
    }
}
