extends Node2D

@onready var lasers = $Laser
@onready var player = $player

func _ready():
	player.connect("laser_shot", firing)
	
func firing(laser):
	lasers.add_child(laser)
