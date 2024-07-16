extends Control

func _ready():
	$controls/proximapag.grab_focus()





func _on_start_btn_pressed():
	get_tree().change_scene_to_file("res://cidade_dialogo.tscn")



