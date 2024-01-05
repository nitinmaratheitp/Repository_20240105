public class CandidateTriggerHandler {
    
    public static void sendEmail(List<Candidate__c> candidateList, Map<Id, Candidate__c> oldMap)
    {
        List<Messaging.email> emailList = new List<Messaging.email>();
        
        for(Candidate__c can: candidateList)
        {
            if((oldMap == null && can.Email__c != null) 
              || (oldMap != null && can.Email__c !=null && 
                 oldMap.get(can.Id).Email__c == null))
            {
                Messaging.SingleEmailMessage emailMsg = new Messaging.SingleEmailMessage();
                String[] toAddress = new String[]{can.email__c};
                    emailMsg.setToAddresses(toAddress);
                
                String emailSubject = 'Welcome '+can.First_Name__c;
                emailMsg.setSubject(emailSubject);
                
                String disName='Nitin Marathe';
                emailMsg.setSenderDisplayName(disName);
                
                String content = 'Hi '+can.First_Name__c+',<br/><br/>'+
                    'Welcome to Salesforce Ecosystem! <br/><br/>'+
                    'Happy Learning! <br/><br/>'+
                    'Thank You! <br/><br/>';
                emailMsg.setHtmlBody(content);
                emailList.add(emailMsg);              
            }
        }
        
        Messaging.sendEmail(emailList);
    }
    
    public static void validateDuplicateEmail(List<Candidate__c> cList)
    {
        List<Candidate__c> oldCanList = [Select email__c from Candidate__c];
        Set<String> emailSet = new Set<String>();
        
        for(Candidate__c c: oldCanList)
        {
            emailSet.add(c.email__c);
        }
        
        for(Candidate__c cNew: cList)
        {
            if(emailSet.contains(cNew.email__c))
            {
                cNew.email__c.addError('Duplicate email found, please use other email to save the record');
            }
        }
    }

}