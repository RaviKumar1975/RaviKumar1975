public  class ApexTrigger_REST {
    /* NOTE: Make sure you add  https://YOUR_INSTANCE.salesforce.com or https://DOMAIN_NAME in remote setting.*/
    private static String endPoint = URL.getSalesforceBaseUrl().toExternalForm()  + '/services/data/v41.0/sobjects';
    /* This method creates apex trigger via callout to ApexTrigger REST Resource */
    
    
   
    public static String createApexTrigger(TriggerInfoWrapper objTriggerInfo){
        system.debug('value of objTriggerInfo'+objTriggerInfo);
        // create a Http request with post method
        system.debug('endPoint======>'+endPoint);
        HttpRequest req = createHttpRequest(endPoint+'/ApexTrigger','POST');
        system.debug('req'+req);
        // set body with serialized trigger info
        req.setBody(JSON.serialize(objTriggerInfo));
        // send request and receive response
        String response = fetchResponse(req);
        system.debug('response'+response);
        return response;
        // system.debug('response1'+response);
    }
    /* This method returns only triggerable object infos via callout to sobjects REST Resource */
    public static Map<String, String> fetchTriggerableObjInfo(String objName){
        // hold returned response objects info
        Map<String, String> mapObjectMapping = new Map<String, String>();
        // create a Http request with post method
        HttpRequest req = createHttpRequest(endPoint, 'GET');
        // send request and receive response
        String response = fetchResponse(req);
        // extract triggerable info
        Map<String, Object> body = (Map<String, Object>)JSON.deserializeUntyped(response);
        List<Object> objs = (List<Object>) body.get('sobjects');
        for (Object obj : objs){
            Map<String, Object> objDesc = (Map<String, Object>)(obj);
            String name = (String) objDesc.get('name');
            if(objName == name){
                Boolean isTriggerable = (Boolean) objDesc.get('triggerable');
                if(isTriggerable){
                    // construct mapping
                    mapObjectMapping.put(name, (String) objDesc.get('label'));
                }
                System.debug(System.LoggingLevel.ERROR, name + ': ' + isTriggerable);
            }
        }
        return mapObjectMapping;
    }
    /* This method returns only triggerable object infos via callout to sobjects REST Resource */
    public static Map<String, String> fetchTriggerableObjInfo(){
        // hold returned response objects info
        Map<String, String> mapObjectMapping = new Map<String, String>();
        // create a Http request with post method
        HttpRequest req = createHttpRequest(endPoint, 'GET');
        // send request and receive response
        String response = fetchResponse(req);
        // extract triggerable info
        Map<String, Object> body = (Map<String, Object>)JSON.deserializeUntyped(response);
        List<Object> objs = (List<Object>) body.get('sobjects');
        for (Object obj : objs)
        {
            Map<String, Object> objDesc = (Map<String, Object>)(obj);
            String name = (String) objDesc.get('name');
            Boolean isTriggerable = (Boolean) objDesc.get('triggerable');
            if(isTriggerable)
            {
                // construct mapping
                mapObjectMapping.put(name, (String) objDesc.get('label'));
            }
            System.debug(System.LoggingLevel.ERROR, name + ': ' + isTriggerable);
        }
        return mapObjectMapping;
    }
    /* This method returns response of an http request */
    private static String fetchResponse(HttpRequest req){
        Http objHttp = new Http();
        HttpResponse res = objHttp.send(req);
        return res.getBody();
    }
    
    // getRequestToken  a access token 
    public class responseWrapper 
    {
        public string id;
        public string access_token;
        public string instance_url;
    }
    public string getRequestToken()
    {
 
        string reqBody = 'grant_type=password&client_id=' +ApexTriggerRESTCustomMetaData__mdt.getInstance('ApexTriggerRESTCustomMetaDataRecord').Access_Key__c + '&client_secret=' + ApexTriggerRESTCustomMetaData__mdt.getInstance('ApexTriggerRESTCustomMetaDataRecord').cSecret__c + '&username=' + ApexTriggerRESTCustomMetaData__mdt.getInstance('ApexTriggerRESTCustomMetaDataRecord').uName__c + '&password=' + ApexTriggerRESTCustomMetaData__mdt.getInstance('ApexTriggerRESTCustomMetaDataRecord').passwd__c;
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setBody(reqBody);
        req.setMethod('POST');
        req.setEndpoint('https://login.salesforce.com/services/oauth2/token');
        HttpResponse hresp = h.send(req);
        responseWrapper wResp = (responseWrapper) JSON.deserialize(hresp.getBody(), responseWrapper.class);
        system.debug('Instance url' + wResp.instance_url);
        system.debug('session id' + wResp.access_token);
        system.debug('wResp genrate access token'+wResp.access_token);
        return wResp.access_token;
    }
    
    /* This method creates a http request with required endpoint and request method */
    private static HttpRequest createHttpRequest(String endpoint, String method)
    {
        String accToken;
        string responseBody;
        ApexTrigger_REST obj = new ApexTrigger_REST();
        accToken = obj.getRequestToken();
        system.debug('acc token :'+accToken);
        Http h1 = new Http();
        HttpRequest req1 = new HttpRequest();
        req1.setHeader('Authorization', 'Bearer ' + accToken);
        req1.setHeader('Content-Type', 'application/json');
        req1.setMethod('POST');
        req1.setEndpoint(endPoint);
        req1.setMethod(method);
        return req1; 
    }
    /* Wraper class to hold trigger information which needs to be set as body while creating trigger */
    public class TriggerInfoWrapper{
        // Trigger Name
        public String Name;
        // Object Name on which trigger has to be created
        public String TableEnumOrId;
        // Trigger body
        public String Body;
        public TriggerInfoWrapper(String objName, String triggerName, String triggerBody)
        {
            this.Name = triggerName;
            this.TableEnumOrId = objName;
            this.Body = triggerBody;
        }
    }
}