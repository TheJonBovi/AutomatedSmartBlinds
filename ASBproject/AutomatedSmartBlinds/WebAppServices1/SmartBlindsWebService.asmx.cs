using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace SmartBlindsWebService
{
    /// <summary>
    /// Summary description for WebService1
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
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

                string cs = ConfigurationManager.ConnectionStrings["smartblindsdbConnectionString"].ConnectionString;
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

                string cs = ConfigurationManager.ConnectionStrings["smartblindsdbConnectionString"].ConnectionString;
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

            string cs = ConfigurationManager.ConnectionStrings["smartblindsdbConnectionString"].ConnectionString;
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

        [WebMethod]
        public BlindSettings GetBlindSettings(int SysID)
        {
            BlindSettings blindSettings = new BlindSettings();
            string cs = ConfigurationManager.ConnectionStrings["smartblindsdbConnectionString"].ConnectionString;
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
            string cs = ConfigurationManager.ConnectionStrings["smartblindsdbConnectionString"].ConnectionString;
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
    }
}
