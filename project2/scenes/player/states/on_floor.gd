extends State
@onready var player: Player = $"../.."
@onready var ray_cast_2d: RayCast2D = $"../../RayCast2D"

var can_roll:bool = true

func roll() -> void:
	if can_roll:
		can_roll = false
		changeState("roll")

func physicsUpdate(delta:float) ->void:
	super.physicsUpdate(delta)
	if Input.is_action_just_pressed("jump"):
		player.jump()
	if !player.is_on_floor()&&current_state.name != "Roll":
		change_state.emit("onair")

func tryStand():
	can_roll = true
	player.velocity.x = 0
	if !ray_cast_2d.is_colliding():
		changeState("Stand")
