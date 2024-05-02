//optional parameters (using default values)
using System;

class GFG
{
    static public void my_add(string str1="love", string str2, string str3 = "GeeksforGeeks")
    {
        Console.WriteLine(str1 + str2 + str3);
    }

    //Main method
    static public void Main()
    {
        my_add("Welcome", "to");
        my_add("This", "is", "C# Tutorial");
    }
}
/*
    WelcometoGeeksforGeeks
    ThisisC# Tutorial
*/

//Only the last parameter(s) can have a default value