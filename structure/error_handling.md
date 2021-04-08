```zig
const y: error{E}!u8 = 5;

const x = y catch |err| return err;
// it's equivalent to
const x = try y;
```
