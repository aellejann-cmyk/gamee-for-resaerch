extends Node2D



func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_grade_level_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/grade_level.tscn")

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("boss_fight"):
		get_tree().change_scene_to_file("res://scenes/boss_arena.tscn")
