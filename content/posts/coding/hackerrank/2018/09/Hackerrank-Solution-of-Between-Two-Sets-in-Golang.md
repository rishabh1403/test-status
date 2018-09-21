---
title: "Hackerrank | Solution of Between Two Sets in Golang"
description: "In this one we will discuss the solution of Between two sets in Golang. It wraps good amount of logic, will be fun solving it. Let's dive right into it."
author: "Rishabh Jain"
keywords: ["rishabh","jain","rishabh jain","rishabh1403","go","golang","hackerrank solutions","solutions in golang","between two sets hackerrank","blog","competitive","coding","programming","tech","technology"]
tags: ["coding","golang","hackerrank"]
categories: ["coding","golang","hackerrank"]
date: 2018-09-21T18:39:04+05:30
draft: false
---
In this one we will discuss the solution of Between two sets in Golang. It wraps good amount of logic, will be fun solving it. Let's dive right into it.
<!--more-->
# Problem Statement
The question can be found at this [link](https://www.hackerrank.com/challenges/between-two-sets/problem). The problem statement states that we need to find the number of all the integers which satisfy two given conditions.

* The integers of first given array are all factors of the selected integer i.e. all the numbers in the first array should divide the given integer perfectly.
* The integer being chosen divides all the numbers of second array perfectly.

# Challenges

* Choose our preferred language as [golang](https://golang.org/) on hackerrank. The moment we do that, we get some 50-60 lines of code which are very unfamiliar to someone who is new to language.
* Working with factors.
* Cracking the range of numbers in which our integers exist.

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
     * Complete the getTotalX function below.
     */
    func getTotalX(a []int32, b []int32) int32 {
        /*
         * Write your code here.
         */

    }

    func main() {
        reader := bufio.NewReaderSize(os.Stdin, 1024 * 1024)

        outputFile, err := os.Create(os.Getenv("OUTPUT_PATH"))
        checkError(err)

        defer outputFile.Close()

        writer := bufio.NewWriterSize(outputFile, 1024 * 1024)

        nm := strings.Split(readLine(reader), " ")

        nTemp, err := strconv.ParseInt(nm[0], 10, 64)
        checkError(err)
        n := int32(nTemp)

        mTemp, err := strconv.ParseInt(nm[1], 10, 64)
        checkError(err)
        m := int32(mTemp)

        aTemp := strings.Split(readLine(reader), " ")

        var a []int32

        for aItr := 0; aItr < int(n); aItr++ {
            aItemTemp, err := strconv.ParseInt(aTemp[aItr], 10, 64)
            checkError(err)
            aItem := int32(aItemTemp)
            a = append(a, aItem)
        }

        bTemp := strings.Split(readLine(reader), " ")

        var b []int32

        for bItr := 0; bItr < int(m); bItr++ {
            bItemTemp, err := strconv.ParseInt(bTemp[bItr], 10, 64)
            checkError(err)
            bItem := int32(bItemTemp)
            b = append(b, bItem)
        }

        total := getTotalX(a, b)

        fmt.Fprintf(writer, "%d\n", total)

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
* Let's write down our main wrapper function.

```go
package main
import "fmt"

func main(){

}
```

First of all as always we will discuss on how many variables we need. We need the length of first array `n`, length of second array `m`, and a counter variable to store the result `c`. Now we need to make a decision whether we need to take whole array as input or we can just take array elements as input in temporay variable, use it and let go of it. In this case we need to do some operation of our array elements after all the elements have been taken as input, so we need to take the whole array as input, for both the arrays. So let's go ahead, declare our variables, take our inputs, create arrays and we will discuss the logic after that.

```go

    ...
    var n,m,c int
    fmt.Scan(&n,&m)
    
    a := make([]int,n)
    b := make([]int,m)
    
    for i :=0;i<n;i++{
        fmt.Scan(&a[i])
    }
    for i:=0;i<m;i++{
        fmt.Scan(&b[i])
    }

```

So, we declared our variables, took the length of arrays as inputs, declared arrays and took array elements as input. Now comes the logic. Let's first think in what range can a number lie which will satisfy both the required conditions. If a number is divisible by all numbers of an array (***first condition***) it has to be larger than or equal to all the numbers in the array. Now the array size is `1 <= a[i] <= 100`, so taking the worst case where all numbers in the array are `1`, our search parameter can be any number ***greater than or equal to 1*** . That is infinite possibilities. But we got a lower bound, ***Number should be greater than or equal to 1***, next second condition says the number should be a factor or all the numbers in second array, for that to happpen ***the number chosen should be less than or equal to all the numbers of array***, taking the worst case again, if all the numbers of the array are `100` i.e. the largest number, our chosen number should be ***less than or equal to 100***. So now we have our lower bound as well as the uppper bound for our number. So our answers lie in the range from ***1 to 100***. Now we need to loop over the numbers, check if they satisfy both the conditions and increase the counter. Let's look at the code and then we will discuss the minute details about the code implementation

```go

	...
    for i:=1;i<=100;i++{
        factor := true
        
        //check first
        for j:=0;j<n;j++{
            if i % a[j] != 0 {
                factor = false
                break
            }
        }
        // check second
        if factor {
            for j :=0;j<m;j++{
                if b[j]%i !=0 {
                    factor = false
                    break
                }
            }
        }
        //update counter
        if factor{
            c++
        }
        
    }
    fmt.Println(c)

```

Here we are looping over our decided range and assuming the number satisfies both the condition. `factor := 0` holds the flag for that logic. Now we will loop over our first array and check for our condition i.e. all number of the array should perfectly divide the number. If at any point the condition is not met we flip the `factor` to false and break out of the loop, as there is no point checking any further. Now we only check for our condition in second loop if the ***factor is still true*** , otherwise there is really no point checking. If the factor is true, we applu the same logic here. Now after all these checks if factor is still true, we have found a match, and we increment our counter. At the end of our for loop we just print out the result. So now your complete code should look like

```go

package main

import "fmt"

func main(){
    var n,m,c int
    fmt.Scan(&n,&m)
    
    a := make([]int,n)
    b := make([]int,m)
    
    for i :=0;i<n;i++{
        fmt.Scan(&a[i])
    }
    for i:=0;i<m;i++{
        fmt.Scan(&b[i])
    }
    
    for i:=1;i<=100;i++{
        factor := true
        
        //check first
        for j:=0;j<n;j++{
            if i % a[j] != 0 {
                factor = false
                break
            }
        }
        // check second
        if factor {
            for j :=0;j<m;j++{
                if b[j]%i !=0 {
                    factor = false
                    break
                }
            }
        }
        //update counter
        if factor{
            c++
        }
        
    }
    fmt.Println(c)
}

```

Phew!!! it was a good one. We discussed how to narrow down our search space, used a flag and break to limit the computations, and came out with a working solution. This is it for this one, complete source code for this post can be found on my [Github Repo](https://github.com/rishabh1403/hackerrank-golang-solutions/blob/master/practice/algorithms/implementation/between-two-sets.go). Will see you in the next one.

There you go guys, you made it to end of the post. Please check out the video below if you still have any doubts. Subscribe to my [youtube channel](https://www.youtube.com/channel/UC4syrEYE9_fzeVBajZIyHlA) and my mailing list below for regular updates. Follow me on [twitter](https://www.twitter.com/rishabhjain1403) , drop me a mail or leave a comment here if you still have any doubts and I will try my best to help you out. Thanks

Stay tuned and see you around :)
{{< youtube LJ6nUUZpBiE >}}  
