//if we want to store float values using a syntax similar toe nums, we can 
//create a static class that stores double values with the const modifier
public static class Constants
{
    public const Pi = 3.14;
    public const Sqrt2 = 1.4;
}

//enums can be of any numeric data type
//byte, short, int, unsigned int, sbyte, ushort, uint, long, ulong
//If you don't specify, it'll just be int
enum Categories: byte
{
    Electronics = 1,
    Food = 5,
    Automotive = 6,
    Arts = 10,
    BeautyCare = 11,
    Fashion = 15
}
