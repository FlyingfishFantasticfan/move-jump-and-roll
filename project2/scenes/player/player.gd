extends CharacterBody2D
class_name Player

## 移动速度
@export var run_speed : float = 160

## 加速到最高速所需的时间
@export var accleration_time: float = 0.1

##跳跃速度，修改可影响跳跃高度
@export var jump_speed :float = 400

## 郊狼时间，离开平台后一段时间仍然可以跳跃
@export var coyote_time : float = 0.1

## 翻滚速度，影响翻滚距离
@export var roll_speed:float = 400

var acceleration:float
var direction : float = 0
var can_jump:bool = true
var can_roll:bool = true
var key_num:int =0
var revive_position:Vector2
var is_die := false

@onready var flippable: Node2D = $Flippable
@onready var coyote_timer: Timer = %CoyoteTimer
@onready var state_machine: StateMachine = $StateMachine
@onready var animation_player: AnimationPlayer = $Flippable/AnimationPlayer
@onready var animation_tree: AnimationTree = $AnimationTree

func _ready() -> void:
	acceleration = run_speed/accleration_time
	coyote_timer.wait_time = coyote_time
	revive_position = position

func _physics_process(delta: float) -> void:
	direction = Input.get_axis("move_l","move_r")
	
	if is_on_floor():
		can_jump = true
	
	if is_die:
		is_die = false
		position = revive_position
	
	velocity += get_gravity()*delta
	move_and_slide()

func jump()->void:
	if can_jump:
		velocity.y -= jump_speed
		can_jump = false
