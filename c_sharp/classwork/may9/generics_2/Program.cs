using System;
using System.Collections.Generic;
class Program
{
static void Main(string[] args)
{
    DataStore<string> cities = new DataStore<string>();
    cities.AddOrUpdate(0, "Mumbai");
    cities.AddOrUpdate(1,"Chicago");
    cities.AddOrUpdate(2, "London");

    DataStore<int> empIds = new DataStore<int>();
    empIds.AddOrUpdate(0, 50);
    empIds.AddOrUpdate(1, 65);
    empIds.AddOrUpdate(2, 89);

    Console.WriteLine(cities.GetData(1));
    Console.WriteLine(empIds.GetData(0));
    Console.ReadKey();
}

class DataStore<T>
{
    private T[] _data = new T[10];

    public void AddOrUpdate(int index, T item)
    {
        if (index >= 0 && index < 10)
        _data[index] = item;
    }

    public T GetData(int index)
    {
        if (index >= 0 && index < 10)
        return _data[index];
        else
        {
            return default(T); 
            //it will return the default value of that type according
            //to the return valiue type, the string type returns
            //null, the int type returns 0, ad bool false, etc
        }
    }
}
}
