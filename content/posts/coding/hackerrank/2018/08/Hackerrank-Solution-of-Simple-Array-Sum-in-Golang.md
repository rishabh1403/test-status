---
title: "Hackerrank Solution of Simple Array Sum in Golang"
description: "Solution for hackerrank warmup question simple array sum in golang. In this blog I'll discuss my solution, what mistakes I initially made and what concepts I learned."
author: "Rishabh Jain"
keywords: ["rishabh","rishabh jain","simple","array","sum","rishabh1403","hackerrank","blog","golang","solution","learn","code"]
tags: ["hackerrank","coding","golang"]
categories: ["hackerrank","coding","golang"]
date: 2018-08-25T00:55:09+05:30
draft: false
---
Solution for hackerrank warmup question simple array sum in golang. In this blog I'll discuss my solution, what mistakes I initially made and what concepts I learned.<!--more-->
# Problem Statement
The question can be found at this [link](https://www.hackerrank.com/challenges/simple-array-sum/problem). The problem statement basically states that we need to print the sum of an array of integers whose length is provided as input.
Couple of things to note here is 

* We need to take array length as input
* In the next line, we are provided with an array of numbers, whose sum we need to print
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

/*
 * Complete the simpleArraySum function below.
 */
func simpleArraySum(ar []int32) int32 {
    /*
     * Write your code here.
     */

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

    var ar []int32

    for arItr := 0; arItr < int(arCount); arItr++ {
        arItemTemp, err := strconv.ParseInt(arTemp[arItr], 10, 64)
        checkError(err)
        arItem := int32(arItemTemp)
        ar = append(ar, arItem)
    }

    result := simpleArraySum(ar)

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
* Add a package name `package main`
* Import **"fmt"** library for input and output operations. 
* Next add a empty main function below our import statement.
* If any of these steps seems unfamiliar to you, please refer to my [last post](https://rishabh1403.com/posts/coding/hackerrank/2018/08/hackerrank-solve-me-first-solution/)  

Up until now our code should look something like this 
```go
package main
import "fmt"

func main() {
    
}
```
Now it is time to write the program logic. First we need to declare a variable to take length of our array as input. 
Second, we need to take the **whole** array as input, or maybe not. We are only concerned with each single integer in array once, we don't need to store those numbers for any future use. We can very well take single numbers as inputs, keep them in temp variable, add that to sum and move ahead. Well that sums our logic. Next we need a sum variable to store our sum. Let's go ahead and add these variable declarations.  
```go
var n,temp,sum int
```
Next step is taking the length of the array as input. We will just use our **Scan** as that is easier(no formatting required).
```go
fmt.Scan(&n)
```
Now we need to iterate **_n_** times, take inputs and calculate their sum.
# Loops in Golang
If you are coming from other programming languages, you may find it weird that golang has only for loops. It does not have while or do while loops. However there are ways you can use golang's for loop to achieve the same behaviour that while and do while provides in any other programming languages. We will use a for loop to take inputs here and find their sum.
```go
for i:=0;i<n;i++{
    fmt.Scan(&temp)
    sum += temp
}
```
Okay, so the for loop looks little weird. So if you watched my video along with last post, you already know what `:=` means. Basically it is declaring and initializing a variable `i` which is visible only in the scope of for loop. Next we have our loop conditions and increment operator. The parenthesis `()` around the whole thing is not required, however the `{}` are **must** even if you only have a single statement inside for loop.
Then we are taking a integer input in temp. Next We are adding that to sum. 

Hold on a minute, wouldn't `sum += temp` throw a error for the first time? You never initialized the value of sum to 0. In golang it wouldn't. In golang all variables are assigned **_zero_** values when they are declared. Integers have 0 as zero values, strings have empty strings "" etc. So when we declared sum it also got initialized with 0, hence `sum += temp` won't throw an error for the first time.

Phew!!! All the heavy lifting has been done. Let's just the sum and get over with it.
```go
fmt.Println(sum)
```
Now Your final code should look something like this.
```go
package main
import "fmt"

func main(){
    var n, temp,sum int
    fmt.Scan(&n)
    for i:=0;i<n;i++{
        fmt.Scan(&temp)
        sum += temp
    }
    fmt.Println(sum)
}
```

There you go guys, you made it to the end of the blog. Please check out the video below if you still have any doubts, subscribe to my [youtube channel](https://www.youtube.com/channel/UC4syrEYE9_fzeVBajZIyHlA) for regular updates, follow me on [twitter](https://www.twitter.com/rishabhjain1403) , drop me a mail or leave a  comment here if you still have any doubts and I will try my best to help you out. Thanks

Stay tuned and see you around :)
{{< youtube lUftBPb2gx0>}}
