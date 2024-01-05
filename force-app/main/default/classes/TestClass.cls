@isTest(SeeAllData=true)
public class TestClass
{
    static testMethod void testMethodFirst()
    {
        Contact obj1 = [Select Id, name from contact LIMIT 1];
        System.debug(obj1);
    }
}