extends State
@onready var player: Player = $"../.."
@onready var ray_cast_2d: RayCast2D = $"../../RayCast2D"

func physicsUpdate(delta:float) ->void:
	super.physicsUpdate(delta)

	if !player.is_on_floor()&&current_state.name != "Roll":
		change_state.emit("onair")

func tryStand():
	player.velocity.x = 0
	if !ray_cast_2d.is_colliding():
		changeState("Stand")
