enum Months
{
    Low, //0
    Medium=3 //3
    High, //4
}

static void Main(string[] args)
{
    Level myVar = Level.Medium;
    switch(myVar)
    {
        case Level.Low:
            Console.WriteLine("Low level");
            break;
        case Level.Medium:
        Console.WriteLine("Medium level");
        break;
        case Level.High:
        Console.WriteLine("High level");
        break;
    }
    int myNum = (int) Level.High;
    Console.WriteLine(myNum);
}