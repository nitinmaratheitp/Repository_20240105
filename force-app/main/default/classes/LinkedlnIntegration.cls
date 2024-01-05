public class LinkedlnIntegration 
{
    public static void postOnLinkedln(String Message)
    {
        String loginId = loginToLinkedln();
        postMessage(loginId, Message);
    }
    
    //Sign method
    public static String loginToLinkedln()
    {
        Http http = new http();
        
        Httprequest request = new Httprequest();
        
        //Set diff parameters in the request - call method for the sign in - from linkedln documentation
        request.setMethod('GET');
        request.setEndPoint('callout:Linkedln/v2/me');
            // callout:Instance or label name from named credential/v2/me  (v2/me comes from base url --https://api.linkedin.com/v2/me)
            
        // making API call now
        Httpresponse response = http.send(request);
        // System.debug('response '+response.getBody());
        // System.debug('response '+response.getStatusCode());
        
        Map<String, Object> result = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
        String loginId = (String) result.get('id');
        return loginId;      
    }
    
    //Post Method
    public static void PostMessage(String loginId, String postMessage)
    {
        Http http = new Http();
        Httprequest request = new Httprequest();
        request.setMethod('POST');
        request.setHeader('X-Restli-Protocol-Version', '2.0.0');
        request.setHeader('Content-Type', 'application/json');
        String authorId = 'urn:li:person:' + loginId;
        String linkedlnPostBody = 
           '{'+
    '"author": "'+authorId+'",'+
    '"lifecycleState": "PUBLISHED",'+
    '"specificContent": {'+
        ' "com.linkedin.ugc.ShareContent": {'+
            ' "shareCommentary": {'+
               ' "text": "'+postMessage+'"'+
            '},'+
            '"shareMediaCategory": "NONE"'+
        '}'+
   ' },'+
    '"visibility": {'+
       ' "com.linkedin.ugc.MemberNetworkVisibility": "PUBLIC"'+
   ' }'+
'}';
        
        request.setBody(linkedlnPostBody);
        request.setEndpoint('callout:Linkedln/v2/ugcPosts');
        
        Httpresponse response = http.send(request);
        System.debug('response '+response.getBody());
        System.debug('response status code '+response.getStatusCode());
        
        
    }

}