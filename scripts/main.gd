extends Node

@onready var stars_generator: StarsGenerator = %Stars
@onready var star_data_reader: StarDataReader = %StarDataReader

@onready var constellation_editor: SubViewportContainer = $ConstellationEditor
@onready var space: SubViewportContainer = $Space


var path = "res://Kepler-1996-C.txt"

func _ready() -> void:
	# Leo el archivo
	var params = star_data_reader.read_params_star_from_file(path)
	
	# Creo las estrellas
	stars_generator.generate(params)


func _on_activate_button_pressed() -> void:
	var texture = space.get_texture()
	constellation_editor.set_texture(texture)
	constellation_editor.show()


func _on_desactivate_button_pressed() -> void:
	constellation_editor.hide()
