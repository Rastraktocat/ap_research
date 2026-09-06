const std = @import("std");

const Node = struct {
	value,
	next: ?*@This(),

};

pub fn linked_list(T: type) type {

	return struct {
		value: T,
		next: ?*Node,

		fn get_next() Node {

			const node = *@This();
			return node.next.*;

		} // get_next() 

		fn set_next(ptr: ?*@This()) void {

			const node = *@This();
			node.next.*.next = ptr;

		} // set_next()

		fn set_value(value_set: T) void {

			const node = *@This();
			node.next.*.value = value_set;

		} // set_value()

		fn del_node(prev_node: *@This()) void {

			var node = *@This();
			prev_node.set_next(node.get_next());
			try allocator.destory(node);

		} // del_node()

		fn add_node(prev_node: *@This(), add_node_value: T) void {
			
			var node = *@This();
			var addition_node: T = try allocator.create(node, @sizeOf(node));
			
			prev_node.set_next(*node);

			addition_node.set_value(add_node_value);
			addition_node.set_next(node.get_next());

			Node.set_next(add_node.next);

		} // add_node()

	}; // struct Node

}

pub fn make_idx_list(comptime T: type) type {

	return struct {
		value: T,
		next: ?@This(), 
		idx: i32,

	};

}

pub fn main() !void {

	var gpa = std.heap.DebugAllocator(.{}){};
	defer _ = gpa.deinit();
	const allocator = gpa.allocator();

	_ = linked_list(i32);
	
	

}
