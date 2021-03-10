### Array
```zig
  var array: [5]u8 = [5]u8{1, 2, 3, 4, 5};       // [N]T
  var array2: [5]u8 = [_]u8{1, 2, 3, 4, 5};      // [_]T
  var array3: [5:1]u8 = [5:1]u8{1, 2, 3, 4, 5};  // [N:sentinel]T - Sentinel-Terminated Arrays
  var array4: [5:1]u8 = [_:1]u8{1, 2, 3, 4, 5};  // [_:sentinel]T - Sentinel-Terminated Arrays

  var slice: []u8 = array[1..4];                  // []T
  var slice_sentinel: [:5]u8 = array[1..4 :5];    // [:sentinel]T - Sentinel-Terminated Slices
  var slice_sentinel2: []u8 = array[1..4 :5];     // []T - Sentinel-Terminated Slices

  var slice_pointer: *[3]u8 = array[1..4];                // *[N]T
  var slice_pointer_sentinel: *[3:5]u8 = array[1..4 :5];  // *[N:sentinel]T - Sentinel-Terminated Slices

  print("{any}\n", .{slice});
  print("{any}\n", .{slice_pointer.*});
  print("{any}\n", .{slice_pointer_sentinel.*});
```

### const Array
```zig
  const array: [5]u8 = [5]u8{1, 2, 3, 4, 5};       // [N]T
  const array2: [5]u8 = [_]u8{1, 2, 3, 4, 5};      // [_]T
  const array3: [5:1]u8 = [5:1]u8{1, 2, 3, 4, 5};  // [N:sentinel]T - Sentinel-Terminated Arrays
  const array4: [5:1]u8 = [_:1]u8{1, 2, 3, 4, 5};  // [_:sentinel]T - Sentinel-Terminated Arrays

  var slice: []const u8 = array[1..4];                // []const T
  var slice_sentinel: [:5]const u8 = array[1..4 :5];  // [:sentinel]const T - Sentinel-Terminated Slices
  var slice_sentinel2: []const u8 = array[1..4 :5];   // []const T - Sentinel-Terminated Slices

  var slice_pointer: *const [3]u8 = array[1..4];               // *[N]T
  var slice_pointer_sentinel: *const[3:5]u8 = array[1..4 :5];  // *[N:sentinel]T - Sentinel-Terminated Slices

  print("{any}\n", .{slice});
  print("{any}\n", .{slice_pointer.*});
  print("{any}\n", .{slice_pointer_sentinel.*});
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
  var string: []const u8 = "abcd";                 // [:sentinel = 0]const T

  var slice: []const u8 = string[1..4];            // []const T
  var slice_pointer: *const [3]u8 = string[1..4];  // *const [N]T

  print("{s}\n", .{slice});
  print("{s}\n", .{slice_pointer.*});
```
