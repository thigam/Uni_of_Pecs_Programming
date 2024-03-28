public class BaseClass
{
    int num;

    public BaseClass() //you know it's a constructor since it has the same name as the class and no return type
    {
        Console.WriteLine("in BaseClass()");
    }

    public BaseClass(int i)
    {
        num = i;
        Console.WriteLine("in BaseClass(int i)"); 
    }

    public int GetNum()
    {
        return num;
    }
}

public class DerivedClass : BaseClass
{
    // This constructor will call BaseClass.BaseClass()
    public DerivedClass() : base() //base is used in this way with constructors pekee
    {
    }

    //This constructor will call BaseClass.BaseClass(inti)
    public DerivedClass(int i) : base(i)
    {
        Console.WriteLine("It is a plus line derived method");
    }

    static void Main()
    {
        DerivedClass md = new DerivedClass();
        DerivedClass md1 = new DerivedClass(1);
    }
}
/*
Output
in BaseClass()
in BaseClass(int i)
*/