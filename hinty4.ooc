
// lesson 4

// ooowkay I got & and @. Now let's modify this damn int.

// still an address to the int
fightInt: func (i: Int*) {
    // bring him down!
    i@ = 0
    // we want to modify the _value_ of the thing that lives at the address we
    // got, not the address, so we use 'i@'
}


j := 42
printf("[main]     1) The int's value is %d, its address is %p\n", j, j&)
// we still pass j's address, so the function will know what to modify
fightInt(j&)
printf("[main]     2) The int's value is %d, its address is %p\n", j, j&)

// what have we learned ?
// - that something@ can be modified, ie. that we can modify the value
// of something, given its address
