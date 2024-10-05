extends Node

@export_category("Prefabs")
@export var starsPrefab : PackedScene

@export_category("Configuration")
@export var rstars : float
@export var amount : int



func _ready() -> void:
	var stars_param = []
	for i in amount:
		var param = {
			"phi" : randf_range(0.0, PI),
			"theta" : randf_range(0.0, TAU),
			"distance" : randf_range(0.5,100)
		}
		stars_param.append(param)
	
	_generate_stars(stars_param)


func _generate_stars(stars_param:Array) -> void:
	for param in stars_param:
		var star = starsPrefab.instantiate()
		
		star.transform.origin = _spherical_to_cartesian(
			rstars,
			param["theta"],
			param["phi"]
		)
		
		get_tree().root.add_child.call_deferred(star)


func _spherical_to_cartesian(radius: float, theta: float, phi: float) -> Vector3:
	var x = radius * sin(phi) * cos(theta)
	var y = radius * sin(phi) * sin(theta)
	var z = radius * cos(phi)
	return Vector3(x, y, z)
