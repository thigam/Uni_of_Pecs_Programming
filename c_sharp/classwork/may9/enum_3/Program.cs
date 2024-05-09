Using System;
enum WeekDays
{
    Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday
}

static void Main(string[] args)
{

    console.WriteLine(WeekDays.Friday); //output: Friday
    int day = (int) WeekDays.Friday; //enum to int conversion
    Console.WriteLine(day); //output: 4

    var wd = (WeekDays) 5; //int to enum conversion
    Console.WriteLine(wd); //output: Saturday
}