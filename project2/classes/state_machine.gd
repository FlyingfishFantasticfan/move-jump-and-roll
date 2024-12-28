extends Node
class_name StateMachine

@export var init_state : State
var current_state : State = null
var states : Dictionary= {}

func _ready()-> void:
	for state in get_children():
		if state is State:
			states[state.name.to_lower()] = state
			state.change_state.connect(changeState)
	current_state = init_state

func addState(state_name: String, state: Node) -> void:
	states[state_name] = state

func changeState(state_name: String) -> void:
	current_state.exit()
	current_state = states.get(state_name.to_lower(), null)
	current_state.enter()

func _physics_process(delta: float) -> void:
	if current_state:
		current_state.physicsUpdate(delta)

func _process(delta: float) -> void:
	if current_state:
		current_state.update(delta)
