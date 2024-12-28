extends State

@onready var player: Player = $"../../.."

func physics_update(delta:float) -> void:
	if player.direction != 0:
		player.flippable.scale.x = player.direction
