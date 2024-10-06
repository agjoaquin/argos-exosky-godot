extends SubViewportContainer

@onready var texture_rect: TextureRect = %TextureRect
@onready var sub_viewport: SubViewport = $SubViewport

var draw_active = false
var line = Line2D.new()

func _ready() -> void:
	
	texture_rect.add_child(line)

func set_texture(texture : Texture):
	texture_rect.texture = texture

func _input(event: InputEvent) -> void:
	if not draw_active:
		return
	if event is InputEventMouseButton:
		match event.button_index:
			MOUSE_BUTTON_LEFT:
					if event.pressed:
						print("event.position ",event.position)
						line.width = 2
						var color =  Color(0,0.4,3,0.5)
						line.default_color = color
						var lateralBarWidth = get_tree().root.size.x - sub_viewport.size.x
						print("lateralBarWidth ",lateralBarWidth)
						print("")
						var xCorrection = 02
						print("xCorrection ",xCorrection)

						if event.position.x-lateralBarWidth>xCorrection and event.position.y<600:
							line.add_point(Vector2(event.position.x-lateralBarWidth,event.position.y))
				#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED if event.pressed else Input.MOUSE_MODE_VISIBLE)
	
	

func _on_capture_button_pressed() -> void:
	# Asegúrate de que hay una textura en el TextureRect
	if texture_rect.texture:
		# Convertir la textura a una imagen
		var image: Image = sub_viewport.get_texture().get_image()
		
		# Asegúrate de que los datos de la imagen están disponibles
		if image:
			
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


func _on_draw_button_pressed() -> void:
	draw_active = !draw_active
	
	if not draw_active:
		line.clear_points()
