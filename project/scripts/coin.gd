extends Node2D

signal take_up

var 初始位置 :Vector2
var player:CharacterBody2D
var is_take = false
var is_emitted = false

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
#扣你吉瓦

func _ready() -> void:
	初始位置=position

func _on_body_entered(body: Node2D) -> void:
	is_take = true
	player = body
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	if is_take:
		position.y += (player.position.y-position.y)/20
		if position.x - player.position.x >= 50:
			position.x -= 6
		elif position.x -player.position.x <= -50:
			position.x += 6
		
		if player.is_die:
			is_take =false
			position =初始位置
			
		if player.is_on_floor():
			animation_player.play("taken")
			if not is_emitted:
				is_emitted = true
				take_up.emit()
			pass
		
