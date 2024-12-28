extends State

@onready var player: Player = $"../../.."

func enter() ->void:
	player.animation_tree.set("parameters/OnFloor/conditions/Roll", true)
	player.velocity.x = player.flippable.scale.x*player.roll_speed

func exit() -> void:
	player.animation_tree.set("parameters/OnFloor/conditions/Roll", false)
