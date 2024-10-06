extends SubViewportContainer

@onready var texture_rect: TextureRect = %TextureRect


func capture_screen_to_texture():
	var texture = get_tree().root.get_texture()
	texture_rect.texture = texture
