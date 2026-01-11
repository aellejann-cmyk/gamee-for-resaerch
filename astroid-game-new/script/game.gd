extends Node2D

@onready var lasers = $Laser
@onready var player = $player
@onready var Asteroids = $Asteroids
var asteroid_scene = preload("res://scenes/asteroid.tscn")
func _ready():
	player.connect("laser_shot", firing)
	for asteroid in Asteroids.get_children():
		asteroid.connect("exploded", _on_asteroid_exploded)
func firing(laser):
	lasers.add_child(laser)
func _on_asteroid_exploded(pos, size):
	match size:
		Asteroid.asteroidSizes.LARGE:
			for i in range(2):
				spawn_asteroid(pos, Asteroid.asteroidSizes.MEDIUM)
		Asteroid.asteroidSizes.MEDIUM:
			for i in range(3):
				spawn_asteroid(pos, Asteroid.asteroidSizes.SMALL)
		Asteroid.asteroidSizes.SMALL:
			pass
func spawn_asteroid(pos, size):
	var a = asteroid_scene.instantiate()
	a.global_position = pos
	a.size = size
	a.connect("exploded", _on_asteroid_exploded)
	Asteroids.add_child(a)
