extends Node

func _on_java_script_button_pressed():
	GlobalVariables.pick_deck("javascript")

func _on_type_script_button_pressed():
	GlobalVariables.pick_deck("typescript")

func _on_csharp_button_pressed():
	GlobalVariables.pick_deck("c#")

func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Question/question.tscn")
