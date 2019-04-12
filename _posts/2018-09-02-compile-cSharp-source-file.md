---
layout: post
title: "How to compile a C# source file without Visual Studio"
date: 2018-09-02
categories: blog development .Net
tags: C# .NET csc
---
You don't need Visual Studio to compile C# source code. Although VS is largely available I find it interesting to know how you can compile a simple source file to an executable file without it.

All you need is a text editor and a C# compiler. Luckily, both ships with Windows 10.

## Compiler

The compiler csc.exe is located:

C:\Windows\Microsoft.NET\Framework\v4.0.30319

## Example

Following an example (assuming you have added this location to your Windows PATH environment variable):

csc /t:exe EuroDollar.cs

would produce EuroDollar.exe in a snap.

Following the code of EuroDollar.cs

{% highlight Powershell %}
using System;

class Konsolendemo
{
    static void Main()
    {
        int i;
        Console.WriteLine("Euro --> Dollar Calculator\n");
        do
        {
            float rate, euro, dollar;
            Console.WriteLine("Please enter the current dollar exchange rate: ");
            rate = Convert.ToSingle(Console.ReadLine());
            Console.Write("How many Euros would you like to change? ");
            euro = Convert.ToSingle(Console.ReadLine());
            dollar = euro * rate;
            Console.WriteLine("You get " + dollar.ToString("0.00 $"));
            Console.WriteLine("Terminate? (j/n)");
            string s = Console.ReadLine();
            i = string.Compare(s,"j");
        } while (i != 0);
    }
}
{% endhighlight %}

