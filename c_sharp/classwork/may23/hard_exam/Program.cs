using System;
using System.Collections.Generic;

namespace hard_exam
{
    class Student
    {
        //variables
        private string lastName;
        private string firstName;
        private int age;
        private double averageGrade;

        public string LastName
        {
            get => lastName;
            set => lastName = value;
        }

        public string FirstName
        {
            get => firstName;
            set => firstName = value;
        }
        
        public int Age 
        {
            get => age;
            set => age = value;
        }

        public double AverageGrade
        {
            get => averageGrade;
            set => averageGrade = value;
        }

        //constructor
        public Student(string LastName, string FirstName, int Age, double AverageGrade)
        {
            lastName = LastName;
            firstName = FirstName;
            age = Age;
            averageGrade = AverageGrade;
        }
        //methods
        public double AverageGrade_query()
        {
            return averageGrade;
        }
    }
    class Boarder : Student
    {
        //variables
        private int balance;
        private int roomNumber;

        public int Balance
        {
            get => balance;
            set => balance = value;
        }

        public int RoomNumber
        {
            get => roomNumber;
            set => roomNumber = value;
        }

        //constructor
        public Boarder(string LastName, string FirstName, int Age, double AverageGrade, int Balance, int RoomNumber) : base(LastName, FirstName, Age, AverageGrade)
        {
            balance = Balance;
            roomNumber = RoomNumber;
        }

        //methods
        public double Balance_query()
        {
            return balance;
        }
        public void dorm_fee(DormType x)
        {
            int fee = 0;
            if (x == DormType.SmallDorm)
            fee = 2000;
            else if (x == DormType.LargeDorm)
            fee = 3000;
            else
            return;
            if (balance < fee)
            {
                Console.WriteLine("Insufficient funds");
                return;
            }
            balance -= fee;
            //add to dorm balance
        }
    }
    enum DormType {SmallDorm, LargeDorm};
    class Dorm
    {
        //variables
        private int balance;
        private Dictionary<int, int> rooms; //key is room number, and value the no of available beds
        private Dictionary<Boarder, int> occupants; //key is the Boarder, and value is their room number

        public virtual int Balance 
        {
            get => balance;
            set => balance = value;
        } 

        public Dictionary<int, int> Rooms
        {
            get => rooms;
            set => rooms = value;
        }

        public Dictionary<Boarder, int> Occupants
        {
            get => occupants;
            set => occupants = value;
        }

        //Constructors
        public Dorm(Dictionary<int,int> Rooms)
        {
            rooms = Rooms;
            occupants = new Dictionary<Boarder, int>();
        }

        //Methods
        public void add_to_balance(int fee)
        {
            balance += fee;
        }
        public double Balance_query()
        {
            return balance;
        }

        public int Available_beds()
        {
            int total_beds = 0;
            foreach(KeyValuePair<int, int> i in rooms)
            {
                total_beds = total_beds + i.Value;
            }
            return total_beds - occupants.Count;
        }

        //since i'm not sure if you wanted to know the total number of available beds in
        // the entire dorm or just in specific rooms, I also added this function

        public int Available_beds_in_room(int room_number)
        {
            return rooms[room_number];
        }

        public void Enroll(Boarder x)
        {
            if (this.Available_beds_in_room(x.RoomNumber) <= 0)
            {
                return;
            }
            occupants.Add(x,x.RoomNumber);
            rooms[x.RoomNumber] -= 1;
        }

        public int RoomNumber_query(Boarder x)
        {
            return occupants[x];
        }
    }
    class SmallDorm : Dorm
    {
        private int balance = 100000;
        public override int Balance 
        {
            get => balance;
            set => balance = value;
        } 
        public SmallDorm(Dictionary<int,int> Rooms) : base(Rooms)
        {

        }
    }

    class LargeDorm : Dorm
    {
        private int balance = 200000;
        public override int Balance 
        {
            get => balance;
            set => balance = value;
        } 
        public LargeDorm(Dictionary<int,int> x) : base(x)
        {}
    }
    class Program
    {
        static void Main(string[] args)
        {
            Dictionary<int, int> smalldorm_rooms = new Dictionary<int, int>() {{1,0},{2,0},{3,3}};
            SmallDorm smalldorm = new SmallDorm(smalldorm_rooms);
            Dictionary<int,int> largedorm_rooms = new Dictionary<int, int>() {{11,0},{12,1},{13,0}};
            LargeDorm largedorm = new LargeDorm(largedorm_rooms);

            Boarder Sari = new Boarder("Lala","Sari",18,4.7,7000,-1);
            Boarder Judit = new Boarder("Lala","Judit",16,4.8,10000,-1);

            Boarder Peti = new Boarder("Peti","Peti",15,4.0,7000,3);
            Boarder Kata = new Boarder("Lala","Kata",15,4.0,7000,3);
            Boarder Arpi = new Boarder("Lala","Arpi",15,4.0,1500,12);

            smalldorm.Enroll(Peti);
            smalldorm.Enroll(Kata);
            largedorm.Enroll(Arpi);

            Peti.dorm_fee(DormType.SmallDorm);
            Kata.dorm_fee(DormType.SmallDorm);
            Arpi.dorm_fee(DormType.LargeDorm);

            //generate a report for thebalance for students and dorms
            Console.WriteLine(Kata.FirstName + "'s room number: " + Kata.RoomNumber);
        }
    }
}
