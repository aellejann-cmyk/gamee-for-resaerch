extends Area2D
class_name  Boss


@onready var shield = $shield
@onready var sprite = $Sprite2D

var shield_on = true
var alive := true
var shield_health = 100

func _physics_process(delta: float) -> void:
	pass

func shield_damage():
	shield_health -= 5
