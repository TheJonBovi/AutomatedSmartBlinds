using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ServiceModel;

namespace sbServicesHost
{
    class Program
    {
        static void Main(string[] args)
        {
            using (ServiceHost host = new ServiceHost(typeof(SmartBlindsWebService.sbServices)))
            {
                host.Open();
                Console.WriteLine("Host Start time: " + DateTime.Now.ToString());
                Console.WriteLine("\nHost State : " + host.State.ToString());
                Console.ReadLine();
            }
        }
    }
}
