using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace SmartBlindsWebService
{
    [DataContract(Namespace = "http://localhost")]
    public class BlindSettings
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
