https://github.com/ziglang/zig/issues/4335

```zig
const Person = struct (
  name: []const u8,
  age: u8,
  2: u8, // or @2: u8
  u8,
  .height: f16,
  .weight: f16
) {};

pub fn main() void {
  const Cumpade = Person { "Cumpade", 51, 9, 7, .height = 1.71, .weight = 97.8 };
  print("{}", .{Cumpade[2]}); // 9
  // or
  print("{}", .{Cumpade@2}); // 9

  print("{}", .{Cumpade[3]}); // 7
  // or
  print("{}", .{Cumpade@3}); // 7
}
```
___

```zig
const Person = struct (
  dget .name: []const u8,
  dset .age: u8,
  dgset .height: f16
) {}

var roliudo = Person {
  .name = "Roliudo",
  .age = 7,
  .height = 1.30
}

roliudo.name; // error
roliudo.name = "Rolisvan"; // ok

roliudo.age; // ok
roliudo.age = 28; // error

roliudo.height; // error
roliudo.height = 2.40; // error
```
