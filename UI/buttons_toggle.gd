extends TextureButton

@export var texture1 : Texture
@export var texture2 : Texture

var texture_id = 1

func _ready() -> void:
	texture_normal = texture1

func _on_pressed() -> void:
	if texture_id == 1:
		texture_normal = texture2
		texture_id = 2
	
	else:
		texture_id = 1
		texture_normal = texture1
