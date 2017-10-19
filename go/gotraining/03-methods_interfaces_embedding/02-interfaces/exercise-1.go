// Declare an interface named Speaker with a method named SayHello. Declare a struct named English that represents a person who speaks english and declare a struct named Chinese for someone who speaks chinese. Implement the Speaker interface for each struct using a pointer receiver and these literal strings "Hello World" and "你好世界". Declare a variable of type Speaker and assign the _address of_ a value of type English and call the method. Do it again for a value of type Chinese.

package main

import "fmt"

type Speaker interface {
	SayHello()
}

type English struct{}

type Chinese struct{}

func (e *English) SayHello() {
	fmt.Println("Hello World")
}

func (c *Chinese) SayHello() {
	fmt.Println("你好世界")
}

func DoTheSaying(speaker Speaker) {
	speaker.SayHello()
}

func main() {
	bob := English{}
	sally := Chinese{}

	// bob.SayHello()
	// sally.SayHello()
	DoTheSaying(&bob)
	DoTheSaying(&sally)
}
