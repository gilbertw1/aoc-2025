const std = @import("std");

/// Loads the input file for a given day and returns its contents as a string.
/// The caller is responsible for freeing the returned string using allocator.free().
pub fn loadInput(allocator: std.mem.Allocator, day: u8) ![]u8 {
    var buf: [256]u8 = undefined;
    const filename = try std.fmt.bufPrint(&buf, "data/day{d:0>2}.txt", .{day});
    
    const file = try std.fs.cwd().openFile(filename, .{});
    defer file.close();
    
    const file_size = try file.getEndPos();
    const buffer = try allocator.alloc(u8, file_size);
    errdefer allocator.free(buffer);
    
    const bytes_read = try file.readAll(buffer);
    if (bytes_read != file_size) {
        return error.UnexpectedEndOfFile;
    }
    
    return buffer;
}

/// Reads input from a custom file path and returns its contents as a string.
/// The caller is responsible for freeing the returned string using allocator.free().
pub fn loadInputFromPath(allocator: std.mem.Allocator, path: []const u8) ![]u8 {
    const file = try std.fs.cwd().openFile(path, .{});
    defer file.close();
    
    const file_size = try file.getEndPos();
    const buffer = try allocator.alloc(u8, file_size);
    errdefer allocator.free(buffer);
    
    const bytes_read = try file.readAll(buffer);
    if (bytes_read != file_size) {
        return error.UnexpectedEndOfFile;
    }
    
    return buffer;
}
