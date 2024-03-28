// Online C# Editor for free
// Write, Edit and Run your C# code using C# Online Compiler

using System;

//abstract class
abstract class BaseClass
{
    protected int _x = 100;
    protected int _y = 150;
    
    //abstract method
    public abstract void AbstractMethod();
    
    //Abstract properties
    public abstract int X { get; }
    public abstract int Y { get; }
}

class DerivedClass : BaseClass
{
    public override void AbstractMethod()
    {
        _x++;
        _y++;
    }
    
    public override int X //overriding property
    {
        get
        {
            return _x + 10;
        }
    }
    
    public override int Y //overriding property
    {
        get
        {
            return _y + 10;
        }
    }
    
    static void Main()
    {
        var o = new DerivedClass();
        o.AbstractMethod();
        Console.WriteLine($"x = {o.X}, y = {o.Y}");
    }
}
//output: x = 111, y = 161
