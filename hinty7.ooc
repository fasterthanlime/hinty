
// lesson 7 (this a long one - brace yourself)

// So, compound covers are by-value. What does it imply?

// It implies, for example, that any member method cannot modify the content
// of the original, but only of the copy.

// For example:

FlawedFloat3: cover {
    x, y, z: Float
    
    init: func (=x, =y, =z) {}
}

ff3 := FlawedFloat3 new(1.23, 2.64, 3.14)
printf("(%.2f, %.2f, %.2f)\n", ff3 x, ff3 y, ff3 z)

// if you do that, you will get random values for ff3 x, ff3 y, ff3 z.
// why? because covers are allocated on the stack, and they aren't
// zero-ed out. Thus, they are initially filled with random data
// (which is why you should always initialize them)

// How do we fix that? First we have to understand how member methods
// work.

// When we call FlawedFloat3 above, here's what it really does:

// here's what FlawedFloat3 init() becomes in the C:
FF3_init: func (this: FlawedFloat3, x, y, z: Float) {
    this x = x
    this y = y
    this z = z
}

otherFf3: FlawedFloat3 // allocate on the stack = filled with garbage
FF3_init(otherFf3, 1.23, 2.64, 3.14) // call init - modifies a copy of otherFf3
printf("(%.2f, %.2f, %.2f)\n", otherFf3 x, otherFf3 y, otherFf3 z) // print the original

// so is there an easy workaround to use constructors in covers?
// of course yes, ooc rocks after all:
// (note: we'll make it a Float2 to avoid clashing with variable names)

Float2: cover {
    x, y: Float
    
    init: func@ (=x, =y) {}
}

ff2 := Float2 new(3.14, 6.22)
printf("(%.2f, %.2f)\n", ff2 x, ff2 y)

// why does it work? Because the init function generated looks something like
// this:
FF2_init: func (this: Float2@, x, y: Float) // etc.

// so we modify the real stuff, not a copy.

// note that it's not a trick only for the init function, it works
// so, when would we want functions that are not func@ on covers?

// well, when we *want* to work on a copy. For example

Float1: cover {
    x: Float
    
    init: func@ (=x) {}
    copy: func -> This { this }
}

f1 := Float1 new(3.14)
f2 := f1 copy()
printf("Value of f1 = %.2f, f2 = %.2f, address of f1 = %p, of f2 = %p\n", f1 x, f2 x, f1&, f2&)

// here, f2 is really a copy of f1: same content, different address.


