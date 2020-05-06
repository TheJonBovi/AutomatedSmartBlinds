using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.ComponentModel;
using System.IO;
using System.Xml;

namespace SmartBlindsWebService
{
    /// <summary>
    /// Summary description for WebService1
    /// </summary>
    [WebService(Namespace = "http://smartblinds.eastus.cloudapp.azure.com/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class SmartBlindsWebService : System.Web.Services.WebService
    {

        [WebMethod(Description ="HellloWorldd",MessageName ="TestHelloWorldd")]
        public string HelloWorld(string name)
        {
            return "Hello World and Hello " + name;
        }
        [WebMethod]
        public string GetCurrentUser()
        {
            //string test; // = ReturnCurrentUserSettings();
            //BlindSettings blindSettings = GetBlindSettings(1);
            //test = blindSettings.Name.ToString();
            //return test;

            try
            {

                string CurrentUser;
                sbUsers sbusers = new sbUsers();

                string cs = ConfigurationManager.ConnectionStrings["csWebDB"].ConnectionString;
                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand("usersettings_admin", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@function", SqlDbType.Int).Value = 0; // value 0 = getBlindsSettings
                    //cmd.Parameters.Add("@sysIDUser", SqlDbType.Int).Value = 1; //sysID of Administrator

                    con.Open();

                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        sbusers.SysID = Convert.ToInt32(reader["SysID"]);
                        sbusers.ProfileSysID = Convert.ToInt32(reader["ProfileSysID"]);
                        sbusers.Fname = reader["Fname"].ToString();
                        sbusers.Lname = reader["Lname"].ToString();
                        sbusers.Phone = reader["Phone"].ToString();
                        sbusers.Email = reader["Email"].ToString();
                    }
                }

                CurrentUser = sbusers.Fname.ToString();
                return CurrentUser;
            }
            catch (Exception e)
            {
                return e.ToString();

            }


        }
        [WebMethod]
        public string UploadFile(byte[] f, string fileName)
        {
            // the byte array argument contains the content of the file  
            // the string argument contains the name and extension  
            // of the file passed in the byte array  
            try
            {
                // instance a memory stream and pass the  
                // byte array to its constructor  
                MemoryStream ms = new MemoryStream(f);
                // instance a filestream pointing to the  
                // storage folder, use the original file name  
                // to name the resulting file  
                FileStream fs = new FileStream(System.Web.Hosting.HostingEnvironment.MapPath
                            ("~/smartblinds/pictures/") + fileName, FileMode.Create);
                // write the memory stream containing the original  
                // file as a byte array to the filestream  
                ms.WriteTo(fs);
                // clean up  
                ms.Close();
                fs.Close();
                fs.Dispose();
                // return OK if we made it this far  
                return "OK";
            }
            catch (Exception ex)
            {
                // return the error message if the operation fails  
                return ex.Message.ToString();
            }
        }

        [WebMethod]
        public string SetCurrentUser()
        {
            //string test; // = ReturnCurrentUserSettings();
            //BlindSettings blindSettings = GetBlindSettings(1);
            //test = blindSettings.Name.ToString();
            //return test;

            try
            {

                string CurrentUser;
                sbUsers sbusers = new sbUsers();

                string cs = ConfigurationManager.ConnectionStrings["csWebDB"].ConnectionString;
                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand("usersettings_admin", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@function", SqlDbType.Int).Value = 7; // value 7 = Set active user
                    cmd.Parameters.Add("@sysIDUser", SqlDbType.Int).Value = 1; //sysID of Administrator

                    con.Open();

                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        sbusers.SysID = Convert.ToInt32(reader["SysID"]);
                        sbusers.ProfileSysID = Convert.ToInt32(reader["ProfileSysID"]);
                        sbusers.Fname = reader["Fname"].ToString();
                        sbusers.Lname = reader["Lname"].ToString();
                        sbusers.Phone = reader["Phone"].ToString();
                        sbusers.Email = reader["Email"].ToString();
                    }
                }

                CurrentUser = sbusers.Fname.ToString();
                return CurrentUser;
            }
            catch (Exception e)
            {
                return e.ToString();

            }


        }




        [WebMethod(Description = "Returns active users settings")]
        public sbUsers ReturnCurrentUserSettings()
        {
            sbUsers sbUsers = new sbUsers();

            string cs = ConfigurationManager.ConnectionStrings["csWebDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("userssettings_admin", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@function", SqlDbType.Int).Value = 0; // value 0 = getBlindsSettings
                                                                          //cmd.Parameters.Add("@sysIDUser", SqlDbType.Int).Value = 1; //sysID of Administrator

                con.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    sbUsers.SysID = Convert.ToInt32(reader["SysID"]);
                    sbUsers.ProfileSysID = Convert.ToInt32(reader["ProfileSysID"]);
                    sbUsers.Fname = reader["Fname"].ToString();
                    sbUsers.Lname = reader["Lname"].ToString();
                    sbUsers.Phone = reader["Phone"].ToString();
                    sbUsers.Email = reader["Email"].ToString();
                }
            }

