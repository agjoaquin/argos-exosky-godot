extends SubViewportContainer
@onready var sub_viewport: SubViewport = $SubViewport
@onready var camera_3d: Camera3D = $SubViewport/Camera3D


func get_texture():
	return sub_viewport.get_texture()


func set_camera_position(position : Vector3):
	camera_3d.position = position
