extends Node2D

@onready var lasers = $Laser
@onready var player = $player
@onready var missle = $missile
@onready var hud = $UI/HUD
@onready var spawn = $PlayerRespawn
@onready var game_over_scene = $"UI/Game Over Scene"

@onready var muzzle = $muzzles
var can_shoot = true
var missile_scene = preload("res://scenes/missiles.tscn")

var timer_start = false


var life := 1:
	set(value):
		life = value
		hud.lives = life




func _ready():
	life = 1
	player.connect("laser_shot", firing)
	player.connect("died", player_died)


		
func  _process(delta: float) -> void:
	shoot_missile()



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
		m.global_position = muzzle.global_position
		missle.add_child(m)
		print("FIRING MISSLE")
		can_shoot = false
		await get_tree().create_timer(5).timeout
		can_shoot = true
