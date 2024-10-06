extends SubViewportContainer

@onready var texture_rect: TextureRect = $SubViewport/TextureRect


func _on_visibility_changed() -> void:
	if not visible:
		return
	
	_capture_screen_to_texture()


func _capture_screen_to_texture():
	var texture = get_tree().root.get_texture()
	texture_rect.texture = texture
