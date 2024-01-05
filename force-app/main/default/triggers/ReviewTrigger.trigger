trigger ReviewTrigger on Review__c (after insert) 
{
    if(Trigger.isAfter && Trigger.isInsert)
    {
        ReviewTriggerHandler.updateJobApplicationMethod(Trigger.new);
    }

}