public class Calculate
{
    Integer result;
    
    public void add(integer a, integer b)
    {
        result = a+b;
        System.debug('Changes tracked by git');
    }
    
    @testVisible
    public integer getResult()
    {
        return result;  
    }
}