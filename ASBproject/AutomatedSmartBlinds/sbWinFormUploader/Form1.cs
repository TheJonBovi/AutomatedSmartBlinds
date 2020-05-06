using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.IO;
using System.Threading.Tasks;
using System.Windows.Forms;


namespace sbWinFormUploader
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void UploadFile(string filename)
        {
            try
            {
                // get the exact file name from the path  
                String strFile = System.IO.Path.GetFileName(filename);
                // create an instance fo the web service  
                smartblindsws.SmartBlindsWebServiceSoapClient srv = new smartblindsws.SmartBlindsWebServiceSoapClient("SmartBlindsWebServiceSoap");
                //ServiceReference1.SmartBlindsWebServiceSoapClient srv = new
                //ServiceReference1.SmartBlindsWebServiceSoapClient();
                // get the file information form the selected file  
                FileInfo fInfo = new FileInfo(filename);
                // get the length of the file to see if it is possible  
                // to upload it (with the standard 4 MB limit)  
                long numBytes = fInfo.Length;
                double dLen = Convert.ToDouble(fInfo.Length / 1000000);
                // Default limit of 4 MB on web server  
                // have to change the web.config to if  
                // you want to allow larger uploads  
                if (dLen < 4)
                {
                    // set up a file stream and binary reader for the  
                    // selected file  
                    FileStream fStream = new FileStream(filename,
                    FileMode.Open, FileAccess.Read);
                    BinaryReader br = new BinaryReader(fStream);
                    // convert the file to a byte array  
                    byte[] data = br.ReadBytes((int)numBytes);
                    br.Close();
                    // pass the byte array (file) and file name to the web service  
                    string sTmp = srv.UploadFile(data, strFile);
                    fStream.Close();
                    fStream.Dispose();
                    // this will always say OK unless an error occurs,  
                    // if an error occurs, the service returns the error message  
                    MessageBox.Show("File Upload Status: " + sTmp, "File Upload");
                }
                else
                {
                    // Display message if the file was too large to upload  
                    MessageBox.Show("The file selected exceeds the size limit for uploads.", "File Size");
                }
            }
            catch (Exception ex)
            {
                // display an error message to the user  
                MessageBox.Show(ex.Message.ToString(), "Upload Error");
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            openFileDialog1.Title = "Open File";
            openFileDialog1.Filter = "All Files|*.*";
            openFileDialog1.FileName = "";
            try
            {
                openFileDialog1.InitialDirectory = "C:\\Temp";
            }
            catch
            {
                // skip it  
            }
            openFileDialog1.ShowDialog();
            if (openFileDialog1.FileName == "")
                return;
            else
                txtFileName.Text = openFileDialog1.FileName;
        }

        private void btnUpload_Click(object sender, EventArgs e)
        {
            if (txtFileName.Text != string.Empty)
                UploadFile(txtFileName.Text);
            else
                MessageBox.Show("You must select a file first.", "No File Selected");
        }
    }
}
