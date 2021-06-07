usingnamespace @import("std").builtin;
/// Deprecated
pub const arch = Target.current.cpu.arch;
/// Deprecated
pub const endian = Target.current.cpu.arch.endian();

/// Zig version. When writing code that supports multiple versions of Zig, prefer
/// feature detection (i.e. with `@hasDecl` or `@hasField`) over version checks.
pub const zig_version = try @import("std").SemanticVersion.parse("0.8.0-dev.1548+0d96a284e");

pub const output_mode = OutputMode.Exe;
pub const link_mode = LinkMode.Static;
pub const is_test = false;
pub const single_threaded = false;
pub const abi = Abi.gnu;
pub const cpu: Cpu = Cpu{
    .arch = .x86_64,
    .model = &Target.x86.cpu.silvermont,
    .features = Target.x86.featureSet(&[_]Target.x86.Feature{
        .@"64bit",
        .@"aes",
        .@"cmov",
        .@"cx16",
        .@"cx8",
        .@"false_deps_popcnt",
        .@"fast_7bytenop",
        .@"fxsr",
        .@"idivq_to_divl",
        .@"mmx",
        .@"movbe",
        .@"nopl",
        .@"pclmul",
        .@"popcnt",
        .@"prfchw",
        .@"rdrnd",
        .@"sahf",
        .@"slow_incdec",
        .@"slow_lea",
        .@"slow_pmulld",
        .@"slow_two_mem_ops",
        .@"sse",
        .@"sse2",
        .@"sse3",
        .@"sse4_1",
        .@"sse4_2",
        .@"ssse3",
        .@"vzeroupper",
        .@"x87",
    }),
};
pub const os = Os{
    .tag = .linux,
    .version_range = .{ .linux = .{
        .range = .{
            .min = .{
                .major = 5,
                .minor = 8,
                .patch = 18,
            },
            .max = .{
                .major = 5,
                .minor = 8,
                .patch = 18,
            },
        },
        .glibc = .{
            .major = 2,
            .minor = 17,
            .patch = 0,
        },
    }},
};
pub const object_format = ObjectFormat.elf;
pub const mode = Mode.Debug;
pub const link_libc = false;
pub const link_libcpp = false;
pub const have_error_return_tracing = true;
pub const valgrind_support = true;
pub const position_independent_code = false;
pub const position_independent_executable = false;
pub const strip_debug_info = false;
pub const code_model = CodeModel.default;
