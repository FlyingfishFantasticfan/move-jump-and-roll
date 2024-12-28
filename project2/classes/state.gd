extends Node
class_name State

signal change_state(next_state:String)
@export var init_state : State
var current_state : State = null
var states : Dictionary= {}

func _ready()-> void:
	print(get_children())
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

#进入该状态时调用
func enter() -> void:
	current_state = init_state

#退出该状态时调用
func exit() -> void:
	if current_state:
		current_state.exit()

#每个物理帧调用
func physicsUpdate(delta:float) ->void:
	if current_state:
		current_state.physicsUpdate(delta)

func update(delta:float) ->void:
	if current_state:
		current_state.update(delta)
