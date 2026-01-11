class_name Asteroid extends Area2D

signal exploded(pos, size)

@export var speed := 20.0
enum asteroidSizes {LARGE, MEDIUM, SMALL}
@onready var sprite = $Sprite2D
@onready var area = $CollisionShape2D
@export var size = asteroidSizes.LARGE
@export var movement_vector := Vector2(0, -1)
func _ready() -> void:
	rotation = randf_range(0, 2*PI)
	match size:
		asteroidSizes.LARGE:
			#area.shape = preload("res://Resources/asteroidLargeHitbox.tres")
			area.set_deferred("shape", preload("res://Resources/asteroidLargeHitbox.tres"))
			speed = randf_range(50, 100)
			sprite.texture = preload("res://PlaceHolder/asteroid(1).png")
			sprite.scale = Vector2(0.8, 0.8)
			
		asteroidSizes.MEDIUM:
			#area.shape = preload("res://Resources/asteroidMediumHitbox.tres")
			area.set_deferred("shape", preload("res://Resources/asteroidMediumHitbox.tres"))
			speed = randf_range(100, 150)
			sprite.texture = preload("res://PlaceHolder/meteorite.png")
			sprite.scale = Vector2(0.5, 0.5)
			
		asteroidSizes.SMALL:
			#area.shape = preload("res://Resources/asteroidSmallHitbox.tres")
			area.set_deferred("shape", preload("res://Resources/asteroidSmallHitbox.tres"))
			speed = randf_range(150, 200)
			sprite.texture = preload("res://PlaceHolder/asteroid.png")
			sprite.scale = Vector2(0.20, 0.20)
			
			
func _physics_process(_delta):
	global_position += movement_vector.rotated(rotation) * speed * _delta 
	var radius = area.shape.radius
	var screen_size = get_viewport_rect().size
	if global_position.y+radius < 0:
		global_position.y = screen_size.y+radius
	elif global_position.y-radius > screen_size.y:
		global_position.y = -radius
	if global_position.x+radius < 0:
		global_position.x = screen_size.x+radius
	elif global_position.x-radius > screen_size.x:
		global_position.x = -radius

func explode():
	emit_signal("exploded", global_position, size)
	queue_free()
#func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	#await get_tree().create_timer(3).timeout
	#queue_free()
	#


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		var player = body
		player.die()
