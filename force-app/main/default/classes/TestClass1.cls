@isTest
public class TestClass1
{
    static TestMethod void testMethod1()
    {
        User a = [Select Name from user Limit 1];
        
        System.runAs(a) // System.runAs(sObject, block)
        {
            Calculate c = new Calculate();
            c.add(10,20);
            Integer r = c.getResult();
            System.assertEquals(30, r);
            
        }
    }
}