using System;
using System.Collections.Generic;

namespace Mine
{
    internal class Program
    {
        //The student class:
        class Student
        {
            private int collegeYear;
            private string name;
            private int age;
            private List<int> grades;
            
            public int CollegeYear
            {
                get=> collegeYear; 
                set=> collegeYear = value; 
            }
            public string Name
            {
                get=> name; 
                set=> name = value; 
            }
            public int Age
            { 
                get=> age; 
                set=> age = value; 
            }
            public List<int> Grades
            {
                get=> grades; 
                set=> grades = value; 
            }

            public Student(int _collegeYear, string _name, int _age)
            {
                collegeYear = _collegeYear;
                name = _name;
                age = _age;
                grades = new List<int>();
            }
            public Student(int _collegeYear, string _name, int _age, List<int> _grades)
            {
                collegeYear = _collegeYear;
                name = _name;
                age = _age;
                grades = _grades;
            }


            public void GetGrades()
            {
                Console.Write("\n{0}: ", name);
                if (grades.Count == 0)
                {
                    Console.WriteLine("There are no grades");
                }
                else
                {
                    foreach (var grade in grades)
                    Console.Write(" " + grade);
                }
            }
            public void GiveGrade(int newGrade)
            {
               grades.Add(newGrade);
            }
        }

        //The Teacher class
        class Teacher
        {
            private int id;
            private string name;

            public int ID
            {
                get => id;
                set => id = value;
            }

            public string Name
            {
                get => name;
                set => name = value;
            }

            public Teacher(int _id, string _name)
            {
                id = _id;
                name = _name;
            }

            public void GiveGrade(Student learner, params int[] grades)
            {
                foreach(int grade in grades)
                learner.GiveGrade(grade);
            }

            public void UpGrade(List<Student> learners, string name, int index, int newGrade)
            {
                var learner = learners.Where(learner => learner.Name == name).ToList();
                Student learner_1 = learner[0];
                learner_1.Grades.RemoveAt(index);
                learner_1.Grades.Insert(index, newGrade);
            }
        }


        public static void Main(string[] args)
        {
            //Using your main to test my code implementation:
            Student student1 = new Student(2024, "Randy",18, new List<int>() { 3, 5});
            Student student2 = new Student(2023, "Marie",19);

            student1.GetGrades();
            student2.GetGrades();

            //List of students
            List<Student> students = new List<Student>();
            students.Add(student1);
            students.Add(student2);

            Teacher teacher1 = new Teacher(0, "Joseph");

            teacher1.GiveGrade(student1, 1, 1, 1);
            teacher1.GiveGrade(student2, 5, 4, 5);

            student1.GetGrades();
            student2.GetGrades();

            teacher1.UpGrade(students, "Randy", 3, 4);
            student1.GetGrades();

            Console.ReadKey();
        }
    }
}
