extends State

@onready var player: Player = $"../../.."
@onready var stand_collision_shape_2d: CollisionShape2D = $"../../../StandCollisionShape2D"

func enter() ->void:
	stand_collision_shape_2d.disabled = true
	player.position.y -= 1
	player.animation_tree.set("parameters/OnFloor/conditions/Roll", true)
	player.velocity.x += player.flippable.scale.x*player.roll_speed

func physicsUpdate(delta:float) -> void:
	if Input.is_action_just_pressed("roll"):
		if player.direction != 0:
			player.flippable.scale.x = player.direction
		get_parent().roll()


func exit() -> void:
	player.animation_tree.set("parameters/OnFloor/conditions/Roll", false)
	player.animation_tree.get("parameters/OnFloor/playback").travel("idle")
