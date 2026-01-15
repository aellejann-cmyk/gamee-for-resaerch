extends Control


func pause():
	get_tree().paused = true
	visible = true
	
func resume():
	visible = false
	get_tree().paused = false

func input():
	if Input.is_action_just_pressed("pause") and !get_tree().paused:
		pause()
	elif Input.is_action_just_pressed("pause") and get_tree().paused:
		resume()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	input()


func _on_resume_pressed() -> void:
	resume()


func _on_restart_pressed() -> void:
	resume()
	get_tree().reload_current_scene()


func _on_main_menu_pressed() -> void:
	#get_tree().reload_current_scene()
	resume()
	get_tree().change_scene_to_file("res://scenes/main_menu_scene.tscn")
