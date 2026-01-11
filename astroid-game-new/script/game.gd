extends Node2D

@onready var lasers = $Laser
@onready var player = $player
@onready var Asteroids = $Asteroids
@onready var hud = $UI/HUD
@onready var spawn = $PlayerRespawn

var  score := 0:
	set(value):
		score = value
		hud.score = score
var life := 3:
	set(value):
		life = value
		hud.lives = life


var asteroid_scene = preload("res://scenes/asteroid.tscn")
func _ready():
	score = 0
	player.connect("laser_shot", firing)
	player.connect("died", player_died)
	for asteroid in Asteroids.get_children():
		asteroid.connect("exploded", _on_asteroid_exploded)
func firing(laser):
	lasers.add_child(laser)
func _on_asteroid_exploded(pos, size):
	match size:
		Asteroid.asteroidSizes.LARGE:
			score += 100
			for i in range(2):
				spawn_asteroid(pos, Asteroid.asteroidSizes.MEDIUM)
		Asteroid.asteroidSizes.MEDIUM:
			score += 50
			for i in range(3):
				spawn_asteroid(pos, Asteroid.asteroidSizes.SMALL)
		Asteroid.asteroidSizes.SMALL:
			score += 25
	print(score)
func spawn_asteroid(pos, size):
	var a = asteroid_scene.instantiate()
	a.global_position = pos
	a.size = size
	a.connect("exploded", _on_asteroid_exploded)
	#Asteroids.add_child(a)
	Asteroids.call_deferred("add_child", a)

func player_died():
	life -= 1
	if life <= 0:
		get_tree().reload_current_scene()
	else:
		await get_tree().create_timer(2).timeout
		player.respawn(spawn.global_position)
	print(life)
