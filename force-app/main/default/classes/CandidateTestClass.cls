@isTest
public class CandidateTestClass
{
    static testMethod void testAfterInsertEmail()
    {
        // Preparing test Data
    List<Candidate__c> canList = new List<Candidate__c>();
    canList.add(new Candidate__c(First_Name__c='Vicky', email__c='nitinmaratheitp@gmail.com'));
    
    
    //Now we will insert data which will fire the candidate trigger  
    Test.startTest();  
    insert canList;
    Test.stopTest();
        
    }
    
}