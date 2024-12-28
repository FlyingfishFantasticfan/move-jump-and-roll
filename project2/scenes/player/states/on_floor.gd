extends State
@onready var player: Player = $"../.."

func physicsUpdate(delta:float) ->void:
	super.physicsUpdate(delta)
	if Input.is_action_just_pressed("jump"):
		player.jump()


	if !player.is_on_floor():
		change_state.emit("onair")
