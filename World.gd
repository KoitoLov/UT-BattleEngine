extends Node2D

#Load the BattleBox
const TextBox = preload("res://TextBox/TextBoxInBattle.tscn")
const ActingMenu = preload("res://TextBox/ActingMenu.tscn")
const Buttons = preload("res://Buttons/ButtonScene.tscn")

onready var acting_menu = ActingMenu.instance()
onready var text_box = TextBox.instance()

signal menu_response

var on_menu : bool = false

func _ready():
	var buttons_instance = Buttons.instance()
	
	load_textbox()
	
	
func _physics_process(delta):
	if Input.is_action_just_pressed("escape"):
		get_tree().quit()
	
	
func load_textbox():
	#Hacer la BattleBox una instance
	var text_box = TextBox.instance()
	#Instancear la BattleBox
	text_box.get_node("Text Box").time = 0.04
	
	text_box.get_node("Text Box").dialogo = [
		"ASGORE attacks!"
	]	
	
	add_child(text_box)

	text_box.set_global_position(Vector2(320, 412)) #320 400
	
func _button_Pressed(name, can_move):
	
	if name == "Fight":
		print("Fighting")

	if name == "Act":
		load_acting_menu()
		remove_child(text_box)
		on_menu = true
		get_node("Buttons").can_move = false
	
	if name == "Item":
		print("Item")
	
	if name == "Mercy":
		print("Mercy")
	
	
	
func load_acting_menu():
	
	add_child(acting_menu)
	acting_menu.set_global_position(Vector2(320, 412))
	

func response_menu_Goback():
	if on_menu:
		load_textbox()
		remove_child(acting_menu)
		on_menu = false
		get_node("Buttons").can_move = true
		
		
		
		
		
func _soul_Reposition(new_position : Vector2, can_move):
	get_node("Soul").position = new_position


