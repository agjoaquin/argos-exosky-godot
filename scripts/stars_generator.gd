class_name StarsGenerator extends StarManager

func generate(params : Array[ParamsStar]):
	var stars : Array[Star] = []
	for param in params:
		var star = Star.new(
			param.posicion,
			param.luminosidad,
			param.temperatura
		)
		stars.append(star)
	set_star_list(stars)
