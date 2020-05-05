using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace ASBWeb
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Load up values for page
            sbWebService.SmartBlindsWebServiceSoapClient client = new sbWebService.SmartBlindsWebServiceSoapClient("SmartBlindsWebServiceSoap");


            //Decode values for blinds location

            //Vertical
            string v = client.GetBlindSettingsOBJ().SbHorizontal.ToString();
            if (v == "150")
            {

                lblBlindHorizontal.Text = "Fully Closed (Faceing Up)";
            }
            else if (v == "75")
            {
                //quarter open
                lblBlindHorizontal.Text = "1/2 to Full Open";
            }
            else if (v == "0")
            {
                //half open
                lblBlindHorizontal.Text = "Full Open";
            }
            else if (v == "-75")
            {
                //3/4 Down
                lblBlindHorizontal.Text = "Mostly Closed";
            }
            else if (v == "150")
            {
                //fully cclosed
                lblBlindHorizontal.Text = "Fully Closed(Facing Down)";

            }

            //Horizontal
            string h = client.GetBlindSettingsOBJ().SbVertical.ToString();



            if (h == "1024")
            {
                //fully open
                lblBlindsVertical.Text = "Full Up";
            }
            else if (h == "768")
            {
                //quarter open
                lblBlindsVertical.Text = "Quarter way down";
            }
            else if (h == "512")
            {
                //half open
                lblBlindsVertical.Text = "Halfway ";
            }
            else if (h == "256")
            {
                //3/4 Down
                lblBlindsVertical.Text = "3/4th Down";
            }
            else if (h == "0")
            {
                //fully cclosed
                lblBlindsVertical.Text = "Fully Closed";

            }

            //lblBlindHorizontal.Text = client.GetBlindSettingsOBJ().SbHorizontal.ToString();

            //vertical
            //lblBlindsVertical.Text = client.GetBlindSettingsOBJ().SbVertical.ToString();
        }

        protected void btnAdjustBlindVertical_Click(object sender, EventArgs e)
        {
            //Call set vertial web service
            //   if (ddlBlindsPreConH.SelectedValue != "") 
            //   {
            //Create web service proxy object
            sbWebService.SmartBlindsWebServiceSoapClient client = new sbWebService.SmartBlindsWebServiceSoapClient("SmartBlindsWebServiceSoap");
            client.SetBlindsSettings("", ddlBlindsPreConV.SelectedValue, "", "", 2);
            // }

        }

        protected void btnAdjistBlindHorizontal_Click(object sender, EventArgs e)
        {
            //        if (ddlBlindsPreConV.SelectedValue !="")
            //        { 
            sbWebService.SmartBlindsWebServiceSoapClient client = new sbWebService.SmartBlindsWebServiceSoapClient("SmartBlindsWebServiceSoap");
            //Call set vertial web service
            client.SetBlindsSettings(ddlBlindsPreConH.SelectedValue, "", "", "", 1);
            //       }
        }

        protected void btnLogTemp_Click(object sender, EventArgs e)
        {
            string temp = txtTemplog.Text.ToString();
            sbWebService.SmartBlindsWebServiceSoapClient client = new sbWebService.SmartBlindsWebServiceSoapClient("SmartBlindsWebServiceSoap");
            client.LogEntry(0, temp);
        }

        private void UploadFile(string filename)
        {
            try
            {
                // get the exact file name from the path  
                String strFile = System.IO.Path.GetFileName(filename);
                // create an instance fo the web service  
                sbWebService.SmartBlindsWebServiceSoapClient client = new sbWebService.SmartBlindsWebServiceSoapClient("SmartBlindsWebServiceSoap");
                //TestUploader.Uploader.FileUploader srv = new
                //TestUploader.Uploader.FileUploader();

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
                    string sTmp = client.UploadFile(data, strFile);
                    fStream.Close();
                    fStream.Dispose();
                    // this will always say OK unless an error occurs,  
                    // if an error occurs, the service returns the error message  
                    //MessageBox.Show("File Upload Status: " + sTmp, "File Upload");
                }
                else
                {
                    // Display message if the file was too large to upload  
                    // MessageBox.Show("The file selected exceeds the size limit for uploads.", "File Size");
                }
            }
            catch (Exception ex)
            {
                // display an error message to the user  
                // MessageBox.Show(ex.Message.ToString(), "Upload Error");
            }
        }

        protected void btnSetTemp_Click(object sender, EventArgs e)
        {
            string temp = txtTempSet.Text.ToString();
            sbWebService.SmartBlindsWebServiceSoapClient client = new sbWebService.SmartBlindsWebServiceSoapClient("SmartBlindsWebServiceSoap");



        }
    }
}