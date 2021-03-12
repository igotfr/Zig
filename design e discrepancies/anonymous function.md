```zig
const anonymous_function: afn(T) T = afn(arg: T, ...) T { // code block };

const f: afn(u8) u8 = afn(x: u8) u8 { return x + 1; };
```
