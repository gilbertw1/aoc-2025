# Advent of Code 2025 - Zig Edition

Solutions for [Advent of Code 2025](https://adventofcode.com/2025) implemented in Zig.

## Project Structure

```
.
├── build.zig              # Build configuration
├── data/                  # Input files directory
│   ├── README.md         # Instructions for input files
│   └── day01.txt         # Example input file (replace with your actual input)
└── src/
    ├── main.zig          # Main entry point
    ├── utils.zig         # Utility functions (file loading, etc.)
    └── solutions/        # Individual day solutions
        └── day01.zig     # Day 1 solution template
```

## Prerequisites

- [Zig](https://ziglang.org/) (version 0.13.0 or later recommended)

## Setup

1. Clone this repository
2. Get your personal input from [Advent of Code 2025](https://adventofcode.com/2025)
3. Save it to `data/dayXX.txt` (where XX is the day number with leading zero)

## Usage

### Build the project

```bash
zig build
```

### Run a specific day's solution

```bash
zig build run -- <day>
```

Example for Day 1:
```bash
zig build run -- 1
```

### Run tests

```bash
zig build test
```

## Adding a New Day

1. Create a new file `src/solutions/dayXX.zig` using `day01.zig` as a template
2. Add your input to `data/dayXX.txt`
3. Import and register the day in `src/main.zig`:
   ```zig
   const dayXX = @import("solutions/dayXX.zig");
   
   // In the switch statement:
   XX => try dayXX.solve(allocator),
   ```

## Solution Template

Each day's solution follows this structure:

```zig
const std = @import("std");
const utils = @import("../utils.zig");

pub fn solve(allocator: std.mem.Allocator) !void {
    const input = try utils.loadInput(allocator, DAY_NUMBER);
    defer allocator.free(input);
    
    const part1 = try solvePart1(allocator, input);
    const part2 = try solvePart2(allocator, input);
    
    // Print results
}

fn solvePart1(allocator: std.mem.Allocator, input: []const u8) !i64 {
    // Implementation
}

fn solvePart2(allocator: std.mem.Allocator, input: []const u8) !i64 {
    // Implementation
}
```

## Utility Functions

The `utils.zig` module provides helper functions:

- `loadInput(allocator, day)` - Loads input for a specific day from `data/dayXX.txt`
- `loadInputFromPath(allocator, path)` - Loads input from a custom file path

Both functions return a string slice that must be freed by the caller using `allocator.free()`.

## Notes

- Input files are personal and should not be committed to public repositories per Advent of Code rules
- The `.gitignore` is configured to exclude `data/day*.txt` files (except the example `day01.txt`)
