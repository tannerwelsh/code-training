# Go Workshop Notes

## Pointers

**Sharing**: this is the word. Think in terms of sharing.

Everything in Go is pass by value.

- Value of
- Pointer of
- Address pointer points to

When passing a variable to a function, it passes the value (new stack gets a copy of that value).

To get the address of a value: `&` operator.
To get the value stored at an address (i.e. a pointer), use the `*` operator

No pointer arithmetic in go.

_Go is situational_.

It is only through variables that we get to read and write to memory.

The struct type gives you a set of bytes as a value (i.e. all bytes for all properties of the struct). Can read and write both the entire struct and the parts within.

Don't think in terms of referencing and dereferencing.

**Heuristic**: if I need to share a value between functions (scopes), then I must pass the address of the value and accept it with a pointer.

## Functions

Can return multiple values. Can return pointers.

Blank identifier `_` is a way to say "I don't care what is coming back from this function call".

Variables declared inside an if statement (including in the conditional) are only available within the body of the if statement. It creates its own scope.

```go
if time, err := getTime(); err != nil {
  fmt.Println(err)
}

time // not available - out of scope
```

**Variadic functions**: Can declare functions with any number of parameters.

```go
func display(users ...user) {
  for i := 0; i < len(users); i++ {
    fmt.Println(users[i])
  }
}
```

## Arrays

Better to keep data contiguous (for performance reasons).

Arrays allow us to create contiguous blocks of memory. They cannot shrink or grow.

```go
// declare a variable that is of _type_ `[5]string`
var strings [5]string
```

The number is part of the type information. The variable `strings` above is of type `[5]string`, meaning an array of 5 strings.

Use `for ... range` to iterate through values:

```go
for index, fruit := range strings {
  // fruit is a _copy_ of the value at `strings[index]`
  fmt.Println(index, fruit)
}
```

Using `range` is actually _faster_ and better than using a traditional `for` loop. **If you follow idiomatic Go, you get performance for free.**

## Slices

Slices are two things:

1. A dynamic array
2. Way to create multiple _views_ of an array

Having slices of pointers is a flag.

Slice is a reference type made of 3 machine words: [POINTER, LENGTH, CAPACITY]

Use the `make` function to create new slices

```go
// create a slice of strings
slice := make([]string, 5)
// this creates a slice header with [POINTER  addr, LENGTH 5, CAP 5]
```

LENGTH: size of data structure available now. Retrieve with `len(<slice>)`
CAPACITY: potential for growth. Retrieve with `cap(<slice>)`

**Heuristic**: if a collection type definition has a number in the `[]` during declaration, its an array. If not, its a slice.

Can take slices of other slices, or of arrays. This is like creating a view of the collection that is less than or equal to the original collection. Use the syntax `mySlice[<start_index>:<end_index>]`. Note it is inclusive.

## Methods

A method is a function that is bound to a type, the allow us to attach behavior to the type.

**The type is the first argument to the function**. This is what defines a method.

Functions are first-class citizens, so we can pass them around.

## Interfaces

A way of declaring behavior (just behavior). No state associated with an interface.

Contains two pieces of information: [TYPE, POINTER]. Type is the type of the value stored at pointer.

Interface values store concrete types, but only those types that implement that interface.

To implement an interface, a type needs to define all of the methods declared by the interface.

**Heuristic**: if you use a pointer receiver, then only pointers will satisfy the interface. If you use a value receiver, then both values and pointers will satisfy the interface.

## Embedding

- Embedding types means we can share behavior between types
- Inner type never loses its identity
- This is not inheritance

To embed a type, declare a type with another type inside.

## Goroutines

OS has a schedule; runtime has a scheduler. Runtime scheduler's job is to take the goroutines and schedule them.

Each goroutine runs as if it were on the same thread, though that is not necessarily the case.

## Channels

Send and receive data on channels.

Unbuffered channels allow us to achieve a guarantee that something has been transferred.

Architect systems around unbuffered channels because they **ensure delivery**.

Don't use buffered channels to manage work; work with the guarantee of the handoff.

Buffered channels are good for _pooling_, however.

If using a buffered channel, be prepared for data loss because there is no guarantee of transmission.

## Misc

The Go spec is frozen (incl. standard library). Implementation underneath may change. So be careful when coding against implementation.

The compiler error messages will help you learn about the language itself.

Case determines whether an identifier is **exported**: if starts with lowercase, not exported; uppercase identifiers are exported.

Go is a **package-oriented** language, and packages share state by exporting identifiers.

Best to avoid `else` clauses whenever possible: they make code harder to reason about (and thus, more difficult for predictive analysis)

Strings (and arrays, slices, function variables, many more) are **reference types** - meaning that they are stored in memory as a two-word structure: the length of the string and a pointer to the UTF-8 bytes.
