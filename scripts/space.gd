extends SubViewportContainer
@onready var sub_viewport: SubViewport = $SubViewport


func get_texture():
	return sub_viewport.get_texture()
