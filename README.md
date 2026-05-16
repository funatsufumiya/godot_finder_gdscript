# godot_finder_gdscript

Node finder addon for Godot 4.2.2 - 4.4

This is gdscript version of [godot_finder](https://github.com/funatsufumiya/godot_finder).

(If your target platform can use GDExtension, [godot_finder](https://github.com/funatsufumiya/godot_finder) which implemented in C++ would be much faster.)

## Usage

- Example node tree:

```mermaid
graph TD;
    MyRoot-->Test1;
    MyRoot-->SpriteA["SpriteA (MySprite)"];
    MyRoot-->SpriteB;
    MyRoot-->ParentA;
    ParentA-->SpriteC;
    ParentA-->ParentB;
    ParentB-->SpriteD["SpriteD (MySprite)"];
```

- GDScript:

```gdscript
# get root node
var root = Finder.get_root()
print(root) # -> MyRoot

# query node by name, and get first one
var test1 = Finder.find_child_by_name(root, "Test1")
print(test1) # -> Test1

# query node by type, and get first one
var test_sprite1 = Finder.find_child_by_type(root, "Sprite2D")
print(test_sprite1) # -> SpriteA

# query node by type, and get all
var sprites = Finder.find_children_by_type(root, "Sprite2D")
print(sprites) # -> [SpriteA, SpriteB, SpriteC, SpriteD]

# query node by user defined type
var my_sprites = Finder.find_children_by_type(root, "MySprite")
print(my_sprites) # -> [SpriteA, SpriteD]

# query parent node by name
var parent1 = Finder.find_parent_by_name(test1, "MyRoot")
print(parent1) # -> MyRoot

# query parent node by type
var parent2 = Finder.find_parent_by_type(test1, "Node2D")
print(parent2) # -> MyRoot

# query parent nodes by type
var sprite_d = Finder.find_child_by_name(root, "SpriteD")
var parents = Finder.find_parents_by_type(sprite_d, "Node2D")
print(parents) # -> [ParentB, ParentA, MyRoot]
```

## Install

### 1. Copy Files

- Create a `addons/finder` folder in your godot project
- Copy `*.gd`, `plugin.cfg` files from [`addons/finder`](addons/finder) to `addons/finder` in your godot project

### 2. Enable Plugin

- Enable the plugin in the project settings
