extends Node2D

var children = []
var selection = 0
var vectors = [Vector2(-46, -7), Vector2(106, -7), Vector2(268, -7), Vector2(425, -7)]

var can_move : bool = true

signal button_selection
signal menu_goback
signal soul_reposition

func _ready():
	connect("button_selection", owner, "_button_Pressed")
	connect("menu_goback", owner, "response_menu_Goback")
	connect("soul_reposition", owner, "_soul_Reposition")
	
	for child in get_children():
		if child.get_class() == "Node2D":
			children.append(child.get_node("AnimatedSprite"))
	default_selection()


func default_selection():
	children[selection].frame = 1
	emit_signal("soul_reposition", position + vectors[selection], can_move)


func _input(event):
	if true:
		var press = int(event.is_action_pressed("ui_right")) - int(event.is_action_pressed("ui_left"))
		if press and can_move == true:
			children[selection].frame = 0
			selection += press
			selection = selection % 4
			children[selection].frame = 1
			$Focused.play()
		elif event.is_action_pressed("interact"):
			$Select.play()
			
			emit_signal("button_selection", children[selection].get_parent().name, can_move)
			
		elif event.is_action_pressed("skip_dialog"):
			emit_signal("menu_goback")
		
		emit_signal("soul_reposition", position + vectors[selection], can_move)
