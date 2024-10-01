extends Node2D


const MAP_3 = preload("res://scenes/levels/map_1.tscn")
const MAP_1 = preload("res://scenes/levels/map_2.tscn")
const Map_2 = preload("res://scenes/levels/map_3.tscn")
const Map_4 = preload("res://scenes/levels/map_4.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.





func _on_button_2_button_down() -> void:
	get_tree().change_scene_to_file(Map_2.resource_path)
	pass # Replace with function body.


func _on_button_button_down() -> void:
	get_tree().change_scene_to_file(MAP_1.resource_path)
	pass # Replace with function body.


func _on_button_3_button_down() -> void:
	get_tree().change_scene_to_file(MAP_3.resource_path)
	pass # Replace with function body.


func _on_button_4_button_down() -> void:
	get_tree().change_scene_to_file(Map_4.resource_path)
	pass # Replace with function body.
