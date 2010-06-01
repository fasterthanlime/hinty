
// lesson 2:

fightInt: func (i: Int) {
    printf("[fightInt] 1) The int's value is %d, its address is %p\n", i, i&)
    // bring him down! (ie. try to modify it)
    i = 0
    printf("[fightInt] 2) The int's value is %d, its address is %p\n", i, i&)
}


j := 42
printf("[main]     1) The int's value is %d, its address is %p\n", j, j&)
fightInt(j)
printf("[main]     2) The int's value is %d, its address is %p\n", j, j&)

// what have we learned ?
// - modifying the value of an int doesn't change its address (d'oh!)
// - modifying a copy of an int doesn't modify the original (duh.)
// - but how do we modify a variable of a primitive type via a function then?

