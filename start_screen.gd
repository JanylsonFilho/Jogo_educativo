extends Control

func _ready():
	$controls/startBtn.grab_focus()





func _on_start_btn_pressed():
	get_tree().change_scene_to_file("res://apresentaçao.tscn")





func _on_controls_btn_pressed():
	get_tree().change_scene_to_file("res://controles.tscn")


func _on_quit_btn_pressed():
	get_tree().quit()
