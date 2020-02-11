using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace SmartBlindsWebService
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "sbService" in both code and config file together.
    public class sbServices : IsbServices
    {
        public void DoWork()
        {
            throw new NotImplementedException();
        }

        public BlindSettings GetBlindSettings(int SysID)
        {
            BlindSettings blindSettings = new BlindSettings();
            string cs = ConfigurationManager.ConnectionStrings["smartblindsdbConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("settings_admin", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@function", SqlDbType.Int).Value = 0; // value 0 = getBlindsSettings
                cmd.Parameters.Add("@sysIDUser", SqlDbType.Int).Value = 1; //sysID of Administrator

                con.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                while(reader.Read())
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

        public void SetBlindSettings(BlindSettings Smartblinds)
        {
            throw new NotImplementedException();
        }
    }
}
