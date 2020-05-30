using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASBWeb
{
    public partial class DemoControls : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            sbWebService.SmartBlindsWebServiceSoapClient client = new sbWebService.SmartBlindsWebServiceSoapClient("SmartBlindsWebServiceSoap");
            //check Gas every 1 minute if good code returned 

            string g = client.GetGasStatus().ToString();
            if (g == "1")
            {
                //if bad returned 
                GasStatusImg.ImageUrl = "assets/img/demoControls/Un-Safe.png";
            }
            else
            {
                GasStatusImg.ImageUrl = "assets/img/demoControls/green_safe.png";
            }
            //size image
            GasStatusImg.Height = 30;
            GasStatusImg.Width = 30;
        }
    }
}