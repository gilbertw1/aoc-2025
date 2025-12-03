# Contributing Guide

## Adding a New Day Solution

Follow these steps to add a solution for a new day:

### 1. Create the solution file

Copy the template from `src/solutions/day01.zig` to create a new day:

```bash
cp src/solutions/day01.zig src/solutions/day02.zig
```

Update the day number in the `loadInput` call:
```zig
const input = utils.loadInput(allocator, 2) catch |err| {
    // ... error handling
};
```

### 2. Add your input file

Save your personal input from Advent of Code to `data/day02.txt`.

### 3. Register the day in main.zig

In `src/main.zig`, add the import at the top:

```zig
const day02 = @import("solutions/day02.zig");
```

Add a case to the switch statement:

```zig
switch (day) {
    1 => try day01.solve(allocator),
    2 => try day02.solve(allocator),  // Add this line
    else => {
        try stdout.print("Day {d} not implemented yet!\n", .{day});
    },
}
```

### 4. Implement your solution

Fill in the `solvePart1` and `solvePart2` functions with your logic:

```zig
fn solvePart1(allocator: std.mem.Allocator, input: []const u8) !i64 {
    // Your solution here
    var result: i64 = 0;
    
    var lines = std.mem.split(u8, input, "\n");
    while (lines.next()) |line| {
        // Process each line
    }
    
    return result;
}
```

### 5. Add tests

Update the test cases with sample data from the problem:

```zig
test "day02 part1" {
    const allocator = std.testing.allocator;
    const input = 
        \\sample line 1
        \\sample line 2
    ;
    const result = try solvePart1(allocator, input);
    try std.testing.expectEqual(@as(i64, expected_value), result);
}
```

### 6. Test your solution

```bash
zig build test
zig build run -- 2
```

## Code Style

- Use 4 spaces for indentation
- Follow the existing error handling patterns
- Free allocated memory appropriately
- Include tests for sample inputs when provided in the problem
- Keep solutions self-contained within their day file

## Tips

- Use `std.mem.split` for parsing line-based input
- Use `std.fmt.parseInt` for parsing numbers
- Use `std.ArrayList` for dynamic arrays
- Remember to `defer` cleanup of allocated resources
- Test with sample inputs first before running on actual input
