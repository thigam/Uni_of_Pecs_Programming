using System;

namespace Mine
{
    internal class Program
    {
        class Student
        {
            private int _CollegeYear;
            private string _name;
            private int _age;
            private List<int> _grades;
            
            public int collegeYear
            {
                get=> _CollegeYear; 
                set=> _CollegeYear = value; 
            }
            public string name
            {
                get=> _name; 
                set=> _name = value; 
            }
            public int age
            { 
                get=> _age; 
                set=> _age = value; 
            }
            public List<int> grades
            {
                get=> _grades; 
                set=> _grades = value; 
            }

            public Student(int collegeYear, string name, int age)
            {
                collegeYear = collegeYear;
                name = name;
                _age = age;
            }
            public Student(int collegeYear, string name, int age, List<int> grades)
            {
                collegeYear = collegeYear;
                name = name;
                age = age;
                grades = grades;
            }


            public void GetGrades()
            {
                if (grades == null)
                {
                    Console.WriteLine("There are no grades");
                }
                else
                {
                    foreach (var grade in grades)
                    Console.WriteLine(grade);
                }
            }
            //public void giveGrade(newGrade)
            //{
            //    grades.Add(newGrade);
            //}
        }
        public static void Main(string[] args)
        {
            Student Andrew = new Student(2026, "Andrew", 36);
            Console.WriteLine(Andrew.age);
            Andrew.grades = new List<int>() {34, 35, 0, 0,};
            Andrew.GetGrades();
        }
    }
}
