```zig
var (a, b) = 2, 'c'; // or
var a, b = 2, 'c';

var (a, b) = .{2, 3}; // or
var a, b = .{2, 3};
```

### var and const on a same assignment
```zig
var a, const b = 2, 'c';

var a, const b = .{2, 3};

//

var (a, b), const (c, d) = 2, 'c', true, "macho"; // or
var a, b, const c, d = 2, 'c', true, "macho";

var (a, b), const (c, d) = .{2, 3, 4, 5}; // or
var a, b, const c, d = .{2, 3, 4, 5};
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
