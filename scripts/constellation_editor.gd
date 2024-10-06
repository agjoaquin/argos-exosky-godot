extends SubViewportContainer

@onready var texture_rect: TextureRect = %TextureRect


func set_texture(texture : Texture):
	texture_rect.texture = texture


func _on_capture_button_pressed() -> void:
	# Asegúrate de que hay una textura en el TextureRect
	if texture_rect.texture:
		# Convertir la textura a una imagen
		var image: Image = texture_rect.texture.get_image()
		
		# Asegúrate de que los datos de la imagen están disponibles
		if image:
			image.flip_y()  # Voltea la imagen verticalmente si es necesario
			
			# Guardar la imagen como un PNG
			var file_path = "res://captures/capture.png" # Ruta donde se guardará el archivo
			var error = image.save_png(file_path)  # Guardar la imagen como PNG
			
			if error == OK:
				print("Imagen guardada en: ", file_path)
			else:
				print("Error al guardar la imagen: ", error)
		else:
			print("No se pudo obtener la imagen de la textura.")
	else:
		print("No hay textura en el TextureRect.")
