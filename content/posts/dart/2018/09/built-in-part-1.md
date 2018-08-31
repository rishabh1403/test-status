---
title: "built in part 1"
description: "built in part 1"
author: "Rishabh Jain"
keywords: ["rishabh","jain","rishabh jain","rishabh1403","blog","competitive","coding","programming","tech","technology"]
tags: []
categories: []
date: 2018-08-31T21:08:59+05:30
draft: true
---
<!--more-->
# Built-in Types

What are built-in types? These are the types that a variable can be of and are already defined in dart i.e. built into dart programming language by default. Does that mean we can have our own custom types too ? Yes, we can. So dart is an object oriented programming language, and everything is an object. Every variable in Dart refers to an object i.e. it is an instance of a class. To make our custom type we just need to make sure the variable is an object, an instance of a class that we wrote, and that is how we can have our own type of variables. Pretty cool ha..!!!. We will look into creating classes and objects later on, for now let's stick to these built-in types and discuss these in detail. There are two parts of this post, in this one we will discuss about ***numbers, strings, and booleans*** and we will conclude the rest of them in the next one.

# Numbers

Numbers are used to store umm... numbers. Numbers can be any positive, negative or zero number. In Dart numbers are represented by either `int` or `double`. ***Int*** is to integers i.e. numbers without decimals while ***Double*** is to store decimal numbers or floating point numbers. Let's see an example

```dart

    int a = -2;
    int b = 3;
    int c = 0;
    
    double e = -2.5;
    double f = 0.0;
    double g = 1.5;
    
```

So this is how we use `int` and `double` in our Dart code. We have already used `int` before and will be using `double` in coming posts.

# Booleans

Booleans are as straight forward as it can be. If you need to store a `true` or `false` flag in your variable, you would use a boolean type of variable. To declare a variable boolean we would use `bool`. We will revisit bool again while dealing with `if-else`, but for the scope of this artice, I guess that is all to know about booleans. 

```dart
    bool isItRaining = true;
    bool isItSunny = false;
```

# String

Next on list, and the last one for this post is ***Strings***. Strings are a single or group of characters. It can be a letter or a number or group of combination of both. It can also include symbols like `!@#$%^&*` . Strings are very useful to store text data. To declare a string you would use `String` to declare a variable ***(notice the use of capital S)***. The text that is assigned to a string variable has to be wrapped in ***quotes*** . It can be either single quote, double quote or triple quotes. Let's look at those declarations

```dart

    String str = 'This is a string';
    String str1 = "This is another string";
    String str2 = ''' This is a multi line string
                        which I can continue in different lines
                        which provides easy formatting''';

```

Over here we see all three types of string declarations. The declaration with single quotes and double quotes are pretty much the same. We would wrap the text in single or double quotes and that is it. The declaration with triple quotes are interesting because here we can write in multiline. We can use line breaks, put spaces whereevr and however we want. This becomes really handy when you are writting long database queries. Multi-line strings can also be declared using `"""`, using three single quotes is not mandatory. So we can also do something like this

```dart

    String str = """ This
                    is also a valid multi line string """;

```

That's it for this one, there are some more things to cover in Strings which we will cover shortly. See you in the next one.

There you go guys, you made it to the end of the blog. Please check out the video below if you still have any doubts. Subscribe to my [youtube channel](https://www.youtube.com/channel/UC4syrEYE9_fzeVBajZIyHlA) and my mailing list below for regular updates. Follow me on [twitter](https://www.twitter.com/rishabhjain1403) , drop me a mail or leave a comment here if you still have any doubts and I will try my best to help you out. Thanks

Stay tuned and see you around :)
<!--
{{< youtube I8_pURh3l_s >}}  -->
