//optional parameteres using params
public class MyClass
{
    public static void UseParams(params int[] list)
    {
        for (int i = 0; i < list.Length; i++)
        {
            Console.Write(list[i] + " ");
        }
        Console.WriteLine();
    }

    public static void UseParams2(params object[] list)
    {
        for (int i = 0; i < list.Length; i++)
        {
            Console.Write(list[i] + " ");
        }
        Console.WriteLine();
    }

    static void Main()
    {
        UseParams(1, 2, 3, 4);
        UseParams2(1, 'a', "test");

        //params can accept zero or more arguments
        //an empty line will be printed
        UseParams2();

        //an array argument can be passed, as long as the arraytype matches the parameter
        //type of the method being called
        int[] myIntArray = {5, 6, 7, 8, 9};
        UseParams(myIntArray);

        object[] myObjArray = {2, 'b', "test", "again"};
        UseParams2(myObjArray);

        //UseParams(myObjArray) ==>error
        //in the following code, the entire integer array becomes the first elements of
        //the params array
        UseParams2(myIntArray);
        UseParams2(1, 2, 3, 4);
    }
}
