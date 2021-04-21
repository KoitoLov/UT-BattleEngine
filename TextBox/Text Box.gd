extends Control

var dialogo = ["Text in battle"]

var pagina_dialogo = 0
var opcion_dialogo = 0
var pagina_terminada = false
var time = 0.090
onready var next_character = $RichTextLabel.visible_characters + 1
onready var current_character = $RichTextLabel.visible_characters + 1
onready var timer = get_node("Timer")

func _ready():
	start_dialog()
	
# warning-ignore:unused_argument
func _physics_process(delta):
	if pagina_terminada == true and Input.is_action_just_pressed('interact'):
		pagina_terminada = false
		pagina_dialogo += 1
		start_dialog()

		timer.one_shot = false
	elif pagina_terminada == false and Input.is_action_just_pressed("skip_dialog"):
		$RichTextLabel.visible_characters = dialogo[pagina_dialogo].length()
		timer.stop()
		pagina_terminada = true
		
	
#Empezar la pagina del dialogo	
func start_dialog():
	if pagina_dialogo < dialogo.size():
		$RichTextLabel.visible_characters = 0
		$RichTextLabel.bbcode_text = dialogo[pagina_dialogo]
		timer.set_wait_time(time)
		timer.start()
	else:
		queue_free()

#Printear el dialogo. Si termino todo el texto, detiene el timer.
func continue_dialog():
	if $RichTextLabel.visible_characters == dialogo[pagina_dialogo].length():
		timer.one_shot = true
		pagina_terminada = true
	else:
		if (
			dialogo[pagina_dialogo].count(
				" ", $RichTextLabel.visible_characters, $RichTextLabel.visible_characters + 1
				) < 1 
				
				and dialogo[pagina_dialogo].count(
					".", $RichTextLabel.visible_characters, $RichTextLabel.visible_characters + 1)
					< 1
					
				and dialogo[pagina_dialogo].count(
					")", $RichTextLabel.visible_characters, $RichTextLabel.visible_characters + 1)
					< 1
				
				and dialogo[pagina_dialogo].count(
					"(", $RichTextLabel.visible_characters, $RichTextLabel.visible_characters + 1)
					< 1
			):
			$AudioStreamPlayer.play()
		$RichTextLabel.visible_characters += 1





#Printear el siguiente caracter y playear el audio
func TimerTimeout():
	continue_dialog()

