public class CodePractice 
{
    public static void testCustomException(Integer i)
    {
        try
        {
            if(i<0)
            {
                throw new NumberIsNegativeException();
            }
            else 
            {
                i = i * i * 10;
                System.debug(i);
            }


        }
        catch(NumberIsNegativeException n)
        {
            System.debug('Number is Negative');
        }
    }
    
}