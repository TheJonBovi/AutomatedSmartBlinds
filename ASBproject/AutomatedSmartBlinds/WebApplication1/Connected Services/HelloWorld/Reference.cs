﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SmartBlindsWebApp.HelloWorld {
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="HelloWorld.WebService1Soap")]
    public interface WebService1Soap {
        
        // CODEGEN: Generating message contract since element name name from namespace http://tempuri.org/ is not marked nillable
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/HelloWorld", ReplyAction="*")]
        SmartBlindsWebApp.HelloWorld.HelloWorldResponse HelloWorld(SmartBlindsWebApp.HelloWorld.HelloWorldRequest request);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/HelloWorld", ReplyAction="*")]
        System.Threading.Tasks.Task<SmartBlindsWebApp.HelloWorld.HelloWorldResponse> HelloWorldAsync(SmartBlindsWebApp.HelloWorld.HelloWorldRequest request);
        
        // CODEGEN: Generating message contract since element name GetCurrentUserResult from namespace http://tempuri.org/ is not marked nillable
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/GetCurrentUser", ReplyAction="*")]
        SmartBlindsWebApp.HelloWorld.GetCurrentUserResponse GetCurrentUser(SmartBlindsWebApp.HelloWorld.GetCurrentUserRequest request);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/GetCurrentUser", ReplyAction="*")]
        System.Threading.Tasks.Task<SmartBlindsWebApp.HelloWorld.GetCurrentUserResponse> GetCurrentUserAsync(SmartBlindsWebApp.HelloWorld.GetCurrentUserRequest request);
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.ServiceModel.MessageContractAttribute(IsWrapped=false)]
    public partial class HelloWorldRequest {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Name="HelloWorld", Namespace="http://tempuri.org/", Order=0)]
        public SmartBlindsWebApp.HelloWorld.HelloWorldRequestBody Body;
        
        public HelloWorldRequest() {
        }
        
        public HelloWorldRequest(SmartBlindsWebApp.HelloWorld.HelloWorldRequestBody Body) {
            this.Body = Body;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.Runtime.Serialization.DataContractAttribute(Namespace="http://tempuri.org/")]
    public partial class HelloWorldRequestBody {
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=0)]
        public string name;
        
        public HelloWorldRequestBody() {
        }
        
        public HelloWorldRequestBody(string name) {
            this.name = name;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.ServiceModel.MessageContractAttribute(IsWrapped=false)]
    public partial class HelloWorldResponse {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Name="HelloWorldResponse", Namespace="http://tempuri.org/", Order=0)]
        public SmartBlindsWebApp.HelloWorld.HelloWorldResponseBody Body;
        
        public HelloWorldResponse() {
        }
        
        public HelloWorldResponse(SmartBlindsWebApp.HelloWorld.HelloWorldResponseBody Body) {
            this.Body = Body;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.Runtime.Serialization.DataContractAttribute(Namespace="http://tempuri.org/")]
    public partial class HelloWorldResponseBody {
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=0)]
        public string HelloWorldResult;
        
        public HelloWorldResponseBody() {
        }
        
        public HelloWorldResponseBody(string HelloWorldResult) {
            this.HelloWorldResult = HelloWorldResult;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.ServiceModel.MessageContractAttribute(IsWrapped=false)]
    public partial class GetCurrentUserRequest {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Name="GetCurrentUser", Namespace="http://tempuri.org/", Order=0)]
        public SmartBlindsWebApp.HelloWorld.GetCurrentUserRequestBody Body;
        
        public GetCurrentUserRequest() {
        }
        
        public GetCurrentUserRequest(SmartBlindsWebApp.HelloWorld.GetCurrentUserRequestBody Body) {
            this.Body = Body;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.Runtime.Serialization.DataContractAttribute()]
    public partial class GetCurrentUserRequestBody {
        
        public GetCurrentUserRequestBody() {
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.ServiceModel.MessageContractAttribute(IsWrapped=false)]
    public partial class GetCurrentUserResponse {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Name="GetCurrentUserResponse", Namespace="http://tempuri.org/", Order=0)]
        public SmartBlindsWebApp.HelloWorld.GetCurrentUserResponseBody Body;
        
        public GetCurrentUserResponse() {
        }
        
        public GetCurrentUserResponse(SmartBlindsWebApp.HelloWorld.GetCurrentUserResponseBody Body) {
            this.Body = Body;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.Runtime.Serialization.DataContractAttribute(Namespace="http://tempuri.org/")]
    public partial class GetCurrentUserResponseBody {
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=0)]
        public string GetCurrentUserResult;
        
        public GetCurrentUserResponseBody() {
        }
        
        public GetCurrentUserResponseBody(string GetCurrentUserResult) {
            this.GetCurrentUserResult = GetCurrentUserResult;
        }
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface WebService1SoapChannel : SmartBlindsWebApp.HelloWorld.WebService1Soap, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class WebService1SoapClient : System.ServiceModel.ClientBase<SmartBlindsWebApp.HelloWorld.WebService1Soap>, SmartBlindsWebApp.HelloWorld.WebService1Soap {
        
        public WebService1SoapClient() {
        }
        
        public WebService1SoapClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public WebService1SoapClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public WebService1SoapClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public WebService1SoapClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
        SmartBlindsWebApp.HelloWorld.HelloWorldResponse SmartBlindsWebApp.HelloWorld.WebService1Soap.HelloWorld(SmartBlindsWebApp.HelloWorld.HelloWorldRequest request) {
            return base.Channel.HelloWorld(request);
        }
        
        public string HelloWorld(string name) {
            SmartBlindsWebApp.HelloWorld.HelloWorldRequest inValue = new SmartBlindsWebApp.HelloWorld.HelloWorldRequest();
            inValue.Body = new SmartBlindsWebApp.HelloWorld.HelloWorldRequestBody();
            inValue.Body.name = name;
            SmartBlindsWebApp.HelloWorld.HelloWorldResponse retVal = ((SmartBlindsWebApp.HelloWorld.WebService1Soap)(this)).HelloWorld(inValue);
            return retVal.Body.HelloWorldResult;
        }
        
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
        System.Threading.Tasks.Task<SmartBlindsWebApp.HelloWorld.HelloWorldResponse> SmartBlindsWebApp.HelloWorld.WebService1Soap.HelloWorldAsync(SmartBlindsWebApp.HelloWorld.HelloWorldRequest request) {
            return base.Channel.HelloWorldAsync(request);
        }
        
        public System.Threading.Tasks.Task<SmartBlindsWebApp.HelloWorld.HelloWorldResponse> HelloWorldAsync(string name) {
            SmartBlindsWebApp.HelloWorld.HelloWorldRequest inValue = new SmartBlindsWebApp.HelloWorld.HelloWorldRequest();
            inValue.Body = new SmartBlindsWebApp.HelloWorld.HelloWorldRequestBody();
            inValue.Body.name = name;
            return ((SmartBlindsWebApp.HelloWorld.WebService1Soap)(this)).HelloWorldAsync(inValue);
        }
        
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
        SmartBlindsWebApp.HelloWorld.GetCurrentUserResponse SmartBlindsWebApp.HelloWorld.WebService1Soap.GetCurrentUser(SmartBlindsWebApp.HelloWorld.GetCurrentUserRequest request) {
            return base.Channel.GetCurrentUser(request);
        }
        
        public string GetCurrentUser() {
            SmartBlindsWebApp.HelloWorld.GetCurrentUserRequest inValue = new SmartBlindsWebApp.HelloWorld.GetCurrentUserRequest();
            inValue.Body = new SmartBlindsWebApp.HelloWorld.GetCurrentUserRequestBody();
            SmartBlindsWebApp.HelloWorld.GetCurrentUserResponse retVal = ((SmartBlindsWebApp.HelloWorld.WebService1Soap)(this)).GetCurrentUser(inValue);
            return retVal.Body.GetCurrentUserResult;
        }
        
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
        System.Threading.Tasks.Task<SmartBlindsWebApp.HelloWorld.GetCurrentUserResponse> SmartBlindsWebApp.HelloWorld.WebService1Soap.GetCurrentUserAsync(SmartBlindsWebApp.HelloWorld.GetCurrentUserRequest request) {
            return base.Channel.GetCurrentUserAsync(request);
        }
        
        public System.Threading.Tasks.Task<SmartBlindsWebApp.HelloWorld.GetCurrentUserResponse> GetCurrentUserAsync() {
            SmartBlindsWebApp.HelloWorld.GetCurrentUserRequest inValue = new SmartBlindsWebApp.HelloWorld.GetCurrentUserRequest();
            inValue.Body = new SmartBlindsWebApp.HelloWorld.GetCurrentUserRequestBody();
            return ((SmartBlindsWebApp.HelloWorld.WebService1Soap)(this)).GetCurrentUserAsync(inValue);
        }
    }
}
