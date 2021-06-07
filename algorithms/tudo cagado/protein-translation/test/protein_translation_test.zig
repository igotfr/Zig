const std = @import("std");
const assert = std.debug.assert;
const expect = std.testing.expect;
const mem = std.mem;
const expectError = std.testing.expectError;

const protein_translation = @import("protein_translation");

fn deepEql(lhs: anytype, rhs: anytype) bool {
  if (comptime !std.meta.trait.isIndexable(@TypeOf(lhs)))
    return lhs == rhs;

  if (lhs.len != rhs.len)
    return false;

  var i: usize = 0;
  while (i < lhs.len) : (i += 1) {
    if (!deepEql(lhs[i], rhs[i]))
      return false;
  }

  return true;
}

test "AUG translates to methionine" {
  assert(mem.eql(u8, try protein_translation.of_codon("AUG"), "Methionine"));
}

test "identifies Phenylalanine codons" {
  assert(mem.eql(u8, try protein_translation.of_codon("UUU"), "Phenylalanine"));
  assert(mem.eql(u8, try protein_translation.of_codon("UUC"), "Phenylalanine"));
}

test "identifies Leucine codons" {
  assert(mem.eql(u8, try protein_translation.of_codon("UUA"), "Leucine"));
  assert(mem.eql(u8, try protein_translation.of_codon("UUG"), "Leucine"));
}

test "identifies Serine codons" {
  assert(mem.eql(u8, try protein_translation.of_codon("UCU"), "Serine"));
  assert(mem.eql(u8, try protein_translation.of_codon("UCC"), "Serine"));
  assert(mem.eql(u8, try protein_translation.of_codon("UCA"), "Serine"));
  assert(mem.eql(u8, try protein_translation.of_codon("UCG"), "Serine"));
}

test "identifies Tyrosine codons" {
  assert(mem.eql(u8, try protein_translation.of_codon("UAU"), "Tyrosine"));
  assert(mem.eql(u8, try protein_translation.of_codon("UAC"), "Tyrosine"));
}

test "identifies Cysteine codons" {
  assert(mem.eql(u8, try protein_translation.of_codon("UGU"), "Cysteine"));
  assert(mem.eql(u8, try protein_translation.of_codon("UGC"), "Cysteine"));
}

test "identifies Tryptophan codons" {
  assert(mem.eql(u8, try protein_translation.of_codon("UGG"), "Tryptophan"));
}

test "identifies stop codons" {
  assert(mem.eql(u8, try protein_translation.of_codon("UAA"), "STOP"));
  assert(mem.eql(u8, try protein_translation.of_codon("UAG"), "STOP"));
  assert(mem.eql(u8, try protein_translation.of_codon("UGA"), "STOP"));
}

test "invalid codon" {
  expectError(error.InvalidCodon, protein_translation.of_codon("INVALID"));
}

test "translates rna strand into correct protein" {
  assert(deepEql(try protein_translation.of_rna("AUGUUUUGG"), &[_][]const u8{"Methionine", "Phenylalanine", "Tryptophan"}));
}