
// lesson 6

// okay so that's for primitive types - but what are those exactly?

// here's a little classification of the ooc type fauna

// integer types like Int, Int32, UInt, Long, LLong, but also
// Char, UChar, SChar, etc. are primitive types (= passed by-value)

// compound covers (=structs) are primitive types. Let's test that
Float3: cover {
    x, y, z: Float
}

takeFloat3: func (f3: Float3) {
    f3 x = -f3 x
    f3 y = -f3 y
    f3 z = -f3 z
}

takeFloat3Ref: func (f3: Float3@) {
    f3 x = -f3 x
    f3 y = -f3 y
    f3 z = -f3 z
}

f3: Float3
f3 x = 42; f3 y = 36; f3 z = 25
printf("(%.2f, %.2f, %.2f)\n", f3 x, f3 y, f3 z)
takeFloat3(f3)
printf("(%.2f, %.2f, %.2f)\n", f3 x, f3 y, f3 z)
takeFloat3Ref(f3&)
printf("(%.2f, %.2f, %.2f)\n", f3 x, f3 y, f3 z)

"--------------------" println()

// as we see, takeFloat3 modifies a copy, but takeFloat3ef
// modifies the original


// objects are a different story. All objects in ooc are references, so
Int3: class {
    x, y, z: Int
    
    init: func (=x, =y, =z) {}
}

takeInt3: func (i3: Int3) {
    i3 x = -i3 x
    i3 y = -i3 y
    i3 z = -i3 z
}

i3 := Int3 new(1, 2, 3)
printf("(%d, %d, %d)\n", i3 x, i3 y, i3 z)
takeInt3(i3)
printf("(%d, %d, %d)\n", i3 x, i3 y, i3 z)

// indeed modifies our i3.






