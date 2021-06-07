const std = @import("std");
const print = std.debug.print;
const ArrayList = std.ArrayList;
const allocator = std.testing.allocator;

pub fn rotate1(text: []const u8, shift: u8) error{OutOfMemory}![]u8 {
  var shifted_text: ArrayList(u8) = ArrayList(u8).init(allocator);
  errdefer shifted_text.deinit();

  for (text) |char| {
    try shifted_text.append(switch (char) {
      'a'...'z' => 'a' + (char - 'a' + shift) % 26,
      'A'...'Z' => 'A' + (char - 'A' + shift) % 26,
      else => char
    });
  }

  return shifted_text.toOwnedSlice();
}

pub fn rotate(text: []const u8, shift: u8) ![]const u8 {
  var shifted_text: []const u8 = "";

  for (text) |char| {
    shifted_text = try mem.concat(allocator, u8, &[_][]const u8{shifted_text, &[1]u8{switch (char) {
      'a'...'z' => 'a' + (char - 'a' + shift) % 26,
      'A'...'Z' => 'A' + (char - 'A' + shift) % 26,
      else => char
    }}});
  }

  return shifted_text;
}

const mem = std.mem;
const assert = std.debug.assert;

test "rotate a by 1" {
  assert(mem.eql(u8, try rotate("a", 1), "b"));
}

//pub fn main() !void {
  //print("{s}\n", .{rotate("OMG", 5)});
  //var n: []const u8 = "a";
  //n = try mem.concat(allocator, u8, .{n, &[1]u8{'b'}});
  //print("{s}\n", .{n});
//}