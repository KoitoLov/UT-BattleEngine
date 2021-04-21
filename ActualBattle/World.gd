extends Node2D

#Load the BattleBox
const TextBox = preload("res://TextBox/TextBoxInBattle.tscn")

func _ready():
	
	$BattleMusic.play()
	
	
	
	
func _physics_process(delta):
	if Input.is_action_just_pressed("escape"):
		get_tree().quit()
	
	
	
func load_textbox():
	#Hacer la BattleBox una instance
	var text_box = TextBox.instance()
	
	#Instancear la BattleBox
	text_box.get_node("Text Box").time = 0.065
	
	text_box.get_node("Text Box").dialogo = [
		"The wind howls..."
	]
	
	text_box.get_node("Text Box/RichTextLabel").set_global_position(
		Vector2(23 ,23)
	)
	
	
	add_child(text_box)

	text_box.set_global_position(Vector2(320, 400))


func _button_Pressed(name):
	print(name)
