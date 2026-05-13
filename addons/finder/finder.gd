extends Node

func get_root():
	return get_tree().root.get_child(get_tree().root.get_child_count() - 1)

func find_child_by_name(root: Node, name: String):
	if root == null:
		push_warning("find_child_by_name: parent is null")
		return null
	
	for p in root.get_children():
		if p.name == name:
			return p
		var gp = find_child_by_name(p, name)
		if gp != null:
			return gp
	return null
	
func find_children_by_name(root: Node, name: String):
	if root == null:
		push_warning("find_children_by_name: parent is null")
		return null
	
	var res = []
	for p in root.get_children():
		if p.name == name:
			res.append(p)
		if p.get_child_count() > 0:
			var gps = find_child_by_name(p, name)
			for gp in gps:
				res.append(gp)
	return res
	
func is_node_of_class(node: Node, class_string: String) -> bool:
	var is_instance := false
	if node.get_script():
		if node.get_script().get_global_name() == class_string:
			is_instance = true
	if node.is_class(class_string): # Keep this check in for built-in classes
		is_instance = true
	return is_instance
	
func find_child_by_type(root: Node, typename: String):
	if root == null:
		push_warning("find_child_by_type: parent is null")
		return null
	
	for p in root.get_children():
		if is_node_of_class(p, typename):
			return p
		var gp = find_child_by_type(p, typename)
		if gp != null:
			return gp
	return null
	
func find_children_by_type(root: Node, typename: String):
	if root == null:
		push_warning("find_children_by_type: parent is null")
		return null
		
	var res = []
	
	for p in root.get_children():
		if is_node_of_class(p, typename):
			res.append(p)
		if p.get_child_count() > 0:
			var gps = find_children_by_type(p, typename)
			for gp in gps:
				res.append(gp)
	return res

func find_parent_by_name(node: Node, name: String):
	if node == null:
		push_warning("find_parent_by_name: node is null")
		return null
	
	var parent = node.get_parent()
	while(parent != null):
		if parent.name == name:
			return parent
		parent = node.get_parent()
	return null
