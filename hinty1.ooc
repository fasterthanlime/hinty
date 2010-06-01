
// ohai! and welcome to the wonderful world of pointers.

// lesson 1: addresses

// Int is a primitive type, so it's passed by-value (e.g. a copy is made of it)
takeInt: func (i: Int) {
    printf("[takeInt] The int's value is %d, its address is %p\n", i, i&)
}


j := 42
printf("[main]    The int's value is %d, its address is %p\n", j, j&)
takeInt(j)

// what have we learned ?
// - you can get the address of something with something&
// - you can print hexadecimal addresses with "%p" in printf
// - primitive types are passed by-value, so their addresses
// will differ.
