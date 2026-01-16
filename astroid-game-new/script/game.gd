extends Node2D

@onready var lasers = $Laser
@onready var player = $player
@onready var Asteroids = $Asteroids
@onready var hud = $UI/HUD
@onready var spawn = $PlayerRespawn
@onready var game_over_scene = $"UI/Game Over Scene"
@onready var question_hud = $UI/question_scene
@onready var timer = $Timer
@onready var wrong_label = $UI/wrong_answer
@onready var correct_label = $UI/correct_answer

var timer_start = false

var  score := 0:
	set(value):
		score = value
		hud.score = score
var life := 3:
	set(value):
		life = value
		hud.lives = life

var multi := 1.0:
	set(value):
		multi = value
		hud.mult = multi

var asteroid_scene = preload("res://scenes/asteroid.tscn")

func _ready():
	score = 0
	multi = 1.0
	player.connect("laser_shot", firing)
	player.connect("died", player_died)
	question_hud.connect("correct", plus_multiplier)
	question_hud.connect("wrong", minus_life)
	for asteroid in Asteroids.get_children():
		asteroid.connect("exploded", _on_asteroid_exploded)
		
func  _process(delta: float) -> void:
	if timer_start == false:
		timer_start = true
		rnd_timer()


func firing(laser):
	lasers.add_child(laser)

func _on_asteroid_exploded(pos, size):
	match size:
		Asteroid.asteroidSizes.LARGE:
			score += (100 * multi)
			for i in range(2):
				spawn_asteroid(pos, Asteroid.asteroidSizes.MEDIUM)
		Asteroid.asteroidSizes.MEDIUM:
			score += (50 * multi)
			for i in range(3):
				spawn_asteroid(pos, Asteroid.asteroidSizes.SMALL)
		Asteroid.asteroidSizes.SMALL:
			score += (25 * multi)
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
		game_over_scene.visible = true
	else:
		await get_tree().create_timer(2).timeout
		player.respawn(spawn.global_position)
	print(life)

func minus_life():
	life -= 1
	get_tree().paused = false
	wrong_label.visible = true
	if life <= 0:
		game_over_scene.visible = true
		player.visible = false
		player.process_mode = Node.PROCESS_MODE_DISABLED
		
	await get_tree().create_timer(1.5).timeout
	wrong_label.visible = false
	
func plus_multiplier():
	multi += 0.1
	get_tree().paused = false
	correct_label.visible = true
	await get_tree().create_timer(1.5).timeout
	correct_label.visible = false
	
func rnd_timer():
	
	var time = randf_range(5.0, 10.0)
	
	timer.start(time)
	

func _on_timer_timeout() -> void:
	player.spawn_protection = true
	Global.generate = true
	if life > 0:
		question_hud.visible = true
		get_tree().paused = true
	timer_start = false

func grade_chose(grade):
	pass
