---
title: "Hackerrank | Solution of Bon Appetit in Golang"
description: "In this one we will solve the question Bon Appetit from hackerrank in golang. Let's dive right into it."
author: "Rishabh Jain"
keywords: ["rishabh","jain","rishabh jain","rishabh1403","blog","competitive","coding","programming","tech","technology"]
tags: []
categories: []
date: 2018-10-04T16:42:04+05:30
draft: true
---
In this one we will solve the question Bon Appetit from hackerrank in golang. Let's dive right into it.
<!--more-->


# Problem Statement
The question can be found at this [link](http://localhost:1313/posts/coding/hackerrank/2018/10/hackerrank-solution-of-bon-appetit-in-golang/). The problem statement states that we are to decide if the bill was split fairly between two people or not. If not, what amount must be refunded.

# Challenges

* Choose our preferred language as [golang](https://golang.org/) on hackerrank. The moment we do that, we get some 50-60 lines of code which are very unfamiliar to someone who is new to language.
* Cracking the logic required to solve the question.
* You need to be a food lover and non-allergic to everything, just kidding.

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

    // Complete the bonAppetit function below.
    func bonAppetit(bill []int32, k int32, b int32) {


    }

    func main() {
        reader := bufio.NewReaderSize(os.Stdin, 16 * 1024 * 1024)

        nk := strings.Split(strings.TrimSpace(readLine(reader)), " ")

        nTemp, err := strconv.ParseInt(nk[0], 10, 64)
        checkError(err)
        n := int32(nTemp)

        kTemp, err := strconv.ParseInt(nk[1], 10, 64)
        checkError(err)
        k := int32(kTemp)

        billTemp := strings.Split(strings.TrimSpace(readLine(reader)), " ")

        var bill []int32

        for i := 0; i < int(n); i++ {
            billItemTemp, err := strconv.ParseInt(billTemp[i], 10, 64)
            checkError(err)
            billItem := int32(billItemTemp)
            bill = append(bill, billItem)
        }

        bTemp, err := strconv.ParseInt(strings.TrimSpace(readLine(reader)), 10, 64)
        checkError(err)
        b := int32(bTemp)

        bonAppetit(bill, k, b)
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

Let's decide on the variables we need. If we look at the input format we need the length of array `n`, the food item that Anna didn't eat `k` , amount that Anna was charged by Brian `c` and a temporary variable `t` to take the cost of food items. We don't need to declare a complete array and store it, we can just keep taking input in some temp variable, do some operations on it and be done with it. Now cost of all the food items were split except for the items at index `k`, so while taking input we will also calculate the sum of all the prices except for the price at the item at index `k`. Let's convert all this to code and get back to discussion

```go

    ...
    var n,k,c int
    fmt.Scan(&n,&k)
    sum,t := 0,0
    for i:=0;i<n;i++{
        fmt.Scan(&t)
        if i != k {
            sum += t
        }
        
    }
    fmt.Scan(&c)

```
So we are declaring the variables discussed, taking a sum variable to store the sum of prices ( except for index k ) , and also taking the price Anna paid. Now let's discuss the logic. If the sum calculated above when divided by 2 is equal to `c` , that means Anna paid the correct amount and we will print the message `Bon Appetit`, else Anna did pay more than she should. In that case we need to calculate the refund. To calculate the refund, we already have the amount that Anna paid `c` , and the amount she should have paid `sum/2`, we just need to calculate the difference. That would be the amount that Brian needs to refund back to Anna. Let's implement this logic.

```go
    ...
    if sum/2 == c {
        fmt.Println("Bon Appetit")
    }else{
        refund := c - sum / 2
        fmt.Println(refund)
    }

```

Nothing fancy, just converted text to code. So now the complete code should look like.

```go

package main

import "fmt"

func main(){
    var n,k,c int
    fmt.Scan(&n,&k)
    sum,t := 0,0
    for i:=0;i<n;i++{
        fmt.Scan(&t)
        if i != k {
            sum += t
        }
        
    }
    fmt.Scan(&c)
    if sum/2 == c {
        fmt.Println("Bon Appetit")
    }else{
        refund := c - sum / 2
        fmt.Println(refund)
    }
    
}

```

Enjoy your meal !!! This is it for this one, complete source code for this post can be found on my [Github Repo](//TODO ADD repo). Will see you in the next one.

There you go guys, you made it to end of the post. Please check out the video below if you still have any doubts. Subscribe to my [youtube channel](https://www.youtube.com/channel/UC4syrEYE9_fzeVBajZIyHlA) and my mailing list below for regular updates. Follow me on [twitter](https://www.twitter.com/rishabhjain1403) , drop me a mail or leave a comment here if you still have any doubts and I will try my best to help you out. Thanks

Stay tuned and see you around :)
<!--
{{< youtube I8_pURh3l_s >}}  -->
