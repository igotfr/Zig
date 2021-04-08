```zig
const y: ?u8 = null;

const x: u8 = y orelse unreachable;
// it's equivalent to
const x: u8 = y.?;
```
