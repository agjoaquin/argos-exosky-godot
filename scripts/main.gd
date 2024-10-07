extends Node

@onready var stars_generator: StarsGenerator = %Stars
@onready var star_data_reader: StarDataReader = %StarDataReader

@onready var constellation_editor: SubViewportContainer = $ConstellationEditor
@onready var space: SubViewportContainer = $Space


func _on_buttons_toggle_pressed() -> void:
	if constellation_editor.visible : 
		constellation_editor.hide()
	
	else:
		var texture = space.get_texture()
		constellation_editor.set_texture(texture)
		constellation_editor.show()


func _on_planet_selector_set_planet(path: Variant) -> void:
	# Leo el archivo
	var params = star_data_reader.read_params_star_from_file(path)
	var camPos = star_data_reader.read_cam_pos(path)
	
	# Creo las estrellas
	stars_generator.generate(params)
