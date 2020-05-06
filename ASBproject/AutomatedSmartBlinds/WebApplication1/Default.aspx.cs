using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.ServiceModel;

namespace SmartBlindsWebApp
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //HelloWorld.WebService1SoapClient webService1SoapClient = new HelloWorld.WebService1SoapClient();
            //wcfService1Service.Service1Client service1Client = new wcfService1Service.Service1Client();
            //lblCurrentUser.Text = webService1SoapClient.HelloWorld("WOOOOO");

            //SmartBlindsWebServiceReference.SmartBlindsWebServiceSoapClient smartBlindsWebServiceSoapClient = new SmartBlindsWebServiceReference.SmartBlindsWebServiceSoapClient();
            //WIN100TEST.WIN1500TESTSoapClient wIN1500TESTSoapClient = new WIN100TEST.WIN1500TESTSoapClient();

            sbWebService.SmartBlindsWebServiceSoapClient soapClient = new sbWebService.SmartBlindsWebServiceSoapClient("SmartBlindsWebServiceSoap");
            lblCurrentUser.Text = soapClient.GetCurrentUser();

            // lblCurrentUser.Text = wIN1500TESTSoapClient.HelloWorld();



        }

        protected void btnChangeUser_Click(object sender, EventArgs e)
        {

        }


    }
}