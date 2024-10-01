extends Node2D

@onready var camera: Camera2D = $Player/Camera
@onready var player: CharacterBody2D = $Player
@onready var coins: Node2D = $Mid/Coins
@onready var label: Label = $Player/Camera2D/Label
@onready var win_zone = $win_zone

var num_dead : int = 0
var score : int = 0
var num_coins: int = 0

var is_winning : bool =false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	label.visible = false
	for i in coins.get_child_count():
		num_coins += 1
		coins.get_child(i).take_up.connect(_on_coin_take_up)
	player.dead.connect(_on_player_dead)
	win_zone.win.connect(_on_win_zone_win)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("exit"):
		get_tree().change_scene_to_file("res://scenes/game.tscn")
	if is_winning:
		label.visible = true
		player.set_physics_process(false)
		if Input.is_action_just_pressed("resume"):
			get_tree().change_scene_to_file("res://scenes/game.tscn")
	pass
			


func _on_coin_take_up() -> void:
	score += 1
	print(score)
	pass # Replace with function body.


func _on_win_zone_win() -> void:
	is_winning = true
	label.text = "You Win\n\n" +"Dead: "+str(num_dead)+"\n\n"+ "Coins: " + str(score) +" / "+str(num_coins)+"\n\n"+"Press Space to continue"
	if score == num_coins:
		print("full")
	pass # Replace with function body.


func _on_player_dead() -> void:
	num_dead += 1
	pass # Replace with function body.
