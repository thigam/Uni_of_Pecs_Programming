using System;
namespace Second_practice
{
  internal class Program {
    public static void Main (string[] args) {
      Console.WriteLine ("Hello World");
      Person person1 = new Person();
      Person person2 = new Person("Thomas", "Almasi");
      Person person3 = new Person("Peter", "Pal", 44);

      person1.GetInformation();
      person2.GetInformation();
      person3.GetInformation();
      person1.SetName("Tot", "Bot");
      person1.SetAge(55);
      person2.SetAge(65);
      Console.WriteLine("\n");
      person1.GetInformation();
      person2.GetInformation();
      person3.GetInformation();
      
      Console.WriteLine(SimpleClass.baseline);
      Console.Read();
    }
  }  
  public class Person
  {
    private string lastname;
    private string firstname;
    private int age;

    //1st constructor -- empty one
    public Person()
    {

    }
    //2nd constructor -- with string input parameters

    public Person(string lastname, string firstname)
    {
      this.lastname = lastname;
      this.firstname = firstname;
    }
  //3rd constructor with all the parameters
    public Person(string lastname, string firstname, int age)
    {
      this.firstname = firstname;
      this.lastname = lastname;
      this.age = age;
    }

    public void GetName()
    {
      Console.WriteLine(firstname+" "+lastname);
    }

    public void GetInformation()
    {
      Console.WriteLine(firstname+" "+lastname);
      Console.WriteLine(age);
    }

    public void SetName(string firstname, string lastname)
    {
      this.firstname=firstname;
      this.lastname=lastname;
    }

    public void SetAge(int age)
    {
      this.age=age;
    }
    //The rest of the class' methods
  }
  public class SimpleClass
  {
    public static readonly long baseline; //How many seconds have passed since the beginning of the 21st 

    static SimpleClass()
    {
      baseline = DateTime.Now.Ticks;
    }
  }
}//end of the namespace
