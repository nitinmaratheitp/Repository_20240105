public class ReviewTriggerHandler 
{
    public static void updateJobApplicationMethod(List<Review__c> revList)
    {
        Set<Id> revIdSet = new Set<Id>();
        
        for(Review__c rev: revList)
        {
            if(rev.rating__c != null)
            {
                revIdSet.add(rev.Job_Application__c);
            }
        }
        
        List<Job_Application__c> jobAppList = [Select Id, Name, Review_Provided__c from Job_Application__c where Id IN :revIdSet];
        for(Job_Application__c jobApp: jobAppList)
        {
            jobApp.Review_Provided__c = 'Yes';
        }
        update jobAppList;
    }

}