using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace SmartBlindsWebService
{
    [DataContract(Namespace = "http://smartblinds.eastus.cloudapp.azure.com/")]
    public class BlindSettings
    {
        private int _sysID;
        private string _name;
        private string _sbHorizontal;
        private string _sbVertical;
        private string _notes;
        private string _sbProx;
        private string _sbTemp;

        [DataMember]
        public int SysID
        {
            get { return _sysID; }
            set { _sysID = value; }

        }

        [DataMember]
        public string Name
        {
            get { return _name; }
            set { _name = value; }
        }

        [DataMember]
        public string SbHorizontal
        {
            get { return _sbHorizontal; }
            set { _sbHorizontal = value; }
        }

        [DataMember]
        public string SbVertical
        {
            get { return _sbVertical; }
            set { _sbVertical = value; }
        }
        [DataMember]
        public string Notes
        {
            get { return _notes; }
            set { _notes = value; }
        }

        public string SbProx
        {
            get { return _sbProx; }
            set { _sbProx = value; }
        }

        public string SbTemp
        {
            get { return _sbTemp; }
            set { _sbTemp = value; }
        }
    }

    [DataContract(Namespace = "http://smartblinds.eastus.cloudapp.azure.com/")]
    public class LedSettings
    {
        private int _sysID;
        private string _name;
        private string _sbHorizontal;
        private string _sbVertical;
        private string _notes;

        [DataMember]
        public int SysID
        {
            get { return _sysID; }
            set { _sysID = value; }

        }

        [DataMember]
        public string Name
        {
            get { return _name; }
            set { _name = value; }
        }

        [DataMember]
        public string SbHorizontal
        {
            get { return _sbHorizontal; }
            set { _sbHorizontal = value; }
        }

        [DataMember]
        public string SbVertical
        {
            get { return _sbVertical; }
            set { _sbVertical = value; }
        }
        [DataMember]
        public string Notes
        {
            get { return _notes; }
            set { _notes = value; }
        }
    }

    [DataContract(Namespace = "http://smartblinds.eastus.cloudapp.azure.com/")]
    public class GasSensor
    {
        private int _sysID;
        private string _name;
        private string _sbHorizontal;
        private string _sbVertical;
        private string _notes;

        [DataMember]
        public int SysID
        {
            get { return _sysID; }
            set { _sysID = value; }

        }

        [DataMember]
        public string Name
        {
            get { return _name; }
            set { _name = value; }
        }

        [DataMember]
        public string SbHorizontal
        {
            get { return _sbHorizontal; }
            set { _sbHorizontal = value; }
        }

        [DataMember]
        public string SbVertical
        {
            get { return _sbVertical; }
            set { _sbVertical = value; }
        }
        [DataMember]
        public string Notes
        {
            get { return _notes; }
            set { _notes = value; }
        }
    }

    [DataContract(Namespace = "http://smartblinds.eastus.cloudapp.azure.com/")]
    public class sbUsers
    {
        private int _sysID;
        private int _profileSysID;
        private string _fname;
        private string _lname;
        private string _phone;
        private string _email;
        private int _active;

        [DataMember]
        public int SysID
        {
            get { return _sysID; }
            set { _sysID = value; }

        }

        [DataMember]
        public int ProfileSysID
        {
            get { return _profileSysID; }
            set { _profileSysID = value; }

        }


        [DataMember]
        public string Fname
        {
            get { return _fname; }
            set { _fname = value; }
        }

        [DataMember]
        public string Lname
        {
            get { return _lname; }
            set { _lname = value; }
        }

        [DataMember]
        public string Phone
        {
            get { return _phone; }
            set { _phone = value; }
        }
        [DataMember]
        public string Email
        {
            get { return _email; }
            set { _email = value; }
        }
        [DataMember]
        public int Active
        {
            get { return _active; }
            set { _active = value; }
        }
    }


    [DataContract(Namespace = "http://smartblinds.eastus.cloudapp.azure.com/")]
    public class TempSensor
    {
        private int _sysID;
        private string _name;
        private string _sbHorizontal;
        private string _sbVertical;
        private string _notes;

        [DataMember]
        public int SysID
        {
            get { return _sysID; }
            set { _sysID = value; }

        }

        [DataMember]
        public string Name
        {
            get { return _name; }
            set { _name = value; }
        }

        [DataMember]
        public string SbHorizontal
        {
            get { return _sbHorizontal; }
            set { _sbHorizontal = value; }
        }

        [DataMember]
        public string SbVertical
        {
            get { return _sbVertical; }
            set { _sbVertical = value; }
        }
        [DataMember]
        public string Notes
        {
            get { return _notes; }
            set { _notes = value; }
        }
    }


    [DataContract(Namespace = "http://smartblinds.eastus.cloudapp.azure.com/")]
    public class ProxySensor
    {
        private int _sysID;
        private string _name;
        private string _sbHorizontal;
        private string _sbVertical;
        private string _notes;

        [DataMember]
        public int SysID
        {
            get { return _sysID; }
            set { _sysID = value; }

        }

        [DataMember]
        public string Name
        {
            get { return _name; }
            set { _name = value; }
        }

        [DataMember]
        public string SbHorizontal
        {
            get { return _sbHorizontal; }
            set { _sbHorizontal = value; }
        }

        [DataMember]
        public string SbVertical
        {
            get { return _sbVertical; }
            set { _sbVertical = value; }
        }
        [DataMember]
        public string Notes
        {
            get { return _notes; }
            set { _notes = value; }
        }
    }

    [DataContract(Namespace = "http://smartblinds.eastus.cloudapp.azure.com/")]
    public class CameraSettings
    {
        private int _sysID;
        private string _name;
        private string _sbHorizontal;
        private string _sbVertical;
        private string _notes;

        [DataMember]
        public int SysID
        {
            get { return _sysID; }
            set { _sysID = value; }

        }

        [DataMember]
        public string Name
        {
            get { return _name; }
            set { _name = value; }
        }

        [DataMember]
        public string SbHorizontal
        {
            get { return _sbHorizontal; }
            set { _sbHorizontal = value; }
        }

        [DataMember]
        public string SbVertical
        {
            get { return _sbVertical; }
            set { _sbVertical = value; }
        }
        [DataMember]
        public string Notes
        {
            get { return _notes; }
            set { _notes = value; }
        }
    }
}
