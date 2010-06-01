
// lesson 5

// okay so that's how I modify the values of variables of primitive types
// that I pass around in functions.

// but doesn't it get tiring after a while, to write all those '@' ?

// Answer: yes, that's why reference types exist.

// take a reference to an int (e.g. type Int@, as opposed to Int*)
// from the caller's perspective, it takes a pointer (ie. an address)
// but when we access i, it will as if we had written i@ instead everytime
fightInt: func (i: Int@) {
    // this is exactly equivalent to the previous example, only
    // here we have written @ once and for all in the type declaration
    // so we can use 'i' as a regular Int. We can still get its
    // address with i&, btw =)
    i = 0
}


j := 42
printf("[main]     1) The int's value is %d, its address is %p\n", j, j&)
// we still pass j's address. That's an important distinction from C++,
// which allows you to pass 'j' and forget that it could be modified by
// the called function. Here we have to explicitly pass the address,
// e.g. use the '&' operator
fightInt(j&)
printf("[main]     2) The int's value is %d, its address is %p\n", j, j&)

// what have we learned ?
// - that using Type@ allows to write '@' once and for all in a function
// - that ooc, unlike, C++


