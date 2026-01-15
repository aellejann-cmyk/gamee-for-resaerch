extends Control
@onready var grade_label = $grade_label

func _ready() -> void:
	grade_label.text = "GRADE: " + str(Global.grade)
func _on_grade_7_pressed() -> void:
	Global.grade = 7
	print(Global.grade)
	grade_label.text = "GRADE: " + str(Global.grade)
func _on_grade_8_pressed() -> void:
	Global.grade = 8
	print(Global.grade)
	grade_label.text = "GRADE: " + str(Global.grade)
func _on_grade_9_pressed() -> void:
	Global.grade = 9
	print(Global.grade)
	grade_label.text = "GRADE: " + str(Global.grade)
func _on_grade_10_pressed() -> void:
	Global.grade = 10
	print(Global.grade)
	grade_label.text = "GRADE: " + str(Global.grade)
func _on_grade_11_pressed() -> void:
	Global.grade = 11
	print(Global.grade)
	grade_label.text = "GRADE: " + str(Global.grade)
func _on_grade_12_pressed() -> void:
	Global.grade = 12
	print(Global.grade)
	grade_label.text = "GRADE: " + str(Global.grade)


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu_scene.tscn")
