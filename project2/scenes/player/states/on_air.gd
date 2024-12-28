extends State

@onready var player: Player = $"../.."

func enter() -> void:
	player.coyote_timer.start()

func physicsUpdate(delta:float) -> void:
	super.physicsUpdate(delta)
	if Input.is_action_just_pressed("jump") && player.coyote_timer.time_left>0:
		player.jump()
		
	player.velocity.x = move_toward(player.velocity.x, player.direction*player.run_speed, delta*player.acceleration/3)
	
	if player.is_on_floor():
		change_state.emit("onfloor")
