// Declare a struct type and create a value of this type. Declare a function that can change the value of some field in this struct type. Display the value before and after the call to your function.

package main

import "fmt"

type fruit struct {
	name  string
	color string
}

func mutate(aFruit *fruit) {
	aFruit.name = "mutated!"
}

func main() {
	apple := fruit{
		name:  "apple",
		color: "red",
	}

	fmt.Println("Before:", apple)

	mutate(&apple)

	fmt.Println("After:", apple)
}
