extends SubViewportContainer

@onready var texture_rect: TextureRect = %TextureRect


func set_texture(texture : Texture):
	texture_rect.texture = texture
