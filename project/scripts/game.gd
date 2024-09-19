extends Node2D


const MAP_2 = preload("res://scenes/levels/map_2.tscn")
const MAP_1 = preload("res://scenes/levels/map_1.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("关卡1"):
		get_tree().change_scene_to_file(MAP_1.resource_path)
	if Input.is_action_just_pressed("关卡2"):
		get_tree().change_scene_to_file(MAP_2.resource_path)
	
