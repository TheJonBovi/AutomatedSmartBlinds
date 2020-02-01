using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.ServiceModel;

namespace SmartBlindsWebApp
{
    public partial class CurentStatus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Load up values for page
            //wcfService1Service.Service1Client service1Client = new wcfService1Service.Service1Client();
            //lblBlindsVertical.Text = service1Client.addnos(1, 5).ToString();
        }

       
        protected void btnAdjustBlindVertical_Click(object sender, EventArgs e)
        {
            HelloWorld.WebService1SoapClient webService1SoapClient = new HelloWorld.WebService1SoapClient();
            wcfService1Service.Service1Client service1Client = new wcfService1Service.Service1Client();

            lblBlindsVertical.Text = webService1SoapClient.HelloWorld("Testing");
           // lblBlindsVertical.Text = service1Client.addnos(1, 5).ToString();
        }

        protected void btnAdjistBlindHorizontal_Click(object sender, EventArgs e)
        {

        }
    }
}