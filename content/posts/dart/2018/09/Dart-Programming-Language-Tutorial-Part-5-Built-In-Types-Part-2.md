---
title: "Dart Programming Language Tutorial Part 5 | Built-In Types Part 2"
description: "In the last post we discussed numbers, strings and booleans. In this one, we will conclude built-in types by discussing lists and maps. Let's get started."
author: "Rishabh Jain"
keywords: ["rishabh","jain","rishabh jain","rishabh1403","blog","competitive","coding","programming","tech","technology"]
tags: []
categories: []
date: 2018-09-06T10:40:11+05:30
draft: true
---
In the last post we discussed numbers, strings and booleans. In this one, we will conclude built-in types by discussing lists and maps. Let's get started.
<!--more-->

# Lists in Dart

Lists are basically a list of numbers or words or both. Let's say you want to store age of all the students in a class. You would need a list. Let's say you need to store list of names of all cities in the world, you would need a List. Just like variables, there are multiple ways to declare a list, let's have a look at them.

```dart

    var a = [1,2,3];
    var b = ["abc","sdf"];
    var c = [1,2,"abc"];

    List<int> e = [1,2,3];
    List<String> f = ["def","abc"];
    List<dynamic>  g = [1,2,"abc"];

```

If you remember from the section on variables, `var` auto infers the type of varoiable. In the case of list too, var auto infers the type of list. In case of `a`, we are creating a list of integers, in case of `b`, we are creating a list of strings. In these cases, it is pretty clear for `var` to infer the type of list, however in case of `c` we have put integers as well as string in list and var can't decide for sure what the type should be, thus the list is assigned a dynamic type. Other method of declaring a list is using `List<type>` instead of `var`. When we use this type of syntax, we are locking the list of some particular type, and hence list can take only that type of data. However if we lock it to `dynamic` type we can put any type of data we like. Now let's look at how we can get values stored in list, and how many values are stored in list.

```dart

    var a = [12,13,14];

    print(a[0]); // 12

    print(a.length); // 3

```

So we can access values in the list using their index. The index is the position os an elemnet in a list. In many programming language positions in a list start with `zero`. So in our case `12` is at position `zero`, `13` is at position `one` and so on. To access these elements, we use square brackets syntax to reference elements at a particular index. Next to get the total number of elements in list, or the length of the list, we use a method ( will cover in later sections) called `length`. It gives the total number of elements in the list. Next let's see how we can change elements in a list and create a constant list, so that it's values can't be changed in a program.

```dart

    var a [1,2,3];

    a[1] = 12;

    print(a[1]);  // 12 -> value changed

    var b = const [1,2,3]; // we can't use final here

    b[1] = 12;  // error

```

Let's discuss the above code snippet. First we are creating a list, next we are changing the element at a particular index and printing it. All well and good till here. Next if we want to create a constant list, we use `const` just before the list assignment. If you remember from our previous discussion `final` creates a constant variable and `cosnt` creates a constant value. In our case we are looking at a specific use case of constant value. We can't use `final` over here. In the next line we can see that changing a value at a particular index gives us an error. We will revist lists and some of it's methods later, but for the built-in section sake of it, we are done with lists. Let's move to maps.

# Maps in Dart





This is it for this one, complete source code for this post can be found on my [Github Repo](//TODO ADD repo). Will see you in the next one.

There you go guys, you made it to end of the post. Please check out the video below if you still have any doubts. Subscribe to my [youtube channel](https://www.youtube.com/channel/UC4syrEYE9_fzeVBajZIyHlA) and my mailing list below for regular updates. Follow me on [twitter](https://www.twitter.com/rishabhjain1403) , drop me a mail or leave a comment here if you still have any doubts and I will try my best to help you out. Thanks

Stay tuned and see you around :)
<!--
{{< youtube I8_pURh3l_s >}}  -->
