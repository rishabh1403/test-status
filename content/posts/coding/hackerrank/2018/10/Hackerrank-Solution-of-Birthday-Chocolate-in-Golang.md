---
title: "Hackerrank | Solution of Birthday Chocolate in Golang"
description: "In this one we will solve question birthday chocolate from hackerrank in golang. Sweet one, let's dive right into it."
author: "Rishabh Jain"
keywords: ["rishabh","jain","rishabh jain","rishabh1403","blog","competitive","coding","programming","tech","technology","go","golang","hackerrank","hackerrank solutions","solutions in golang","birthday chocolate"]
tags: ["hackerrank","coding","golang"]
categories: ["hackerrank","coding","golang"]
date: 2018-10-03T13:51:59+05:30
draft: true
---
In this one we will solve question birthday chocolate from hackerrank in golang. Sweet one, let's dive right into it.
<!--more-->

# Problem Statement
The question can be found at this [link](https://www.hackerrank.com/challenges/the-birthday-bar/problem). The problem statement states that we are given a chocolate bar and two numbers. We need to find all those continuous length of chocolate bars where length of bar is equal to one number and sum of weights of bar is equal to other. 

# Challenges

* Choose our preferred language as [golang](https://golang.org/) on hackerrank. The moment we do that, we get some 50-60 lines of code which are very unfamiliar to someone who is new to language.
* Cracking the logic required to solve the question.
* A chocolate bar nearby to celebrate once we solve the question

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

    // Complete the birthday function below.
    func birthday(s []int32, d int32, m int32) int32 {


    }

    func main() {
        reader := bufio.NewReaderSize(os.Stdin, 16 * 1024 * 1024)

        stdout, err := os.Create(os.Getenv("OUTPUT_PATH"))
        checkError(err)

        defer stdout.Close()

        writer := bufio.NewWriterSize(stdout, 16 * 1024 * 1024)

        nTemp, err := strconv.ParseInt(strings.TrimSpace(readLine(reader)), 10, 64)
        checkError(err)
        n := int32(nTemp)

        sTemp := strings.Split(strings.TrimSpace(readLine(reader)), " ")

        var s []int32

        for i := 0; i < int(n); i++ {
            sItemTemp, err := strconv.ParseInt(sTemp[i], 10, 64)
            checkError(err)
            sItem := int32(sItemTemp)
            s = append(s, sItem)
        }

        dm := strings.Split(strings.TrimSpace(readLine(reader)), " ")

        dTemp, err := strconv.ParseInt(dm[0], 10, 64)
        checkError(err)
        d := int32(dTemp)

        mTemp, err := strconv.ParseInt(dm[1], 10, 64)
        checkError(err)
        m := int32(mTemp)

        result := birthday(s, d, m)

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

Let's think about the variables we would need. We need the length of the bar `n`, the day `d` of birthday, the month of birthday `m` and the count of bar segments which satisfy the condition `c`. Now what about the array, do we need to take the whole array as input in an array or can we just keep taking the input in some temporary variable do some operation and be done with it ? In this case we need to loop over the bar segment after we have taken the input, so we need the array itself. Let's go ahead, declare the variables, array, and take the inputs as required.

```go

	...
    var n,d,m,c int
    fmt.Scan(&n)
    
    a:= make([]int,n)
    for i:=0;i<n;i++{
        fmt.Scan(&a[i])
    }
    fmt.Scan(&d,&m)

```

Here we have declared the variables, our array, and taken the inputs in the desired format. Now Let's discuss the logic. We need to start looking from the first block to last block. We also need an inner loop. We pick one block and start looping from there, adding the length of the bar as well as it's weight. The moment either the length ***or*** weight increases the month or day we break out of inner loop. The moment the length ***and*** weight equals month and day we found a match, we increase the counter and break out of loop. At the last we print the counter. If this sounds clear let's implement it.

```go

    for i:=0;i<n;i++{
        length,sum := 0,0
        for j:=i;j<n;j++{
            length++
            sum += a[j]
            if length == m && sum == d {
                c++
                break;
            }
            if sum > d || length > m{
                break
            }
        }
        // break brings here
    }
    fmt.Println(c)

```

So here we have an outer loop which will pick up the starting point of our bar. At the start we initialize the length and sum to `0`. Then we start looping from the `ith` position to end, till we find a match or condition fails. On each iteration, we increase the length of bar that we traversed and add the weight to sum. Then we apply our logic which we previously discussed. At the end we just print the counter. So now your complete code should look something like.

```go

package main

import "fmt"

func main(){
    var n,d,m,c int
    fmt.Scan(&n)
    
    a:= make([]int,n)
    for i:=0;i<n;i++{
        fmt.Scan(&a[i])
    }
    fmt.Scan(&d,&m)
    
    for i:=0;i<n;i++{
        length,sum := 0,0
        for j:=i;j<n;j++{
            length++
            sum += a[j]
            if length == m && sum == d {
                c++
                break;
            }
            if sum > d || length > m{
                break
            }
        }
        // break brings here
    }
    fmt.Println(c)
}

```

This is it for this one, complete source code for this post can be found on my [Github Repo](//TODO ADD repo). Will see you in the next one.

There you go guys, you made it to end of the post. Please check out the video below if you still have any doubts. Subscribe to my [youtube channel](https://www.youtube.com/channel/UC4syrEYE9_fzeVBajZIyHlA) and my mailing list below for regular updates. Follow me on [twitter](https://www.twitter.com/rishabhjain1403) , drop me a mail or leave a comment here if you still have any doubts and I will try my best to help you out. Thanks

Stay tuned and see you around :)
<!--
{{< youtube I8_pURh3l_s >}}  -->
