extends Node2D

@export var connected:Node2D
@export var is_timing:bool = false
@export var wait_time:float = 2

var is_on : bool = false:
	set(x):
		is_on = x
		sprite_2d.texture = BUTTON_ON if is_on else  BUTTON_OFF
		if connected != null:
			connected.is_on = is_on

@onready var timer: Timer = $Timer
@onready var sprite_2d: Sprite2D = $Sprite2D
const BUTTON_ON = preload("res://assets/button_on.png")
const BUTTON_OFF = preload("res://assets/button_off.png")

func _ready() -> void:
	timer.wait_time = wait_time
	sprite_2d.texture = BUTTON_ON if is_on else  BUTTON_OFF

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		is_on = true
		timer.stop()

func _on_timer_timeout() -> void:
	is_on = false

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is Player&&is_timing&&is_on:
		timer.start()
