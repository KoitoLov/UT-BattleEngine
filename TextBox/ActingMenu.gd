extends Node2D



var selection = 0
var vectors = [Vector2(320, 400), Vector2(106, 60), Vector2(268, -7), Vector2(425, -7)]
var new_position = Vector2(0,0)
signal menu_reposition

func _ready():
	self.position = Vector2(320, 400)
	default_selection()
	
func default_selection():
	pass
	#emit_signal("menu_reposition", position + vectors[selection])

func _input(event):
	if true:
		var press = int(event.is_action_pressed("ui_right")) - int(event.is_action_pressed("ui_left"))
		if press:
			selection += press
			selection = selection % 4
			$Focused.play()
		elif event.is_action_pressed("interact"):
			$Select.play()
			
			
	get_node("Soul").position = vectors[selection]















#			emit_signal("button_selection", children[selection].get_parent().name, can_move)
#
#		elif event.is_action_pressed("skip_dialog"):
#			emit_signal("menu_goback")
#
#		emit_signal("soul_reposition", position + vectors[selection], can_move)
