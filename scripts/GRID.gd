extends Control

export(int) var width_board  = 4
export(int) var height_board = 4
export(int) var width  = 4
export(int) var height = 4
export(int) var initial_pieces = 2
export(int) var pieces_per_turn = 1
export(int) var margin = 10

export(int) var piece_width  = 50
export(int) var piece_height = 50

const Piece = preload("res://scenes/PIECE.tscn") 
var board = []

func _ready():
	randomize()
	setup_board()
	initi_board()
	
func new_turn():
	create_turn_pieces()
	
func create_turn_pieces():
	for i in range(0, pieces_per_turn):
		create_piece_at_random_spot(2)
	
func setup_board():
	for x in range(0, width_board):
		board.append([])
		for y in range(0, height_board):
			board[x].append(null)
			
func initi_board():
	for i in range(0, initial_pieces):
		create_piece_at_random_spot(2)
		
func create_piece_at_random_spot(value):
	var empity_spots = get_empity_spots()
	if empity_spots.size() == 0:
		return
	empity_spots.shuffle()
	create_piece(value ,empity_spots[0].x, empity_spots[0].y)

func get_empity_spots():
	var empity_spots = []
	for x in range(0, width_board):
		for y in range(0, height_board):
			if is_free(x, y):
				empity_spots.append(Vector2(x,y))
	return empity_spots
	
func create_piece(value, x, y):
	if not is_free(x,y):
		return
	var piece = Piece.instance()
	piece.set_value(value)
	piece.rect_size = Vector2(piece_width, piece_height)
	piece.rect_position = get_pos_from_grid_pos(x, y)
	board[x][y]
	add_child(piece)

func get_pos_from_grid_pos(x, y):
	var margin_horizontal = (x + 1) * margin
	var margin_vertical   = (y + 1) * margin
	var offset_horizontal = x * piece_width
	var offset_vertical   = y * piece_height

	return Vector2(margin_horizontal + offset_horizontal, margin_vertical + offset_vertical)

func is_free(x, y):
	return board[x][y] == null
