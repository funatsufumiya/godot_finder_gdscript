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
	
func find_child_by_type(root: Node, typename: String):
	if root == null:
		push_warning("find_child_by_name: parent is null")
		return null
	
	for p in root.get_children():
		if p.is_class(typename):
			return p
		var gp = find_child_by_type(p, typename)
		if gp != null:
			return gp
	return null
