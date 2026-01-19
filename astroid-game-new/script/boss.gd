extends Area2D
class_name  Boss
signal down

@onready var shield = $shield
@onready var sprite = $Sprite2D
@onready var shield_healthUI = $shieldbar
@onready var shield_hitbox = $shield_hitbox
@onready var main_hitbox = $main

var shield_on = true
var alive := true
var shield_health = 100
func _ready() -> void:
	shield_healthUI.value = shield_health

func _physics_process(delta: float) -> void:
	pass

func shield_damage():
	shield_health -= 5
	shield_healthUI.value = shield_health
	shield_down()
	
func shield_down():
	if shield_health <= 0:
		shield.visible = false
		shield_hitbox.set_deferred("disabled", true)
		shield_health = 0
		main_hitbox.set_deferred("monitorable", true)
		$shield_down.play()
		emit_signal("down")
		$shieldbar.visible = false
