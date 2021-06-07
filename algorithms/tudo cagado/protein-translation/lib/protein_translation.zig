const std = @import("std");
const mem = std.mem;
const ArrayList = std.ArrayList;
const allocator = std.testing.allocator;

//"UGU", "UGC" => "Cysteine",
//"UUA", "UUG" => "Leucine",
//"AUG" => "Methionine",
//"UUU", "UUC" => "Phenylalanine",
//"UCU", "UCC", "UCA", "UCG" => "Serine",
//"UGG" => "Tryptophan",
//"UAU", "UAC" => "Tyrosine",
//"UAA", "UAG", "UGA" => "STOP",
//else => "invalid codon",
const codons_aminoacids = .{
  .UGU = "Cysteine",
  .UGC = "Cysteine",
  .UUA = "Leucine",
  .UUG = "Leucine",
  .AUG = "Methionine",
  .UUU = "Phenylalanine",
  .UUC = "Phenylalanine",
  .UCU = "Serine",
  .UCC = "Serine",
  .UCA = "Serine",
  .UCG = "Serine",
  .UGG = "Tryptophan",
  .UAU = "Tyrosine",
  .UAC = "Tyrosine",
  .UAA = "STOP",
  .UAG = "STOP",
  .UGA = "STOP"
};

pub fn of_codon_comptime(comptime codon: []const u8) error{InvalidCodon}![]const u8 {
  return if ( @hasField(@TypeOf(codons_aminoacids), codon) ) @field(codons_aminoacids, codon)
  else error.InvalidCodon;
}

pub fn of_codon(codon: []const u8) error{InvalidCodon}![]const u8 {
  inline for (std.meta.fields(@TypeOf(codons_aminoacids))) |field| {
    if (std.mem.eql(u8, field.name, codon))
      return @field(codons_aminoacids, field.name);
  }

  return error.InvalidCodon;
}

pub fn of_rna(comptime rna: []const u8) error{InvalidRNA, OutOfMemory}![][]const u8 {
  var aminoacids: ArrayList([]const u8) = ArrayList([]const u8).init(allocator);
  //errdefer aminoacids.deinit();

  var ignore_codon_after_STOP: bool = false;

  for ([_]u2{0} ** (rna.len / 3)) |_, i| {
    var aminoacid = of_codon(rna[i * 3..3 * i + 3]) catch return error.InvalidRNA;

    if (!mem.eql(u8, aminoacid, "STOP") and !invalid_codon_after_STOP) try aminoacids.append(aminoacid)
    else ignore_codon_after_STOP = true;
  }

  return aminoacids.toOwnedSlice();
}

pub fn of_rna_that_doesnt_check_after_STOP(comptime rna: []const u8) error{InvalidRNA, OutOfMemory}![][]const u8 {
  var aminoacids = ArrayList([]const u8).init(allocator);
  errdefer aminoacids.deinit();

  for ([_]u2{0} ** (rna.len / 3)) |_, i| {
    var aminoacid = of_codon(rna[i * 3..3 * i + 3]) catch return error.InvalidRNA;

    if (!mem.eql(u8, aminoacid, "STOP")) try aminoacids.append(aminoacid)
    else return aminoacids.toOwnedSlice();
  }

  return aminoacids.toOwnedSlice();
}

fn of_rna_test_with_array(rna: []const u8) error{InvalidRNA}![6][]const u8 {
  var aminoacids = [_][]const u8{""} ** 6;

  for ([_]u2{0} ** 6) |_, i| {
    var aminoacid = of_codon(rna[i * 3..3 * i + 3]) catch return error.InvalidRNA;

    if (!mem.eql(u8, aminoacid, "STOP")) aminoacids[i] = aminoacid
    else return aminoacids;
  }

  return aminoacids;
}