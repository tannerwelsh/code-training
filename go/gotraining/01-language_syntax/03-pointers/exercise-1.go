// **Part A** Declare and initalize a variable of type int with the value of 20. Display the _address of_ and _value of_ the variable.

// **Part B** Declare and initialize a pointer variable of type int that points to the last variable you just created. Display the _address of_ , _value of and the _value that the pointer points to_.

package main

import (
	"fmt"
)

func main() {
	number := 20

	fmt.Printl("%d [%h]", number, &number)

	addr := &number

	fmt.Printf("[%d] [%d] [%d]", &addr, addr, *addr)
}
