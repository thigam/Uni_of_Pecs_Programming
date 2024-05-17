using System;
using System.Collections.Generic;

namespace Exam
{
    class Student
    {
        private string _firstName;
        private string _lastName;
        private int _id;
        private int _age;
        private string _classCode;
        private List<int> _grades;

        //properties:
        public string firstName
        {
            get => _firstName;
            set => _firstName = value;
        }
        public string lastName
        {
            get => _lastName;
            set => _lastName = value;
        }
        public int id
        {
            get => _id;
            set => _id = value;
        }
        public int age
        {
            get => _age;
            set => _age = value;
        }
        public string classCode
        {
            get => _classCode;
            set => _classCode = value;
        }
        public List<int> grades
        {
            get => _grades;
            set => _grades = value;
        }
        public string Name => $"{_firstName} {_lastName}";

        //Constructor one:
        public Student(string FirstName, string LastName, int ID, int Age, string ClassCode)
        {
            _firstName = FirstName;
            _lastName = LastName;
            _id = ID;
            _age = Age;
            _classCode = ClassCode;
            _grades = new List<int>();
            Console.WriteLine("Student added to the class");
        }

        //Constructor two:
        public Student(string FirstName, string LastName, int ID, int Age, string ClassCode, params int[] Grades)
        {
            _firstName = FirstName;
            _lastName = LastName;
            _id = ID;
            _age = Age;
            _classCode = ClassCode;
            _grades = new List<int>();
            _grades.AddRange(Grades);
            Console.WriteLine("Student added to the class");
        }

        //Now, the methods:
        public void Grade(params int[] Grades)
        {
            this._grades.AddRange(Grades);
        }

        public void Correct(int SerialNum, int Grade)
        {
            this._grades.RemoveAt(SerialNum - 1);
            this._grades.Insert(SerialNum - 1, Grade);
        }

        public double Average()
        {
            if (this._grades.Count != 0)
            {
                return this._grades.Average();
            }
            else
            {
                return 0;
            }
        }
        public int Highest()
        {
            int highest = 0;
            foreach(int i in this._grades)
            {
                if (i > highest)
                {
                    highest = i;
                }
            }
            return highest;
        }
        public int Lowest()
        {
            int lowest = 5;
            foreach(int i in this._grades)
            {
                if (i < lowest)
                {
                    lowest = i;
                }
            }
            return lowest;
        }
    }

    class Teacher
    {
        private int _id;
        private string _name;
        private List<string> _classCodes;

        //The properties
        public int id
        {
            get => _id;
            set => _id = value;
        }
        public string name
        {
            get => _name;
            set => _name = value;
        }
        public List<string> classCodes
        {
            get => _classCodes;
            set => _classCodes = value;
        }

        //The constructors:
        public Teacher(int ID, string Name, List<string> ClassCodes)
        {
            _id = ID;
            _name = Name;
            _classCodes = ClassCodes;
            Console.WriteLine("Teacher added to the database");
        }
    }
    class Neptun
    {
        public bool Activity(Teacher Tr, Student learner)
        {
            foreach (string code in Tr.classCodes)
            {
                if (code == learner.classCode)
                {
                    return true;
                }
            }
            return false;
        }

        public void Summary(List<Student> Everyone)
        {
            var newList = Everyone.OrderByDescending(learner => learner.Average()).ToList();
            for (int position = 0; position < newList.Count(); position++)
            {
                Console.Write(newList[position].Name + " Lowest: "+ newList[position].Lowest() + " Highest: " + newList[position].Highest() + " Average: " + newList[position].Average());
                if (position < newList.Count() - 1)
                {
                    if (newList[position].Average() == newList[position + 1].Average())
                    {
                        Console.Write(" and ");
                    }
                    else{
                        Console.Write("\n");
                    }
                }
                else 
                {
                    Console.Write("\n");
                }
            }
        }
    }
    class Program
    {
        static void Main(string[] args)
        {
            Student Kati = new Student("Kati", "Szabolcs", 3456, 20, "5B", 4, 4, 4);
            Student Pisti = new Student("Pisti", "Tariq", 4567, 21, "6C", 5, 3, 4);
            Student Peter = new Student("Peter", "Diaz", 5678, 22, "7D", 2, 5, 5);
            Student Sara = new Student("Sara", "Shanker", 7890, 18, "8E", 2, 2, 4);
            Teacher Janos = new Teacher(3765, "Janos", new List<string>(){"5B", "6C", "8E", "9F"});

            Neptun neptun = new Neptun();

            //Qsn b: Sara correcting her second grade to 5
            if (neptun.Activity(Janos, Sara) == true)
            {
                Sara.Correct(2,5);
            }
            else
            {
                Console.WriteLine("You are not authorized to perform this operation");
            }

            //Qsn c: Kati earned a new grade of 4
            if (neptun.Activity(Janos, Kati) == true)
            {
                Kati.Grade(4);
            }
            else
            {
                Console.WriteLine("You are not authorized to perform this operation");
            }

            //Qsn d: Pisti earned two new grades of 3
            if (neptun.Activity(Janos, Pisti) == true)
            {
                Pisti.Grade(3,3);
            }
            else
            {
                Console.WriteLine("You are not authorized to perform this operation");
            }

            //Qsn e: Peter corrected his first grade to 4
            if (neptun.Activity(Janos, Peter) == true)
            {
                Peter.Correct(1,4);
            }
            else
            {
                Console.WriteLine("You are not authorized to perform this operation");
            }
            
            //Qsn f: Printing the average of Pisti's grade
            if (neptun.Activity(Janos, Pisti) == true)
            {
                Console.WriteLine(Pisti.firstName + "'s average: " + Pisti.Average());
            }
            else
            {
                Console.WriteLine("You are not authorized to perform this operation");
            }

            //Calling the summary function:
            List<Student> Students = new List<Student>() {Kati, Pisti, Peter, Sara}; 
            neptun.Summary(Students);
        }
    }
}