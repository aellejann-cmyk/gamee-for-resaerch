extends Node2D

@onready var lasers = $Laser
@onready var player = $player
@onready var missle = $missile
@onready var hud = $UI/HUD
@onready var spawn = $PlayerRespawn
@onready var game_over_scene = $"UI/Game Over Scene"
@onready var boss = $boss
@onready var muzzle1 = $muzzles1
@onready var muzzle2 = $muzzles2
@onready var blockngLaser = $"lasers/blocking laser"
@onready var laser_attack = $"lasers/attacking laser/attack"
var can_shoot = true
var missile_scene = preload("res://scenes/missiles.tscn")

var timer_start = false
var nextPhase = false
var attack_begins = false

var life := 1:
	set(value):
		life = value
		hud.lives = life




func _ready():
	blockngLaser.process_mode = Node.PROCESS_MODE_DISABLED
	life = 1
	player.connect("laser_shot", firing)
	player.connect("died", player_died)
	boss.connect("down", next_phase)

		
func  _process(delta: float) -> void:
	if nextPhase == false:
		shoot_missile()
	if attack_begins == true:
		attack_laser()
		$warning.visible = false


func firing(laser):
	$Lasers.play()
	lasers.add_child(laser)


func player_died():
	$death.play()
	life -= 1
	if life <= 0:
		game_over_scene.visible = true
		$gameover.play()
	else:
		await get_tree().create_timer(2).timeout
		player.respawn(spawn.global_position)
	print(life)

func minus_life():
	life -= 1
	get_tree().paused = false

	if life <= 0:
		game_over_scene.visible = true
		player.visible = false
		player.process_mode = Node.PROCESS_MODE_DISABLED
		
	await get_tree().create_timer(1.5).timeout

	



func _on_timer_timeout() -> void:
	player.spawn_protection = true
	Global.generate = true
	if life > 0:

		get_tree().paused = true
	timer_start = false

func shoot_missile():
	if can_shoot == true:
		var m = missile_scene.instantiate()
		var rng = randi_range(1,2)
		if rng == 1:
			m.global_position = muzzle1.global_position
		elif rng == 2:
			m.global_position = muzzle2.global_position
		missle.add_child(m)
		print("FIRING MISSLE")
		can_shoot = false
		await get_tree().create_timer(5).timeout
		can_shoot = true

func next_phase():
	nextPhase = true
	
	
	player.disconnect("laser_shot", firing)
	for missle in missle.get_children():
		missle.queue_free()
	player.process_mode = Node.PROCESS_MODE_DISABLED
	player.global_position = spawn.global_position
	$boss/movement.play("movement")
	await get_tree().create_timer(2).timeout
	blockngLaser.visible = true
	player.process_mode = Node.PROCESS_MODE_INHERIT
	blockngLaser.process_mode = Node.PROCESS_MODE_INHERIT
	$warning.visible = true
	await get_tree().create_timer(10).timeout
	
	attack_begins = true


func _on_blocking_laser_body_entered(body: Node2D) -> void:
	if body is Player:
		var player = body
		player.die()
		
func attack_laser():
	
	
	attack_begins = false
	randomize()
	var loc = randi_range(1,5)
	laser_attack.play("RESET")
	if loc == 1:
		print("laser 1")
		laser_attack.play("laser")
		await get_tree().create_timer(2).timeout
		attack_begins = true
	elif loc == 2:
		laser_attack.play("laser 2")
		print("laser 2")
		await get_tree().create_timer(2).timeout
		attack_begins = true
	elif loc == 3:
		print("laser 3")
		laser_attack.play("laser3")
		await get_tree().create_timer(2).timeout
		attack_begins = true
	elif loc == 4:
		print("attack 4")
		laser_attack.play("attack 4")
		await get_tree().create_timer(2).timeout
		attack_begins = true
	elif loc == 5:
		print("attack 5")
		laser_attack.play("attack 5")
		await get_tree().create_timer(2).timeout
		attack_begins = true
