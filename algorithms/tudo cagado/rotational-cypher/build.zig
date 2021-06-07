const std = @import("std");

pub fn build(b: *std.build.Builder) void {
    // Standard target options allows the person running `zig build` to choose
    // what target to build for. Here we do not override the defaults, which
    // means any target is allowed, and the default is native. Other options
    // for restricting supported target set are available.
    const target = b.standardTargetOptions(.{});

    // Standard release options allow the person running `zig build` to select
    // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall.
    const mode = b.standardReleaseOptions();

    const exe = b.addExecutable("rotational-cipher", "src/main.zig");
    exe.setTarget(target);
    exe.setBuildMode(mode);
    //exe.addPackagePath("protein_translation", "lib/protein_translation.zig");
    //exe.addPackage(.{ .name = "protein_translation", .path = "lib/protein_translation.zig",});
    exe.install();

    //const lib = b.addStaticLibrary("protein-translation", "src/main.zig");
    //lib.setBuildMode(mode);
    //lib.install();

    const test_exe = b.addTest("test/rotational_cipher_test.zig");
    test_exe.addPackagePath("rotational_cipher", "lib/rotational_cipher.zig");

    const test_step = b.step("test", "Run all the tests");
    test_step.dependOn(&test_exe.step);

    const run_cmd = exe.run();
    run_cmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);
}
