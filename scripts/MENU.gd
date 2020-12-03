extends Control

var Game = preload("res://scenes/GAME.tscn")

func _ready():
	pass # Replace with function body.

func _on_button_pressed():
	var game = Game.instance()
	add_child(game)
	pass # Replace with function body.


func _on_Button2_pressed():
	self.get_tree().free()
