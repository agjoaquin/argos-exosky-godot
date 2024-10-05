extends Camera3D

@export var rotation_speed := 0.01
@export var zoom_speed := 1.0
@export var min_zoom := 1.0
@export var max_zoom := 30.0

var rotation_enabled := false

func _ready() -> void:
	# Habilitar la captura del mouse
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	# Detecta cuando se presiona el botón derecho del ratón
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT:
			if event.is_pressed():
				rotation_enabled = true
			else:
				rotation_enabled = false

	# Control de la rotación de la cámara cuando el botón derecho está presionado
	if event is InputEventMouseMotion and rotation_enabled:
		rotate_y(deg_to_rad(-event.relative.x * rotation_speed))
		var new_rotation_x = rotation_degrees.x - event.relative.y * rotation_speed
		# Limitar el rango de rotación en el eje X para evitar voltear la cámara
		rotation_degrees.x = clamp(new_rotation_x, -80, 80)

	# Zoom usando la rueda del ratón
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			set_fov(fov - zoom_speed)
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			set_fov(fov + zoom_speed)
		set_fov(clamp(fov, min_zoom, max_zoom))
