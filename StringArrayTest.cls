public class StringArrayTest {
	public static List<String> generateStringArray(Integer value)
    {
        List<String> bucket=new List<String>();
        for(Integer i=0;i<value;i++)
        {
            bucket.add('Test '+i);
            System.debug(bucket[i]);
        }
        return bucket;
    }
}