const std = @import("std");
const utils = @import("utils.zig");
const day01 = @import("solutions/day01.zig");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    const stdout = std.io.getStdOut().writer();

    // Get command line arguments
    const args = try std.process.argsAlloc(allocator);
    defer std.process.argsFree(allocator, args);

    if (args.len < 2) {
        try stdout.print("Usage: {s} <day>\n", .{args[0]});
        try stdout.print("Example: {s} 1\n", .{args[0]});
        return;
    }

    const day = try std.fmt.parseInt(u8, args[1], 10);

    try stdout.print("Running Advent of Code 2025 - Day {d}\n", .{day});
    try stdout.print("========================================\n\n", .{});

    switch (day) {
        1 => try day01.solve(allocator),
        else => {
            try stdout.print("Day {d} not implemented yet!\n", .{day});
        },
    }
}
