### Inline Multiple Variable Declaration (like Golang)
```zig
var a: u8, const b = 2, 'c';
assert(a == 2 and b == 'c');

var a: u8, b: u8 = 2, 'c'; // b is var
assert(a == 2 and b == 'c');

var a: bool, b: [2]u8 = true, [_]u8{2, 3}; // b is var
assert(a == true and b == [2]u8{2, 3});

var a: u8, b: u8, const c, d = 1, 'a', false, 4; // b is var and d is const
assert(a == 1 and b == 'a' and c == false and d == 4);
```

### Destructuring
```zig
(var a: u8, const b) = [_]u8{2, 3};
assert(a == 2 and b == 3);

(var a: u8, b: u8) = [_]u8{2, 3}; // b is var
assert(a == 2 and b == 3);

(var a: u8, b: u8, const c, d) = [_]u8{2, 3, 4, 5}; // b is var and d is const
assert(a == 2 and b == 3 and c == 4 and d = 5);

var a: u8, (b: u8, const c, d) = 2, [_]u8{3, 4, 5}; // b is var and d is const
assert(a == 2 and b == 3 and c == 4 and d = 5);

(var a: u8, b: u8, const c), d = [_]u8{2, 3, 4}, 5; // b is var and d is const
assert(a == 2 and b == 3 and c == 4 and d = 5);
```

### with rest ..
```zig
var a, const b, .. = .{2, 3, 4, 5};

var (a, b, ..) = .{2, 3, 4, 5}; // or
var a, b, .. = .{2, 3, 4, 5};

.., var a, const b = .{2, 3, 4, 5};

assert(a == 4 and b == 5);

var (.., a, b) = .{2, 3, 4, 5}; // or
var .., a, b = .{2, 3, 4, 5};

assert(a == 4 and b == 5);
```
