---
title: "Hackerrank | Solution of Birthday Cake Candles in Golang"
description: "In this post we will solve question Birthday Cake Candles from hackerrank. This is one of those questions, which packs a fancy description but in the end needs a simple logic to solve. Let's dive right into it."
author: "Rishabh Jain"
keywords: ["rishabh","jain","rishabh jain","hackerrank","solution","go","golang","birthday","cake","candles","birthday cake candles","rishabh1403","blog","competitive","coding","programming","tech","technology"]
tags: ["hackerrank","coding","golang"]
categories: ["hackerrank","coding","golang"]
date: 2018-09-03T19:35:03+05:30
draft: false
---
In this post we will solve question Birthday Cake Candles from hackerrank. This is one of those questions, which packs a fancy description but in the end needs a simple logic to solve. Let's dive right into it.
<!--more-->
# Problem Statement
The question can be found at this [link](https://www.hackerrank.com/challenges/birthday-cake-candles/problem). The problem statement states something about birthday and candles. In simple terms it wants us to calculate the number of times the maxiumum element in a given list of numbers occurred. We will need an array, then we will find which is the maximum element in the array, and then we will traverse the array and count the number of times the maximum element is present in the array.

Couple of things to note here is 

* We will use Golang slices here, we could have gone with arrays too, but let's introduce slices more formally.
* The number of elements in array is huge, so we need to be careful of how many loops we use.

# Challenges

* Choose our preferred language as [golang](https://golang.org/) on hackerrank. The moment we do that, we get some 50-60 lines of code which are very unfamiliar to someone who is new to language.
* Working with slices in Golang.

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

    // Complete the birthdayCakeCandles function below.
    func birthdayCakeCandles(ar []int32) int32 {


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

        for i := 0; i < int(arCount); i++ {
            arItemTemp, err := strconv.ParseInt(arTemp[i], 10, 64)
            checkError(err)
            arItem := int32(arItemTemp)
            ar = append(ar, arItem)
        }

        result := birthdayCakeCandles(ar)

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

Now let's think about how many variables we need to declare. We need to take length of the array as input, we need a variable to store the maximum element in array, we need one for keeping the count of maximum element, we also need a ***temporary*** variable to take input for slices. The way slices work is when you initially declare an empty slice, it has no element, and length is zero. So, if we try to take input like `fmt.Scan(&a[index])` it will throw an error, since that would be out of bounds of slice length. The length of a slice is variable in Golang, so we can append and remove values to and from it, but we cannot reference an index which doesn't exist yet. When we did `make([]int, 5)`, we were creating a slice of length 5, specifically allocating memory for all five indexes. It was initialized with zero, and thus we were able to refer with `a[index]`. In the current scenario, we will create a slice without using make, and take input in temporary variable. Then, we will keep on appending that value to our slice. Let's take our variables as input, create a slice and take input for slice.

```go

    package main
    import "fmt"

    func main(){
        var n,t,max,occ int
        fmt.Scan(&n)

        a := []int{}
        for i:=0;i<n;i++{
            fmt.Scan(&t)
            a = append(a,t)
            // Calculate max		           
        }
    }

```  

So in the snippet above, we are declaring variables as we planned, taking length of slice as input, and creating a slice. This `a:=[]int{}` is another way to create an empty slice. Next we are looping over `n` times, taking a input for our slice and appending it to the slice. Basically adding the taken input to the slice. Now we need to write the logic for calculation of maximum in the slice. So, when we declared our `max` variable it was assigned a value i.e. zero, because that is how Golang works. When ever you declare a variable, a default ***zero value (not zero)*** gets assigned to it. This is very important, the question states that the array in input will have a lower bound of one. That is the reason we will get our max for sure, max i.e. zero will always be smaller than all of the array elements. Now inside the loop, when we are getting an input, we need to compare that input with our max, if the provided input is greater than max, assign that input's value to max. By the time we reach to the end of loop, we will have the maximum element in array/ slice. Let's remove the `// calculate max` comment and replace it with our logic.

```go

	...
	if t > max {
		max = t
	}
	...
```
Now we have our maximum element in array and we have the array. How do we count the number of times `max` occurred in the array? We loop over the array and increase the count if the number is same as max. Again the counter is auto assigned a value zero, when we declared it. This time we can either use length of slice to loop over the slice and reference an element based on index or we can use something called `range`. Let's learn something new. `Range` is used to range over a slice and it gives us the index and the value at that index for every iteration in the loop. Now if you remember in Golang we cannot have an used variable in our code, and we don't need index here, we just need to use the value at that index to compare it with our max. How do we instruct the compiler to ignore the variable which stores index from range, and not throw an error? We will assign the value to an special variable `underscore(_)`. Compiler ignores anything assigned to an underscore. Let's see how does the code like for counting the occurence. Use the following snippet below the for-loop we already wrote.

```go
        ...
        for _,num := range a{
            if num == max{
                occ++
            }
        }

        fmt.Println(occ)

```

We have already discussed the explanation of above code snippet, and the only thing we are adding extra over here is a print statement to print our count. Now you complete code should look something like

```go

    package main
    import "fmt"

    func main(){
        var n,t,max,occ int
        fmt.Scan(&n)

        a := []int{}
        for i:=0;i<n;i++{
            fmt.Scan(&t)
            a = append(a,t)
            if t > max {
                max = t
            }
        }

        for _,num := range a{
            if num == max{
                occ++
            }
        }

        fmt.Println(occ)

    }

```

Let's review what are the highlights to take away from this question. We can use slices instead of an array, which gives us a greater flexibility on some operations like adding and removing elements to and from an slice. We discussed how to add a value to slice, and we also learned how to loop over a slice using `range`. We also covered how to ignore a variable in Golang, so that it doesn't throw an error on compilation if the variable is not used. Range gives us two vaalues i.e. the index and the value of the index, represented here using `_, num`. This is it for this one, complete source code for this post can be found on my [Github Repo](https://github.com/rishabh1403/hackerrank-golang-solutions/blob/master/practice/algorithms/warmup/birthday-cake-candles.go). Will see you in the next one.

There you go guys, you made it to end of the post. Please check out the video below if you still have any doubts. Subscribe to my [youtube channel](https://www.youtube.com/channel/UC4syrEYE9_fzeVBajZIyHlA) and my mailing list below for regular updates. Follow me on [twitter](https://www.twitter.com/rishabhjain1403) , drop me a mail or leave a comment here if you still have any doubts and I will try my best to help you out. Thanks

Stay tuned and see you around :)
{{< youtube 3iT1akTZzqU >}} 
