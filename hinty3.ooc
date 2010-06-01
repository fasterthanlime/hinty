
// lesson 3

// so how do we modify an int? well, we can pass its address instead

// Int* = a pointer to an Int
fightInt: func (i: Int*) {
    // i@ dereferences i, ie. gives the value of the Int that lives at this address
    // i is just the address we got
    // remember, before i was an Int and we had  i  = value, i& = address
    //          and now i is an Int* and we have i@ = value, i  = address
    printf("[fightInt] 1) The int's value is %d, its address is %p\n", i@, i)
}


j := 42
// j itself is still an Int, so we have j = value, j& = address
printf("[main]     1) The int's value is %d, its address is %p\n", j, j&)
// we don't pass j itself, but we pass its address
fightInt(j&)

// what have we learned ?
// - how to pass the address of something
// - how to retrieve the value of something, given its address
// - that '@' is the contrary of '&'. As in, '@' gives the value of something
// from its address, and '&' gives the address of something.
