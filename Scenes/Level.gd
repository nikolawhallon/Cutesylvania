extends Node

var rooms = {
	"Room000":
	{
		"scene_path": "res://Scenes/Rooms/Room000.tscn",
		"limit_left": -256,
		"limit_right": 256,
		"limit_top": -72,
		"limit_bottom": 72
	},
	"Room001":
	{
		"scene_path": "res://Scenes/Rooms/Room001.tscn",
		"limit_left": -512,
		"limit_right": 512,
		"limit_top": -72,
		"limit_bottom": 72
	},
	"Room002":
	{
		"scene_path": "res://Scenes/Rooms/Room002.tscn",
		"limit_left": -128,
		"limit_right": 128,
		"limit_top": -72,
		"limit_bottom": 72
	}
}

var current_room
var current_dotty

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.scancode == KEY_N:
			load_room("Room002", Vector2(0, 0))

func load_room(name, pos):
	if current_room != null:
		current_room.queue_free()
	if current_dotty != null:
		current_dotty.queue_free()

	var room = load(rooms[name]["scene_path"]).instance()
	room.connect("portal_to", self, "_portal_to")
	current_room = room
	add_child(room)
	
	var dotty = load("res://Scenes/Dotty.tscn").instance()
	dotty.get_node("Camera2D").limit_left = rooms[name]["limit_left"]
	dotty.get_node("Camera2D").limit_right = rooms[name]["limit_right"]
	dotty.get_node("Camera2D").limit_top = rooms[name]["limit_top"]
	dotty.get_node("Camera2D").limit_bottom = rooms[name]["limit_bottom"]
	dotty.set_global_position(pos)
	current_dotty = dotty
	add_child(dotty)

func _portal_to(name, pos):
	load_room(name, pos)

func _ready():
	load_room("Room000", Vector2(0, 0))
