const std = @import("std");
const print = std.debug.print;
const print2 = std.io.getStdOut().writer().print;

const pro = @import("pro");

pub fn main() void {
  print("{s}\n", .{pro.of_codon("UUA")});
}