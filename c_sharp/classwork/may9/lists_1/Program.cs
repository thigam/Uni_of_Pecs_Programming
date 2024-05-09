using System;
using System.Collections.Generic; //always needed for lists
class Program
{
    public static void Main()
    {
        //create a list named subjects that contain 2 elements
        List<string> subjects = new List<string>() {"English", "Math"};

        //access the first and second elements od the langiages list
        Console.WriteLine("The first element of the list is " +subjects[0]);
        Console.WriteLine("The second element of the list is " + subjects[1]);
        
        //add elements to the list, add is a function
        subjects.Add("USA");
        subjects.Add("Japan");

        //iterate
        for (int i = 0; i < subjects.Count; i++) //in arrays, it is array.Length
        Console.WriteLine(subjects[i]);
        //Count is a method

        Console.WriteLine("");

        //AddRange
        List<string> subjects2 = new List<string>() {"Matthewnese","Thiganese"};
        subjects2.AddRange(["Ligo","Themes","Ligo"]);
        subjects2.AddRange(new List<string>{"Kimadende","Kilingala"});
        subjects.AddRange(subjects2);

        //foreach
        foreach(string item in subjects)
        Console.WriteLine(item);

        //insert "JavaScript" at index 2
        subjects.Insert(2,"Javascript");

        //remove the first occurence of "Ligo"
        subjects.Remove("Ligo");

        //remove the element present at the 2dn index position
        subjects.RemoveAt(2);
    }
}
