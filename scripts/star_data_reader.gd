class_name StarDataReader extends Node

const SCALE = 0.5

func read_params_star_from_file(text_file_path):
	var stars : Array[ParamsStar] = []  # Lista para almacenar todas las estrellas
	var file = FileAccess.open(text_file_path, FileAccess.READ)
	if file:
		# Leer línea por línea del archivo
		var iterador = 1
		while not file.eof_reached():
			var content = file.get_line().strip_edges()  # Lee la línea actual y elimina espacios innecesarios
			
			# Si la línea no está vacía
			if content != "":
				#if iterador == 1 : 
					#print("Linea ",iterador," ",content)
					#var values = content.split(",")
					#var vectorcam = SCALE*Vector3(values[0].to_float(), values[1].to_float(), values[2].to_float())
					#iterador = iterador + 1
					
				if true:
					var values = content.split(",")  # Divide la línea en elementos usando la coma como delimitador
					var vector = SCALE*Vector3(values[0].to_float(), values[1].to_float(), values[2].to_float())
					# Crear un nuevo objeto ParamsStar
					var star = ParamsStar.new({posicion = vector,luminosidad = values[3].to_float(),temperatura = values[4].to_float(),})           
					# Agregar la estrella a la lista
					stars.append(star)
				
		file.close()
	else:
		print("Archivo no encontrado: ", text_file_path)
		
	return stars  # Devuelve la lista de objetos ParamsStar
	
func get_cam_pos(text_file_path):
	var file = FileAccess.open(text_file_path, FileAccess.READ)
	if file:
		# Leer línea por línea del archivo
		var iterador = 1
		while not file.eof_reached():
			var content = file.get_line().strip_edges()  # Lee la línea actual y elimina espacios innecesarios
			
			# Si la línea no está vacía
			if content != "":
				if iterador == 1 : 
					print("Linea ",iterador," ",content)
					var values = content.split(",")
					var vectorcam = SCALE*Vector3(values[0].to_float(), values[1].to_float(), values[2].to_float())
					return vectorcam
					iterador = iterador + 1
					
				else:
					return Vector3.ZERO

				
		file.close()
#vuelve la lista de objetos ParamsStar
