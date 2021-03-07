### Array
```zig
  var array: [5]u8 = [_]u8{1, 2, 3, 4, 5};  // [N:sentinel]T
  var slice: []u8 = array[1..4];            // []T
  var slice_pointer: *[3]u8 = array[1..4];  // *[N]T

  print("{any}\n", .{slice});
  print("{any}\n", .{slice_pointer.*});
```

### const Array
```zig
  const array: [5]u8 = [_]u8{1, 2, 3, 4, 5};      // [N:sentinel]T
  var slice: []const u8 = array[1..4];            // []const T
  var slice_pointer: *const [3]u8 = array[1..4];  // *const [N]T

  print("{any}\n", .{slice});
  print("{any}\n", .{slice_pointer.*});
```

### String
```zig
  var string: *const [4]u8 = "abcd";               // *const [N:sentinel]T
  var slice: []const u8 = string[1..4];            // [] const T
  var slice_pointer: *const [3]u8 = string[1..4];  // *const [N:sentinel]T

  print("{s}\n", .{slice});
  print("{s}\n", .{slice_pointer.*});
```

### String literals
```zig
  var string: []const u8 = "abcd";                 // []const T
  var slice: []const u8 = string[1..4];            // []const T
  var slice_pointer: *const [3]u8 = string[1..4];  // *const [N]T

  print("{s}\n", .{slice});
  print("{s}\n", .{slice_pointer.*});
```
