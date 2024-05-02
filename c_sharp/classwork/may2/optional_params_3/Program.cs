//using optional attribute
using System;
using System.Runtime.InteropServices;

class GFG
{
    static public void my_mul(int num, [Optional] int num2)
    {
        Console.WriteLine(num *num2);
    }

    //Main method
    static public void Main()
    {
        my_mul(4);
        my_mul(2,10);
    }
}
