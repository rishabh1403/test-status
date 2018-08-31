---
title: "Hackerrank | Solution of Plus Minus in Golang"
description: "In this post we will solve question plus minus from hackerrank. An easy one which only requires some type casting and formatted printing. Let's get started."
author: "Rishabh Jain"
keywords: ["rishabh","jain","rishabh jain","rishabh1403","blog","hackerrank","coding","golang","competitive","programming","tech","technology","plus","minus"]
tags: ["hackerrank","coding","golang"]
categories: ["hackerrank","coding","golang"]
date: 2018-08-31T20:10:21+05:30
draft: false
---
In this post we will solve question plus minus from hackerrank. An easy one which only requires some type casting and formatted printing. Let's get started.
<!--more-->
# Problem Statement
The question can be found at this [link](https://www.hackerrank.com/challenges/plus-minus/problem). The problem statement states that we are given an array of elements, and we need to print the fraction of positive, negative and zero numbers from the list.

Couple of things to note here is 

* We need to take array length as input
* In the next line, we are provided with an array of numbers
* We need not store the array elements itself, but we need to store the count of positive, negative and zero values.
* We are solving this in [golang](https://golang.org/) **(If you have been following along my posts, we will only be using concepts that we have already seen previously, so please refer to my older posts in case you need a refresher)**

# Challenges

* Choose our preferred language as [golang](https://golang.org/) on hackerrank. The moment we do that, we get some 50-60 lines of code which are very unfamiliar to someone who is new to language.
* Since we need to print the fractions and input are integers, we need some type casting.
* We need to print the fractions to six decimal places, we would need some formatting while printing the values.

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

    // Complete the plusMinus function below.
    func plusMinus(arr []int32) {


    }

    func main() {
        reader := bufio.NewReaderSize(os.Stdin, 1024 * 1024)

        nTemp, err := strconv.ParseInt(readLine(reader), 10, 64)
        checkError(err)
        n := int32(nTemp)

        arrTemp := strings.Split(readLine(reader), " ")

        var arr []int32

        for i := 0; i < int(n); i++ {
            arrItemTemp, err := strconv.ParseInt(arrTemp[i], 10, 64)
            checkError(err)
            arrItem := int32(arrItemTemp)
            arr = append(arr, arrItem)
        }

        plusMinus(arr)
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
* Replace it with our template, a basic empty main function.
So your code should look something like this. 

```go
    package main
    import "fmt"

    func main(){
        
    }
```

Now we need to think through about the number of variables we need. Let's see, we need one for the length of array, another for the array elements itself. We won't be declaring an array rather we will just take inputs in a temporary variable. Next we need to store count of positive, negative, and zeroes, so three more. To sum it all we need five integer type variables. Let's go ahead and declare them, and also take our array length as input.

```go
    ...
    var l,t,p,n,z int
    fmt.Scan(&l)

```

Next thing is to take our array values as inputs. We will loop `l` i.e. the length of input array times and take our temporary inputs in there. In the same loop, after we have taken our inputs, we can also check for our positive, negative and zeroes. We could also have declared an array , keep the inputs in the array and counted our numbers in a different loop, but that's just waste of memory and time. We don't need to store our array elements for any future use. So this approach, small concise and clear. Let's add the logic in our code.

```go

    ...
    for i:=0;i<l;i++{
        fmt.Scan(&t)
        if t >0 {
            p++
        }else if t < 0{
            n++    
        }else{
            z++    
        }
    }

```
So let's see what we are doing here. A simple for loop, looping `l` i.e. the length of array times and taking input for array elements. Next we are checking if the input is greater than zero, less than zero or equal to zero. Based on these conditions, we are increasing the counter of each variable. 

Next we need to find the fraction of these numbers. The thing to note here is both the counters i.e. number of positive, negative and zeroes as well as the total number of input elements are integers, so if we just go ahead and do something like `p/l` it will either give zero if `p<l` or one if `p==l`. Since both the numerator and denominator are integers, the output will round off and print ***zero or one***. So we need to type cast both the values to floats before doing the calculation. This would ensure that output is a decimal floating point number. So let's go ahead and calculate fraction of positive, negative and zeroes .

```go

    ...
    pf := float64(p)/float64(l)
    nf := float64(n)/float64(l)
    zf := float64(z)/float64(l)

```

Above written code snippet is pretty much self explanatory. Type casting all my variables and calculating the fractions. We are using `:=` syntax to declare and assign variables here, you could have very well declared those before, but make sure not to make it int type, we need it to be a floating type number. Next we need to print our numbers. We need to take care of two things 

* Precision of ***six*** decimal places
* Every result in new line

We will use `Printf` so that we can format and print our result. Let's see how that goes.

```go

    ...
    fmt.Printf("%.6f\n",pf)
    fmt.Printf("%.6f\n",nf)
    fmt.Printf("%.6f\n",zf)

```

All the three lines are similar, so we will just look at one and rest will become clear. In the `Printf` we are formatting using `"%.6f\n"`. It states that first print the floating point number that would be supplied after the comma, the floating point number should have six digits after decimal. It will auto pad it with zeroes if necessary. Next we adding a `\n` i.e newline after the number. This would print the result in the desired format. Now your complete code should look something like this

```go
    package main
    import "fmt"

    func main(){
        var l,p,n,z,t int
        fmt.Scan(&l)

        for i:=0;i<l;i++{
            fmt.Scan(&t)
            if t > 0 {
                p++
            }else if t <0 {
                n++
            }else {
                z++
            }
        }

        pf := float64(p)/float64(l)
        nf := float64(n)/float64(l)
        zf := float64(z)/float64(l)

        fmt.Printf("%.6f\n",pf)
        fmt.Printf("%.6f\n",nf)
        fmt.Printf("%.6f\n",zf)

    }
```

So this is it for this one, we learned some type casting and formatted printing in golang. Will see you in the next one.

There you go guys, you made it to the end of the blog. Please check out the video below if you still have any doubts. Subscribe to my [youtube channel](https://www.youtube.com/channel/UC4syrEYE9_fzeVBajZIyHlA) and my mailing list below for regular updates. Follow me on [twitter](https://www.twitter.com/rishabhjain1403) , drop me a mail or leave a comment here if you still have any doubts and I will try my best to help you out. Thanks

Stay tuned and see you around :)
{{< youtube 7996I_bqVmk >}}  
