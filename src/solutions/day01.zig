const std = @import("std");
const utils = @import("../utils.zig");

pub fn solve(allocator: std.mem.Allocator) !void {
    const stdout = std.io.getStdOut().writer();
    
    // Load input file for day 1
    const input = utils.loadInput(allocator, 1) catch |err| {
        try stdout.print("Error loading input: {}\n", .{err});
        try stdout.print("Make sure data/day01.txt exists!\n", .{});
        return;
    };
    defer allocator.free(input);

    // Part 1
    const part1_result = try solvePart1(allocator, input);
    try stdout.print("Part 1: {d}\n", .{part1_result});

    // Part 2
    const part2_result = try solvePart2(allocator, input);
    try stdout.print("Part 2: {d}\n", .{part2_result});
}

fn solvePart1(allocator: std.mem.Allocator, input: []const u8) !i64 {
    // TODO: Implement part 1 solution
    // Remove these unused parameter suppressions when implementing:
    _ = allocator;
    _ = input;
    
    return 0;
}

fn solvePart2(allocator: std.mem.Allocator, input: []const u8) !i64 {
    // TODO: Implement part 2 solution
    // Remove these unused parameter suppressions when implementing:
    _ = allocator;
    _ = input;
    
    return 0;
}

test "day01 part1" {
    const allocator = std.testing.allocator;
    const input = "sample input";
    const result = try solvePart1(allocator, input);
    try std.testing.expectEqual(@as(i64, 0), result);
}

test "day01 part2" {
    const allocator = std.testing.allocator;
    const input = "sample input";
    const result = try solvePart2(allocator, input);
    try std.testing.expectEqual(@as(i64, 0), result);
}
