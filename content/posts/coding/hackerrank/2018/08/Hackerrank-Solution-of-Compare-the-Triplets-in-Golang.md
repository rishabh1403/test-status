---
title: "Hackerrank Solution of Compare the Triplets in Golang"
description: "Solution for hackerrank warmup question compare the triplets in golang. In this question we will use if-else statement and arrays in golang for the first time along with for loops that we covered earlier." 
author: "Rishabh Jain"
keywords: ["very","big","sum","rishabh1403","hackerrank","blog","golang","solution","learn","code"]
tags: ["hackerrank","coding","golang"]
categories: ["hackerrank","coding","golang"]
date: 2018-08-24T22:33:09+05:30
draft: true
---
Solution for hackerrank warmup question compare the triplets in golang. In this question we will use if-else statement and arrays in golang for the first time along with for loops that we covered earlier.
<!--more-->
# Problem Statement
The question can be found at this [link](https://www.hackerrank.com/challenges/compare-the-triplets/problem). The problem statement states that we need to compare two sets of inputs and provide a result based on the comparison.  
Couple of things to note here is 

* We need to take six inputs, 3 on each line
* we are solving this in [golang](https://golang.org/) **(assuming we understand basic for loops, input, output in [golang](https://golang.org/), refer to my [earlier posts](https://rishabh1403.com/posts/coding/hackerrank/2018/08/hackerrank-solution-of-simple-array-sum-in-golang/) in case you need a refresher )**

# Challenges
* Choose our preferred language as [golang](https://golang.org/) on hackerrank. The moment we do that, we get some 50-60 lines of code which are very unfamiliar to someone who is new to language.
* To solve this problem only thing we need to know is how to take input, show output, iterate over an array, use if-else statement and arrays in [golang](https://golang.org)

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

// Complete the compareTriplets function below.
func compareTriplets(a []int32, b []int32) []int32 {


}

func main() {
    reader := bufio.NewReaderSize(os.Stdin, 16 * 1024 * 1024)

    stdout, err := os.Create(os.Getenv("OUTPUT_PATH"))
    checkError(err)

    defer stdout.Close()

    writer := bufio.NewWriterSize(stdout, 16 * 1024 * 1024)

    aTemp := strings.Split(strings.TrimSpace(readLine(reader)), " ")

    var a []int32

    for i := 0; i < 3; i++ {
        aItemTemp, err := strconv.ParseInt(aTemp[i], 10, 64)
        checkError(err)
        aItem := int32(aItemTemp)
        a = append(a, aItem)
    }

    bTemp := strings.Split(strings.TrimSpace(readLine(reader)), " ")

    var b []int32

    for i := 0; i < 3; i++ {
        bItemTemp, err := strconv.ParseInt(bTemp[i], 10, 64)
        checkError(err)
        bItem := int32(bItemTemp)
        b = append(b, bItem)
    }

    result := compareTriplets(a, b)

    for i, resultItem := range result {
        fmt.Fprintf(writer, "%d", resultItem)

        if i != len(result) - 1 {
            fmt.Fprintf(writer, " ")
        }
    }

    fmt.Fprintf(writer, "\n")

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
* Now as usual, create our outer program structure. This is not our final snippet, we will create a much optimized template in coming posts for fast I/O, but for now just go ahead and create a simple structure that we have been using this far.

```go
package main
import "fmt"

func main(){
    
}
```
If this seems unfamiliar, please refer to my [earlier posts](https://rishabh1403.com/posts/coding/hackerrank/2018/08/hackerrank-solve-me-first-solution/).
Next thing we need is to take 6 inputs. There are two options :-

* Take six variables
* Use arrays

Lets learn arrays!!!. So now I will declare 2 arrays of length 3 each and take inputs in those arrays.

```go
    var a [3]int
    var b [3]int
```
This is the syntax for declaring an array in golang. Like variable, type comes later and we provide the length of array in `[]`. ***Length of an array in golang is fixed***. Since both a, b are of same type, we could have clubbed the declaration like we club variable declaration.
Now we need to take our inputs, so ahead and add these lines of code.

```go
fmt.Scan(&a[0],&a[1],&a[2])
fmt.Scan(&b[0],&b[1],&b[2])
```

Nothing unusual, referencing indexes 0,1,2 and taking inputs.
Now we need to declare two more variables for storing result of the comparison, loop over the values and compare them.

```go
    var ar,br int
    for i:=0;i<3;i++{
        //compare here
    }
```

We are looping three times, as that's the length of our arrays. Next we need to add our comparison logic in there and print the result.

```go
        if a[i] > b[i] {
            ar++
        }else if b[i] > a[i] {
            br++
        }
	//after for
	fmt.Println(ar,br)
```

# If-ELSE in Golang
If-else in golang is also similar to for, `()` not mandatory , `{}` is must. rest is pretty much self explanatory. Notice the use of else if insted of else, we need to take care of case where `a[i]=b[i]` no value should be incremented there. That is the reason for using else if instead of just an else.

Now your complete code should look like

```go
package main
import "fmt"

func main(){
    var a [3]int
    var b [3]int
    fmt.Scan(&a[0],&a[1],&a[2])
    fmt.Scan(&b[0],&b[1],&b[2])
    var ar,br int
    for i:=0;i<3;i++{
        //compare here
        if a[i] > b[i] {
            ar++
        }else if b[i] > a[i] {
            br++
        }
    }
    fmt.Println(ar,br)
}
```

There you go guys, you made it to the end of the blog. Please check out the video below if you still have any doubts, subscribe to my [youtube channel](https://www.youtube.com/channel/UC4syrEYE9_fzeVBajZIyHlA) for regular updates, subcribe to my mailing list below, follow me on [twitter](https://www.twitter.com/rishabhjain1403) , drop me a mail or leave a comment here if you still have any doubts and I will try my best to help you out. Thanks

Stay tuned and see you around :)
{{< youtube >}}
