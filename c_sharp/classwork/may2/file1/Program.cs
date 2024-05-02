//Passing values by reference
int n=5;
System.Console.WriteLine("The value before calling the method: {0}",n);

SquareIt(ref n); //Passing the value by reference
System.Console.WriteLine("The value aftercalling the method: {0}", n);

//Keep the console window open in debug mode
System.Console.WriteLine("Press and key to exit.");
System.Console.ReadKey();

static void SquareIt(ref int x)
//The parameter x is passed by reference
//changes to x will affect the original value of x
{
    x*=x;
    System.Console.WriteLine("The value inside the method: {0}", x);
}
/*Output:
    The value before calling the method: 5
    The value inside the method: 25
    The value after calling the method: 25
*/
