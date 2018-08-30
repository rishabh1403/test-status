---
title: "Hackerrank Solution of A Very Big Sum in Golang"
description: "Solution for hackerrank warmup question a very big sum in golang. This question is very similar to simple array sum problem. The only difference being that the input array is huge. Let's tackle that in this blog post."
author: "Rishabh Jain"
keywords: ["rishabh","rishabh jain","very","big","sum","rishabh1403","hackerrank","blog","golang","solution","learn","code"]
tags: ["hackerrank","coding","golang"]
categories: ["hackerrank","coding","golang"]
date: 2018-08-26T18:45:09+05:30
draft: false
---
Solution for hackerrank warmup question a very big sum in golang. This question is very similar to simple array sum problem. The only difference being that the input array is huge. Let's tackle that in this blog post.
<!--more-->
# Problem Statement
The question can be found at this [link](https://www.hackerrank.com/challenges/a-very-big-sum/problem). The problem statement basically states that we need to print the sum of an array of integers whose length is provided as input.
Couple of things to note here is 

* We need to take array length as input
* In the next line, we are provided with an array of numbers, whose sum we need to print
* The integers in the array are huge ( `0<= i <= 10^10` )
* we are solving this in [golang](https://golang.org/) **(assuming we know how to take input in [golang](https://golang.org/), refer to my [last post](https://rishabh1403.com/posts/coding/hackerrank/2018/08/hackerrank-solve-me-first-solution/) in case you need a refresher )**

# Challenges

* Choose our preferred language as [golang](https://golang.org/) on hackerrank. The moment we do that, we get some 50-60 lines of code which are very unfamiliar to someone who is new to language.
* To solve this problem only thing we need to know is how to take input, show output, iterate over an array(_kind of_), and calculate sum.

# Solution

This is the template you get on [hackerrank](https://www.hackerrank.com/) for this problem statement.

```go
package main

import (
    "bufio"
    "fmt"
    "io"
    "os"
    "strconv"
    "strings"
)

// Complete the aVeryBigSum function below.
func aVeryBigSum(ar []int64) int64 {


}

func main() {
    reader := bufio.NewReaderSize(os.Stdin, 1024 * 1024)

    stdout, err := os.Create(os.Getenv("OUTPUT_PATH"))
    checkError(err)

    defer stdout.Close()

    writer := bufio.NewWriterSize(stdout, 1024 * 1024)

    arCount, err := strconv.ParseInt(readLine(reader), 10, 64)
    checkError(err)

    arTemp := strings.Split(readLine(reader), " ")

    var ar []int64

    for i := 0; i < int(arCount); i++ {
        arItem, err := strconv.ParseInt(arTemp[i], 10, 64)
        checkError(err)
        ar = append(ar, arItem)
    }

    result := aVeryBigSum(ar)

    fmt.Fprintf(writer, "%d\n", result)

    writer.Flush()
}

func readLine(reader *bufio.Reader) string {
    str, _, err := reader.ReadLine()
    if err == io.EOF {
        return ""
    }

    return strings.TrimRight(string(str), "\r\n")
}

func checkError(err error) {
    if err != nil {
        panic(err)
    }
}

```
* First go ahead and delete everything in the pre-existing template.
* Since the question is very similar to one of the previos ones, same code works for this one too. Refer to **[Simple Array Sum](https://rishabh1403.com/posts/coding/hackerrank/2018/08/hackerrank-solution-of-simple-array-sum-in-golang/)** post for complete explation of the solution.
So your solution should look something like this. 

```go
package main
import "fmt"

func main(){
    var n,temp,sum int
    fmt.Scan(&n)
    for i:=0;i<n;i++{
        fmt.Scan(&temp)
        sum += temp
    }
    fmt.Println(sum)
}
```
The same code works here too, so what is all the fuss about long integers? Actually, although this code runs all well and good, the compiler is expecting a slightly different answer from you. An answer which would demonstrate that you understand that the concepts of memory and bits in a program. Now let me show you what I am talking about. 

```go
package main
import "fmt"

func main(){
    var n,temp,sum int64
    fmt.Scan(&n)
    for i:=int64(0);i<n;i++{
        fmt.Scan(&temp)
        sum += temp
    }
    fmt.Println(sum)
}
```
Notice in this code snippet I made two changes

* In the variable declaration line, the variables are declared as **int64** type
* `i:=0` is type casted to int64 type

Basically this explicitly tells the compiler to allocate 64bits of memory for these variables. Technically the range of **n** (length of array) is  1 to 10, so we could have specified int type for **n** and no type casting would have been required, or even a smaller signed type would have worked, with a type casting while initializing **i**. 

Now the bigger question is why did the code with declaration of variables with `int` type work? The way golang works is int takes 32bit or 64bit depending on the platform. So if your platform running the code supported 64bit, int would have handled 64bit values and code would run just fine else it would fall back to 32bit. However if your platform doesn't support 64bit, int64 **won't** work either.
So that is the reason both of the code snippets work and pass all the test cases.
 
There you go guys, you made it to the end of the blog. Please check out the video below if you still have any doubts, subscribe to my [youtube channel](https://www.youtube.com/channel/UC4syrEYE9_fzeVBajZIyHlA) for regular updates, subcribe to my mailing list below, follow me on [twitter](https://www.twitter.com/rishabhjain1403) , drop me a mail or leave a  comment here if you still have any doubts and I will try my best to help you out. Thanks

Stay tuned and see you around :)
{{< youtube LhgqF1vzkGc>}}
