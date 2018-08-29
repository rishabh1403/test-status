---
title: "Dart Programming Language Tutorial Part 4 | Comments"
description: "In this post we will look into various ways in which we can write comments in dart. Let's get started."
author: "Rishabh Jain"
keywords: ["rishabh","rishabh jain","rishabh1403","blog","comments","dart","dartlang","tutorial","programming","language","solution"]
tags: ["dart","tutorial"]
categories: ["dart"]
date: 2018-08-30T01:15:14+05:30
draft: false
---
In this post we will look into various ways in which we can write comments in dart. Let's get started.
<!--more-->
# Quick Note

If you notice our original road map, we had data types before comments. Comments were the third topic in the list, but we are taking it just after variables. There are two reasons for this quick diversion 

* Comments are a very small and easy topic, let's get it out of the way
* We are already using it from the very first post!!!

# Comments

There are many times when our long, complex code becomes cryptic and putting in some help text in there becomes necessary, so that someone else looking at the code or even the one who wrote it, looking at it later in time can understand it well. These help text are generally in plain text, strings, that can be simple plain English or any other language that you might be comfortable with. These comments can be small (adjusted in single line), big explanations (multi line), and can used for formally documenting your code. Now we need some way for our dart compiler to ignore these comments, because these do not wrap program logic, they don't affect output or behaviour of the program. Comments are just for our ease, to help us understand our own code or others code better. 

We have three types of comments in dart. Let's look into then one by one.

## Single line comments

Single line comments are, well comments that fit in a single line. To write a single line comment we start the line with `//`  and write our comment. If you remember our two lines `code starts here` and `code ends here` used to start with `//`. Those two lines were single line comments. 

```dart

    // this is a single line comment

```

## Multi line comments

Multi line comments are comments that can be written in multiple lines. They start with `/*` and end with `*/`. Basically, everything that these two wraps become comments. Multi-line comments are very useful to describe complex program logic. Let's see an example

```dart

    /* 

    This is a multi-line comment.
    I can go to next line too.
    I can write code here.
    int a =0;
    this code won't run.

    */

```

## Documentation comments

Documentation comments are used to write documentation inside code. It can be single line using `///` or multiline `/**` . The difference between a normal comment and a documentation comment is compiler ignores the documentation comments except for the text inside `[]` . It creates a link when passed through a documentation generation tool.

```dart

    /// variable [alpha] holds the value of the result from the complex calculation

```

Here `[alpha]` will become a link to the original variable alpha where it was declared. 


There you go guys, you made it to the end of the blog. Please check out the video below if you still have any doubts. Subscribe to my [youtube channel](https://www.youtube.com/channel/UC4syrEYE9_fzeVBajZIyHlA) and my mailing list below for regular updates. Follow me on [twitter](https://www.twitter.com/rishabhjain1403) , drop me a mail or leave a comment here if you still have any doubts and I will try my best to help you out. Thanks

Stay tuned and see you around :)
{{< youtube REP2btkSM7k >}}  
