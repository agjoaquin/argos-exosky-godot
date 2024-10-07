extends SubViewportContainer

@onready var texture_rect: TextureRect = %TextureRect
@onready var sub_viewport: SubViewport = $SubViewport

var draw_active = false
var line = Line2D.new()

func _ready() -> void:
	line.width = 2
	var color =  Color(0,0.4,3,0.5)
	line.default_color = color
	texture_rect.add_child(line)

func set_texture(texture : Texture):
	texture_rect.texture = texture


func _on_capture_button_pressed() -> void:
	# Asegúrate de que hay una textura en el TextureRect
	if texture_rect.texture:
		# Convertir la textura a una imagen
		var image: Image = sub_viewport.get_texture().get_image()
		
		# Asegúrate de que los datos de la imagen están disponibles
		if image:
			
			# Guardar la imagen como un PNG
			var file_path = "capture.png" # Ruta donde se guardará el archivo
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


func _on_texture_rect_gui_input(event: InputEvent) -> void:
	if not draw_active:
		return
	
	if event is InputEventMouseButton and event.pressed:
		match event.button_index:
			MOUSE_BUTTON_LEFT:
				line.add_point(event.position)
			MOUSE_BUTTON_RIGHT:
				line.remove_point(line.get_point_count() - 1)
