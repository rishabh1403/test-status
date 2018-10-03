---
title: "Hackerrank | Solution of Divisible Sum Pairs in Golang"
description: "In this one we will solve question divisible sum pairs from hackerrank in golang. Let's get right into it."
author: "Rishabh Jain"
keywords: ["rishabh","jain","rishabh jain","rishabh1403","blog","competitive","coding","programming","tech","technology","go","golang","hackerrank","hackerrank solutions","solutions in golang","divisible sum pairs"]
tags: ["hackerrank","coding","golang"]
categories: ["hackerrank","coding","golang"]
date: 2018-10-03T14:42:10+05:30
draft: true
---
In this one we will solve question divisible sum pairs from hackerrank in golang. Let's get right into it.
<!--more-->

# Problem Statement
The question can be found at this [link](https://www.hackerrank.com/challenges/divisible-sum-pairs/problem). The problem statement states that we need to find all those pairs of numbers where sum of those numbers are divisible by a given number `k`. 

# Challenges

* Choose our preferred language as [golang](https://golang.org/) on hackerrank. The moment we do that, we get some 50-60 lines of code which are very unfamiliar to someone who is new to language.
* Cracking the logic required to solve the question.

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

    // Complete the divisibleSumPairs function below.
    func divisibleSumPairs(n int32, k int32, ar []int32) int32 {


    }

    func main() {
        reader := bufio.NewReaderSize(os.Stdin, 1024 * 1024)

        stdout, err := os.Create(os.Getenv("OUTPUT_PATH"))
        checkError(err)

        defer stdout.Close()

        writer := bufio.NewWriterSize(stdout, 1024 * 1024)

        nk := strings.Split(readLine(reader), " ")

        nTemp, err := strconv.ParseInt(nk[0], 10, 64)
        checkError(err)
        n := int32(nTemp)

        kTemp, err := strconv.ParseInt(nk[1], 10, 64)
        checkError(err)
        k := int32(kTemp)

        arTemp := strings.Split(readLine(reader), " ")

        var ar []int32

        for i := 0; i < int(n); i++ {
            arItemTemp, err := strconv.ParseInt(arTemp[i], 10, 64)
            checkError(err)
            arItem := int32(arItemTemp)
            ar = append(ar, arItem)
        }

        result := divisibleSumPairs(n, k, ar)

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
* Let's write down our main wrapper function.

```go
package main
import "fmt"

func main(){

}
```
Let's discuss the vaariables that we need for our question. We need the length of array `n`, the number `k`, the counter the store the result `c`,  and the array itself. Since we need to find pairs of numbers, instead of taking inputs in temporary variables we would need it in a array so that we can loop over it and form a pair. Let's declare our variables, our array, takes inputs and come back again to discuss the logic.

```go

	...
    var n,k,c int
    fmt.Scan(&n,&k)
    
    a := make([]int,n)
    
    for i:=0;i<n;i++ {
        fmt.Scan(&a[i])
    }
   
```

Nothing fancy here, declaring the variables as discussed, declaring the array and taking it's elements as inputs. Let's discuss the logic now. So we need to form pairs in a way where the `a[i]+a[j] % k = 0 and i<j ` , so it's pretty simple we will have a outer loop which will loop over the array from `0` to length of array while the inner loop will loop over the array from `i+1` i.e. the condition that `j>i` to length of array. Now we can form pairs of numbers from `(i,j) index` and check for divisibility by `k`. If it is divisible, we will increase the counter, else we will move one in the next loop. If that sounds clear, let's implement it now.

```go

	...
    for i:=0;i<n;i++{
        for j:=i+1;j<n;j++{
            if (a[i]+a[j]) % k == 0 {
                c++
            }
        }
    }
    fmt.Println(c)

```

Just implementing the logic we discussed and printing our counter. Now your complete code should look like

```go

package main

import "fmt"

func main(){
    var n,k,c int
    fmt.Scan(&n,&k)
    
    a := make([]int,n)
    
    for i:=0;i<n;i++ {
        fmt.Scan(&a[i])
    }
    
    for i:=0;i<n;i++{
        for j:=i+1;j<n;j++{
            if (a[i]+a[j]) % k == 0 {
                c++
            }
        }
    }
    fmt.Println(c)
}

```

This was a quick and easy one. This is it for this one, complete source code for this post can be found on my [Github Repo](//TODO ADD repo). Will see you in the next one.

There you go guys, you made it to end of the post. Please check out the video below if you still have any doubts. Subscribe to my [youtube channel](https://www.youtube.com/channel/UC4syrEYE9_fzeVBajZIyHlA) and my mailing list below for regular updates. Follow me on [twitter](https://www.twitter.com/rishabhjain1403) , drop me a mail or leave a comment here if you still have any doubts and I will try my best to help you out. Thanks

Stay tuned and see you around :)
<!--
{{< youtube I8_pURh3l_s >}}  -->
