trigger CandidateTrigger on Candidate__c (before insert, after insert, after update) {
    
    if(Trigger.isInsert)
    {
        if(Trigger.isBefore)
        {
            CandidateTriggerHandler.validateDuplicateEmail(Trigger.New);           
        }
        if(Trigger.isAfter)
        {
            CandidateTriggerHandler.sendEmail(Trigger.New, null);
        }
    }
    
    if(Trigger.isUpdate)
    {
        if(Trigger.isAfter)
        {
            CandidateTriggerHandler.sendEmail(Trigger.New, Trigger.oldMap);
        }
    }
}