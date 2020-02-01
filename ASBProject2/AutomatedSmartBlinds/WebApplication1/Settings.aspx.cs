using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartBlindsWebApp
{
    public partial class Settings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HelloWorld.WebService1SoapClient webService1SoapClient = new HelloWorld.WebService1SoapClient();
            lblBlindHorizontal.Text = webService1SoapClient.HelloWorld("Test 1111");
        }

        protected void btnAdjistBlindHorizontal_Click(object sender, EventArgs e)
        {
            HelloWorld.WebService1SoapClient webService1SoapClient = new HelloWorld.WebService1SoapClient();
            lblBlindHorizontal.Text = webService1SoapClient.HelloWorld("Test 2");
        }

        protected void btnAdjustBlindVertical_Click(object sender, EventArgs e)
        {

        }
    }
}