extends CharacterBody2D


var SPEED = randi_range(200, 300)
const JUMP_VELOCITY = -400.0
var _target: Player
@onready var enemy_detector = $"enemy detector"
func _physics_process(delta: float) -> void:
	if not _target:
		position += SPEED * Vector2.UP.rotated(rotation) * delta
		return
	look_at(_target.global_position)
	position = position.move_toward(_target.global_position, SPEED * delta)
	var screen_size = get_viewport_rect().size
	if global_position.y < 0:
		global_position.y = screen_size.y
	elif global_position.y > screen_size.y:
		global_position.y = 0
	if global_position.x < 0:
		global_position.x = screen_size.x
	elif global_position.x > screen_size.x:
		global_position.x = 0
	


func _on_enemy_detector_body_entered(player: Player) -> void:
	if _target != null:
		return
	if player == null:
		return
	_target = player
	

	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		var player = body
		player.die()
