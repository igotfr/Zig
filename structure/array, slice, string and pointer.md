### Array
```zig
const std = @import("std");
const assert = std.debug.assert;
const mem = std.mem;

test "array and slice array" {
  var array: [6]u8 = [6]u8{0, 1, 2, 3, 4, 5};   // [N]T
  var array2: [6]u8 = [_]u8{0, 1, 2, 3, 4, 5};  // [N]T

  var array_sentinel: [6:88]u8 = [6:88]u8{0, 1, 2, 3, 4, 5};   // [N:sentinel]T - Sentinel-Terminated Arrays
  var array_sentinel2: [6:88]u8 = [_:88]u8{0, 1, 2, 3, 4, 5};  // [N:sentinel]T - Sentinel-Terminated Arrays

  var slice: []u8 = array[1..4];  // []T

  var slice_sentinel: [:4]u8 = array[1..4 :4];  // [:sentinel]T - Sentinel-Terminated Slices
  var slice_sentinel2: []u8 = array[1..4 :4];   // []T - Sentinel-Terminated Slices

  var slice_pointer: *[3]u8 = array[1..4];  // *[N]T

  var slice_pointer_sentinel: *[3:4]u8 = array[1..4 :4];  // *[N:sentinel]T - Sentinel-Terminated Slices
  var slice_pointer_sentinel2: *[3]u8 = array[1..4 :4];   // *[N]T - Sentinel-Terminated Slices

  assert(mem.eql(u8, slice, &[3]u8{1, 2, 3});                      // print("{any}\n", .{slice});
  assert(mem.eql(u8, slice_pointer, &[3]u8{1, 2, 3}));             // print("{any}\n", .{slice_pointer.*});
  assert(mem.eql(u8, slice_pointer_sentinel, &[3:4]u8{1, 2, 3}));  // print("{any}\n", .{slice_pointer_sentinel.*});
}
```

### const Array
```zig
const std = @import("std");
const assert = std.debug.assert;
const mem = std.mem;

test "const array and slice const array" {
  const array: [6]u8 = [6]u8{0, 1, 2, 3, 4, 5};   // [N]T
  const array2: [6]u8 = [_]u8{0, 1, 2, 3, 4, 5};  // [N]T

  const array_sentinel: [6:88]u8 = [6:88]u8{0, 1, 2, 3, 4, 5};   // [N:sentinel]T - Sentinel-Terminated Arrays
  const array_sentinel2: [6:88]u8 = [_:88]u8{0, 1, 2, 3, 4, 5};  // [N:sentinel]T - Sentinel-Terminated Arrays

  var slice: []const u8 = array[1..4];  // []const T

  var slice_sentinel: [:4]const u8 = array[1..4 :4];  // [:sentinel]const T - Sentinel-Terminated Slices
  var slice_sentinel2: []const u8 = array[1..4 :4];   // []const T - Sentinel-Terminated Slices

  var slice_pointer: *const [3]u8 = array[1..4];  // *const [N]T

  var slice_pointer_sentinel: *const[3:4]u8 = array[1..4 :4];  // *const [N:sentinel]T - Sentinel-Terminated Slices
  var slice_pointer_sentinel2: *const[3]u8 = array[1..4 :4];   // *const [N]T - Sentinel-Terminated Slices

  assert(mem.eql(u8, slice, &[3]u8{1, 2, 3});                      // print("{any}\n", .{slice});
  assert(mem.eql(u8, slice_pointer, &[3]u8{1, 2, 3}));             // print("{any}\n", .{slice_pointer.*});
  assert(mem.eql(u8, slice_pointer_sentinel, &[3:4]u8{1, 2, 3}));  // print("{any}\n", .{slice_pointer_sentinel.*});
}
```

### String
```zig
const std = @import("std");
const assert = std.debug.assert;
const mem = std.mem;

test "string" {
  var string: *const [4]u8 = "abcd";  // *const [N]T

  var string_sentinel: *const [4:0]u8 = "abcd";  // *const [N:sentinel]T

  var slice: []const u8 = string[1..4];  // []const T

  var slice_sentinel: []const u8 = string[1..3 :100];       // []const T - Sentinel-Terminated Slices
  var slice_sentinel2: [:100]const u8 = string[1..3 :100];  // [:sentinel]const T - Sentinel-Terminated Slices

  var slice_pointer: *const [3]u8 = string[1..4];  // *const [N]T

  var slice_pointer_sentinel: *const [2:100]u8 = string[1..3 :100];  // *const [N:sentinel]T - Sentinel-Terminated Slices
  var slice_pointer_sentinel2: *const [2]u8 = string[1..3 :100];     // *const [N]T - Sentinel-Terminated Slices

  assert(mem.eql(u8, slice, "bcd"));          // print("{s}\n", .{slice});
  assert(mem.eql(u8, slice_pointer, "bcd"));  // print("{s}\n", .{slice_pointer.*});
}
```

### String literals
```zig
const std = @import("std");
const assert = std.debug.assert;
const mem = std.mem;

test "string literals" {
  var string: []const u8 = "abcd";  // []const T

  var string_sentinel: [:0]const u8 = "abcd";  // [:sentinel]const T

  var slice: []const u8 = string[1..4];  // []const T
  
  var slice_sentinel: []const u8 = string[1..3 :100];       // []const T - Sentinel-Terminated Slices
  var slice_sentinel2: [:100]const u8 = string[1..3 :100];  // [:sentinel]const T - Sentinel-Terminated Slices

  var slice_pointer: *const [3]u8 = string[1..4];  // *const [N]T

  var slice_pointer_sentinel: *const [2:100]u8 = string[1..3 :100];  // *const [N:sentinel]T - Sentinel-Terminated Slices
  var slice_pointer_sentinel2: *const [2]u8 = string[1..3 :100];     // *const [N]T - Sentinel-Terminated Slices

  assert(mem.eql(u8, slice, "bcd"));          // print("{s}\n", .{slice});
  assert(mem.eql(u8, slice_pointer, "bcd"));  // print("{s}\n", .{slice_pointer.*});
}
```
