@isTest
private class TestClass_20231116
{
    static List<Account> testAccts;
    // will be accessible for whole class
    
    @testSetup
    static void setup()
    {
        testAccts = new List<Account>();
        
        for(Integer i=0; i<2; i++)
        {
            testAccts.add(new Account(Name = 'TestAccts'+i));
        }
        insert testAccts;
    }
    
    @isTest
    static void testMethod1()
    {
        // Get the first acccount created above by using soql query
        Account acct = [Select Id from account where name ='TestAcct0' limit 1];
    }
        
}