internal class Program
{
    public static void Main(string[] args)
    {
        double number = 5.0;
        if (Divide(ref number, 1) == 1)
        {
            Console.WriteLine("The value is NaN.");
        }
        else
        {
            Console.WriteLine("The result: " + number);
        }
        Console.ReadKey();
    }

    public static int Divide(ref double x,int y)
    {
        int err = 0;
        x = x % y;
        if (Double.IsNaN(x)) return err=1;
        return err;
    }
}