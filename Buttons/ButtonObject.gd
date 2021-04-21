tool
extends Node2D

onready var soul = preload("res://Player/Soul.tscn")

export var ButtonType = "fight"

func _ready():
	$AnimatedSprite.animation = ButtonType
