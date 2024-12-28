extends State

@onready var player: Player = $"../../.."

func physicsUpdate(delta:float) -> void:
	if player.direction != 0:
		player.flippable.scale.x = player.direction
	if Input.is_action_just_pressed("jump"):
		player.jump()
	player.velocity.x = move_toward(player.velocity.x ,player.direction * player.run_speed ,delta*player.acceleration)
	
	if Input.is_action_just_pressed("roll"):
		change_state.emit("roll")
