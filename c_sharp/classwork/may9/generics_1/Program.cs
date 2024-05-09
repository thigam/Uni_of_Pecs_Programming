using System;
class Program
{

static void Main(string[] args)
{
    DataStore<string> strStore = new DataStore<string>();
    strStore.Data = "Hello World!";
    //strStore.data = 123; //compile-time error

    DataStore<int> intStore = new DataStore<int>();
    intStore.Data = 100;
    //intStore.Daat= "Hello world!"; // compile-time error

    KeyValuePair<int, string> kvp1 = new KeyValuePair<int, string>();
    kvp1.Key = 100;
    kvp1.Value = "Hundred";

    KeyValuePair<string, string> kvp2 = new KeyValuePair<string, string>();
    kvp2.Key = "IT";
    kvp2.Value = "Information Technology";
}

class DataStore<T>
{
    public T Data { get; set;}
}

class KeyValuePair<TKey, TValue>
{
    public TKey Key { get; set; }
    public TValue Value { get; set; }
}
}