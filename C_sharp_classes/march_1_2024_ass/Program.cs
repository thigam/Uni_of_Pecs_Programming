// See https://aka.ms/new-console-template for more information
using System;
namespace Assignment_1
{
    internal class Program{
    public static void Main(){
        Student Anya = new Student();
        Anya.FirstName = "Anya";
        Console.WriteLine(Anya.FirstName);
    }

    public class Student{
        private string firstName;
        private string lastName;
        private string neptunCode;
        private int age;

        public Student()
        {

        }

        public Student(string firstName, string lastName, string neptunCode, int age)
        {
            if (string.IsNullOrEmpty(firstName) || string.IsNullOrEmpty(lastName))
            {
                throw new ArgumentException("First name or last name must be filled");
            }
            if (age < 1 || age > 150)
            {
                throw new ArgumentException("Age must be between 1 and 150");
            }

            this.firstName = firstName;
            this.lastName = lastName;
            this.neptunCode = neptunCode;
            this.age = age;
        }

        public string FirstName
        {
            get => this.firstName;
            set{
                if (string.IsNullOrEmpty(value))
                {
                    throw new ArgumentException("First name or last name must be filled");
                }

                this.firstName = value;
            }
        }
    }
    }
}
