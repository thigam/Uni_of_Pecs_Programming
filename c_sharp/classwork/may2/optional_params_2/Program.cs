//Creating optional parameters using method overloading
using System;
using System.Runtime.InteropServices;

class GFG
{
    static public void my_mul(int num, [Optional] int num2) //lower priority
    {
        Console.WriteLine(num *num2);
    }
    static public void my_mul(int a)
    {
        Console.WriteLine(a *a);
    }

    static public void my_mul(int a, int b, int c)
    {
        Console.WriteLine(a * b * c);
    }

    //Main method
    static public void Main()
    {
        my_mul(4);
        my_mul(5, 6, 100);
    }
}
