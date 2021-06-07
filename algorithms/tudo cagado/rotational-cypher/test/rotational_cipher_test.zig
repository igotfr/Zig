const std = @import("std");
const assert = std.debug.assert;
const expect = std.testing.expect;
const mem = std.mem;

const rotational_cipher = @import("rotational_cipher");

test "rotate a by 1" {
  assert(mem.eql(u8, try rotational_cipher.rotate("a", 1), "b"));
}

test "rotate a by 26, same output as input" {
  assert(mem.eql(u8, try rotational_cipher.rotate("a", 26), "a"));
}

test "rotate a by 0, same output as input" {
  assert(mem.eql(u8, try rotational_cipher.rotate("a", 0), "a"));
}

test "rotate m by 13" {
  assert(mem.eql(u8, try rotational_cipher.rotate("m", 13), "z"));
}

test "rotate n by 13 with wrap around alphabet" {
  assert(mem.eql(u8, try rotational_cipher.rotate("n", 13), "a"));
}

test "rotate capital letters" {
  assert(mem.eql(u8, try rotational_cipher.rotate("OMG", 5), "TRL"));
}

test "rotate spaces" {
  assert(mem.eql(u8, try rotational_cipher.rotate("O M G", 5), "T R L"));
}

test "rotate numbers" {
  assert(mem.eql(u8, try rotational_cipher.rotate("Testing 1 2 3 testing", 4), "Xiwxmrk 1 2 3 xiwxmrk"));
}

test "rotate punctuation" {
  assert(mem.eql(u8, try rotational_cipher.rotate("Let's eat, Grandma!", 21), "Gzo'n zvo, Bmviyhv!"));
}

test "rotate all letters" {
  assert(mem.eql(u8, try rotational_cipher.rotate("The quick brown fox jumps over the lazy dog.", 13), "Gur dhvpx oebja sbk whzcf bire gur ynml qbt."));
}