extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var gpu_particles_2d: GPUParticles2D = $tuowei
@onready var particle_jump: GPUParticles2D = $jump
@onready var roll_sound: AudioStreamPlayer2D = $roll_sound
@onready var jump_sound: AudioStreamPlayer2D = $jump_sound
@onready var super_roll_sound: AudioStreamPlayer2D = $super_roll_sound
@onready var timer_roll: Timer = $timer_roll
@onready var revive: AudioStreamPlayer2D = $revive
@onready var die: AudioStreamPlayer2D = $die

signal dead

const SPEED = 180.0
const JUMP_VELOCITY = -280.0

var is_rolling :bool = false
var is_die :bool = false
var is_super_jump :bool = false
var is_revive :bool = true
var is_super_roll :bool = false
var can_roll : bool = true

var rolling_speed : float = 1.2 #当滚动时速度是基础移速的多少倍
var remain_jump : int = 1
var remain_roll : int = 1

var index_of_roll : int = 0
var index_of_super_jump :int =0

var revive_position:Vector2 

func _ready() -> void:
	reset_revive_position()

func _physics_process(delta: float) -> void:
	update_velocity(delta)
	update_animation()
	move_and_slide()

func update_velocity(delta: float) -> void:
	var direction := Input.get_axis("move_left", "move_right")
	
	
	#死亡时位置不变
	if is_die||is_revive:
		gpu_particles_2d.emitting = false
		particle_jump.emitting = false
		velocity.x = 0
		velocity.y = 0
		return
	
	if (can_roll||is_super_jump) && Input.is_action_just_pressed("roll") && remain_roll !=0  && (not is_rolling || is_super_jump):
		can_roll = false
		remain_roll -= 1
		is_rolling = true
		collision_shape_2d.get_shape().size.y = 10
		print("action: roll")
		if is_super_jump :
			print("action: super roll")
			is_rolling = false
			is_super_jump = false
			is_super_roll = true
			super_roll_sound.play()
			velocity.y = 0
			if direction > 0 :
				velocity.x = SPEED * 4
			elif direction < 0 :
				velocity.x = SPEED * -4
		else:
			roll_sound.play()
			
	if is_super_roll:
		return
		
	# 当未处于平台之上时，添加重力影响，处于滚动状态下受重力影响减少,落地时恢复跳跃和冲刺
	if not is_on_floor():
		index_of_roll = 0
		if is_rolling && not is_super_jump:
			velocity += get_gravity() * delta * 0.4
		else:
			velocity += get_gravity() * delta
	else:
		remain_jump = 1
		if is_rolling:
			index_of_roll += 1
			if index_of_roll == 5:
				index_of_roll = 0
				remain_roll = 1
				print("roll_recover")
		else :
			index_of_roll = 0
			remain_roll = 1
	
	

	#滚动期间跳跃，跳跃高度降低，滚动加速增强
	if Input.is_action_just_pressed("jump")&&remain_jump > 0:
		jump_sound.play()
		print("action: jump")
		particle_jump.restart()
		remain_jump -= 1
		if is_rolling && not is_super_jump:
			print("action: super jump")
			is_rolling = false
			is_super_jump = true
			velocity.y = JUMP_VELOCITY * 0.75
		else:
			velocity.y = JUMP_VELOCITY
		

	
	
	
	if direction:
		if is_super_jump:
			if direction > 0:
				velocity.x = SPEED * 2.95
			elif direction < 0:
				velocity.x = SPEED * -2.95
		else:
			velocity.x = direction * SPEED
		if is_rolling:
			velocity.x *= rolling_speed
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	

func update_animation() ->void:
	
	#change face direction
	if velocity.x > 0:
		animated_sprite_2d.flip_h = false
	elif velocity.x < 0:
		animated_sprite_2d.flip_h = true
	
	#which animation to play
	if is_die:
		animated_sprite_2d.play( "die")
		return
	if is_revive:
		animated_sprite_2d.play("revive")
		return
	
	if is_super_roll:
		gpu_particles_2d.amount = 100
		gpu_particles_2d.process_material.color = Color(255,215,0)
		animated_sprite_2d.animation = "super_roll"
		return
	if is_super_jump:
		gpu_particles_2d.amount = 50
		gpu_particles_2d.process_material.color = Color(128,0,128)
		animated_sprite_2d.animation = "super_jump"
		return
	if is_rolling:
		gpu_particles_2d.amount = 30
		gpu_particles_2d.emitting = true
		gpu_particles_2d.process_material.color = Color(0,255,255)
		animated_sprite_2d.play("roll")
		return	
	
	gpu_particles_2d.emitting = false
	if velocity.y>0:
		animated_sprite_2d.play("jump")
	elif velocity.y<0:
		animated_sprite_2d.play("fall")
	else:
		if velocity.x == 0:
			animated_sprite_2d.play("idle")
		else:
			animated_sprite_2d.play("run")


func _on_animated_sprite_2d_animation_finished() -> void:
	print("----------------------------------------------")
	
	collision_shape_2d.get_shape().size.y = 18
	is_super_roll = false
	is_super_jump = false
	is_revive = false
	is_rolling = false
	timer_roll.start()
	if is_die:
		collision_shape_2d.disabled = false
		position = revive_position
		revive.play()
		is_revive = true
		is_die = false



func recover_jump_roll() -> void:
	remain_jump = 1
	remain_roll = 1


func _on_timer_roll_timeout() -> void:
	print("roll time out")
	can_roll = true
	pass # Replace with function body.
	
func reset_revive_position() ->void:
	revive_position = position
	print("reset revive position:")
	print(revive_position)
	
func _dead() -> void:
	collision_shape_2d.disabled = true
	dead.emit()
	die.play()
	is_die = true
