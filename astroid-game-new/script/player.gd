class_name Player extends CharacterBody2D

signal laser_shot(laser)
signal died

@export var acceleration := 10.0
@export var max_speed := 350.0
@export var rotation_speed := 250.0
var can_shoot = true

@onready var muzzle = $muzzles
@onready var sprite = $Sprite2D
var alive := true
var spawn_protection := false
var laser_scene = preload("res://scenes/LaserUsed.tscn")

func _process(delta: float) -> void:
	if spawn_protection == true:
		await get_tree().create_timer(1.5).timeout
		spawn_protection = false
	if Input.is_action_just_pressed("shoot"):
		shoot_laser()

func _physics_process(_delta):
	var input_vector := Vector2(0, Input.get_axis("move_forward", "move_backward"))
	
	velocity += input_vector.rotated(rotation) * acceleration 
	velocity = velocity.limit_length(max_speed)
	
	if Input.is_action_pressed("rotate_right"):
		rotate(deg_to_rad(rotation_speed*_delta))
	if Input.is_action_pressed("rotate_left"):
		rotate(deg_to_rad(-rotation_speed*_delta))
	
	if input_vector.y == 0:
		velocity = velocity.move_toward(Vector2.ZERO, 3)
	
	
	
	
	move_and_slide()
	
	var screen_size = get_viewport_rect().size
	if global_position.y < 0:
		global_position.y = screen_size.y
	elif global_position.y > screen_size.y:
		global_position.y = 0
	if global_position.x < 0:
		global_position.x = screen_size.x
	elif global_position.x > screen_size.x:
		global_position.x = 0
		
func shoot_laser():
	if can_shoot == true:
		var l = laser_scene.instantiate()
		l.global_position = muzzle.global_position
		l.rotation = rotation
		emit_signal("laser_shot", l)
		print("FIRING")
		can_shoot = false
		await get_tree().create_timer(0.2).timeout
		can_shoot = true

func die():
	if alive == true and spawn_protection == false:
		alive = false
		
		emit_signal("died")
		sprite.visible = false
		process_mode = Node.PROCESS_MODE_DISABLED
	
func respawn(pos):
	if alive == false:
		
		global_position = pos
		velocity = Vector2.ZERO
		
		sprite.visible = true
		process_mode = Node.PROCESS_MODE_INHERIT
		spawn_protect()
		
func spawn_protect():
	await get_tree().create_timer(1.5).timeout
		
	alive = true