            return sbUsers;
        }

        [WebMethod(Description ="This Function is for GUI calls for object type blinds")]
        public BlindSettings GetBlindSettingsOBJ()
        {
            BlindSettings blindSettings = new BlindSettings();
            string cs = ConfigurationManager.ConnectionStrings["csWebDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("currentsettings_admin", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@function", SqlDbType.Int).Value = 0; // value 0 = getBlindsSettings

                con.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    blindSettings.SysID = Convert.ToInt32(reader["SysID"]);
                    blindSettings.Name = reader["userID"].ToString();
                    blindSettings.SbHorizontal = reader["SbHorizontal"].ToString();
                    blindSettings.SbVertical = reader["SbVertical"].ToString();
                    blindSettings.SbProx = reader["sbProx"].ToString();
                    blindSettings.SbTemp = reader["sbTemp"].ToString();
                }
            }

            return blindSettings;
        }


        [WebMethod]
        public BlindSettings GetBlindSettings(int SysID)
        {
            BlindSettings blindSettings = new BlindSettings();
            string cs = ConfigurationManager.ConnectionStrings["csWebDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("blindssettings_admin", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@function", SqlDbType.Int).Value = 0; // value 0 = getBlindsSettings
                cmd.Parameters.Add("@sysIDUser", SqlDbType.Int).Value = 1; //sysID of Administrator

                con.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    blindSettings.SysID = Convert.ToInt32(reader["SysID"]);
                    blindSettings.Name = reader["Name"].ToString();
                    blindSettings.SbHorizontal = reader["SbHorizontal"].ToString();
                    blindSettings.SbVertical = reader["SbVertical"].ToString();
                    blindSettings.Notes = reader["Notes"].ToString();
                }
            }

            return blindSettings;
        }

        [WebMethod]
        public BlindSettings SetBlindSettings(int SysID)
        {
            BlindSettings blindSettings = new BlindSettings();
            string cs = ConfigurationManager.ConnectionStrings["csWebDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("blindssettings_admin", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@function", SqlDbType.Int).Value = 0; // value 0 = getBlindsSettings
                cmd.Parameters.Add("@sysIDUser", SqlDbType.Int).Value = 1; //sysID of Administrator

                con.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    blindSettings.SysID = Convert.ToInt32(reader["SysID"]);
                    blindSettings.Name = reader["Name"].ToString();
                    blindSettings.SbHorizontal = reader["SbHorizontal"].ToString();
                    blindSettings.SbVertical = reader["SbVertical"].ToString();
                    blindSettings.Notes = reader["Notes"].ToString();
                }
            }

            return blindSettings;
        }

        [WebMethod(Description ="The function gets the current Horizontal and Vertical settings for the blinds and sends it to the MCU")]
        public XmlElement GetBlindsSettings()
        {
            //vars for function
            var doc = new XmlDocument();
            var h = 0;
            var v = 0;
            var p = 0;
            var t = 0;

            //get current settings from Database and assign to vars
            string cs = ConfigurationManager.ConnectionStrings["csWebDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("currentsettings_admin", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@function", SqlDbType.Int).Value = 0; // value 0 = getBlindsSettings
               // cmd.Parameters.Add("@tempLog", SqlDbType.NVarChar).Value = val; //sysID of Administrator

                con.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    h = Convert.ToInt32(reader["sbHorizontal"]);
                    v = Convert.ToInt32(reader["sbVertical"]);
                    p = Convert.ToInt32(reader["sbProx"]);
                    t = Convert.ToInt32(reader["sbTemp"]); ;
                }
            }
            //return XML document to consumer

            doc.LoadXml("<Blinds><Horizontal h= \"" + h + "\"/><vertical v= \"" + v + "\"/><proximity p = \"" + p + "\"/><temperature t = \"" + t + "\"/></Blinds>");

            //doc.LoadXml("<Horizantal>1</Horizantal>");

            return doc.DocumentElement;
        }

        [WebMethod(Description = "The function sets the current Horizontal-function 1 and Vertical-function 2 settings for the blinds")]
        public void SetBlindsSettings(string h, string v, string t, string p, int f)
        {

            try
            {
                //vars for function
                var doc = new XmlDocument();

                //get current settings from Database and assign to vars
                string cs = ConfigurationManager.ConnectionStrings["csWebDB"].ConnectionString;
                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand("currentsettings_admin", con);
                    switch (f)
                    {
                        case 1:
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.Add("@function", SqlDbType.Int).Value = f; // value 1 = set Horizontal blind settings
                            cmd.Parameters.Add("@sbHorizontal", SqlDbType.NVarChar).Value = h;

                            break;

                        case 2:

                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.Add("@function", SqlDbType.Int).Value = f; // value 1 = set vertical blind settings
                            cmd.Parameters.Add("@sbVertical", SqlDbType.NVarChar).Value = v;

                            break;

                        case 3:
                            break;
                        case 4:
                            break;
                        case 5:
                            break;

                        default:
                            break;
                    }

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        [WebMethod(Description ="This example returns string 'hello xml'")]
        public string GetXML()
        {

            return "hello xml";
        }

        [WebMethod]
        public XmlElement GetXMLdetail()
        {
            var doc = new XmlDocument();
            doc.LoadXml("<foo> <bar x=\"a\"/> </foo>");
            return doc.DocumentElement;
        }

        [WebMethod(Description ="Used to log temp")]
        public void LogEntry(int func, string val)
        {

            string cs = ConfigurationManager.ConnectionStrings["csWebDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("logsettings_admin", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@function", SqlDbType.Int).Value = func; // value 0 = getBlindsSettings
                cmd.Parameters.Add("@tempLog", SqlDbType.NVarChar).Value = val; //sysID of Administrator

                con.Open();

                cmd.ExecuteNonQuery();
                con.Close();

            }
        }

        [WebMethod(Description = "Used to log temp, prox and gas using function 1")]
        public void LogAllEntry(int func, string tempVal, string proxVal, string gasLog, string sbHorxLog, string sbVertLog, string sbTempAlarm)
        {

            string cs = ConfigurationManager.ConnectionStrings["csWebDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("logsettings_admin", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@function", SqlDbType.Int).Value = func; // value 1 = getBlindsSettings
                cmd.Parameters.Add("@tempLog", SqlDbType.NVarChar).Value = tempVal; //temp value
                cmd.Parameters.Add("@proxLog", SqlDbType.NVarChar).Value = proxVal; //proximity value
                cmd.Parameters.Add("@gasLog", SqlDbType.NVarChar).Value = gasLog; //proximity value
                cmd.Parameters.Add("@sbHorzLog", SqlDbType.NVarChar).Value = sbHorxLog; //proximity value
                cmd.Parameters.Add("@sbVertLog", SqlDbType.NVarChar).Value = sbVertLog; //proximity value
                cmd.Parameters.Add("@TempAlarm", SqlDbType.NVarChar).Value = sbTempAlarm;
                con.Open();

                cmd.ExecuteNonQuery();
                con.Close();

            }
        }
        [WebMethod(Description ="Used to set temp for alarm to go off or automate action")]
        public void SetCurrentTemp(string newTemp)
        {
            string cs = ConfigurationManager.ConnectionStrings["csWebDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("currentsettings_admin", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@function", SqlDbType.Int).Value = 3; // value 3 = set temp
                cmd.Parameters.Add("@sbTemp", SqlDbType.NVarChar).Value = newTemp; //temp value

                con.Open();

                cmd.ExecuteNonQuery();
                con.Close();

            }
        }

    }
}
