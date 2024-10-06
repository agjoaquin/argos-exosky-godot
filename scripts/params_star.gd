class_name ParamsStar

var posicion : Vector3
var luminosidad : float
var temperatura : float

func _init(dict: Dictionary):
	self.posicion = dict.posicion
	self.luminosidad = dict.luminosidad
	self.temperatura = dict.temperatura
