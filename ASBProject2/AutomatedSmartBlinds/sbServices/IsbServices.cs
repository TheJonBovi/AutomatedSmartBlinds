using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace sbServices
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IsbService" in both code and config file together.
    [ServiceContract]
    public interface IsbServices
    {
        [OperationContract]
        BlindSettings GetBlindSettings(int SysID);

        [OperationContract]
        void SetBlindSettings(BlindSettings Smartblinds);

        [OperationContract]
        void DoWork();
    }
}
