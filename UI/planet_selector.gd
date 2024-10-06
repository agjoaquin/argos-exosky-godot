extends VBoxContainer

@onready var label: Label = $HBoxContainer/Label

signal set_planet(path)

var path_data = "res://data/"
var paths = []
var index : int = 0

func _ready():
	_read_files_in_directory(path_data)
	call_deferred("_update_text",paths[0])


func _read_files_in_directory(directory_path: String) -> void:
	var dir = DirAccess.open(directory_path)
	
	if dir:
		dir.list_dir_begin()  # Inicia la lectura del directorio
		
		var file_name = dir.get_next()
		
		while file_name != "":
			if dir.current_is_dir() == false:  # Asegúrate de que no sea un directorio, sino un archivo
				paths.append(file_name)
				
			file_name = dir.get_next()  # Avanza al siguiente archivo o directorio
		
		dir.list_dir_end()  # Finaliza la lectura del directorio
	else:
		print("No se pudo acceder al directorio:", directory_path)

func _update_text(text:String):
	label.text = text.get_basename()


func _on_button_1_pressed() -> void:
	if index == 0:
		index = paths.size() - 1
	
	else:
		index -= 1
	
	_update_text(paths[index])


func _on_button_2_pressed() -> void:
	if index == paths.size() - 1:
		index = 0
	
	else:
		index += 1
	
	_update_text(paths[index])


func _on_button_pressed() -> void:
	var path = path_data + paths[index] 
	set_planet.emit(path)
