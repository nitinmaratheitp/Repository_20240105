global class ContactUpdateBatch implements Database.Batchable<sObject> 
{
    global Database.QueryLocator start(Database.BatchableContext bc)
    {
        return Database.getQueryLocator([Select phone from Contact]);
    }
    
    global void execute(Database.BatchableContext bc, List<Contact> cList)
    {
        for(Contact c: cList)
        {
            c.phone = '1234567890';      
        }
        update cList;
    }
    
    global void finish(Database.BatchableContext bc)
    {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddress = new String[]{'nitinmaratheitp@gmail.com'};
        mail.setToAddresses(toAddress);     
    }
}