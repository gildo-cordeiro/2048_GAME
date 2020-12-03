extends Control

const Grid = preload("res://scenes/GRID.tscn")
var grid = Grid.instance() 
var piece_measures = 88

func _ready():
	grid.piece_width  = piece_measures
	grid.piece_height = piece_measures
	$ColorRect/MarginContainer/body/bottom/grid.add_child(grid)
	pass
	
func newMov():
	if(Input.is_action_pressed("ui_up")):
		print("dale")
		
func _process(delta):
	newMov()
	
func _on_button_pressed():	
	grid.setup_board()
	grid.piece_width  = piece_measures
	grid.piece_height = piece_measures
	$ColorRect/MarginContainer/body/bottom/grid.add_child(grid)
