#comanda
extends Node2D

signal dropped(food: Food)

@export var _requested_food: Food

func _ready() -> void:
	# Configurar elementos visuais aleatórios
	var opcoes = [
		{"texto": "vegano", "cor": Color.DARK_GREEN},
		{"texto": "lactose", "cor": Color.GOLD},
		{"texto": "colesterol", "cor": Color.HOT_PINK}
	]
	
	var escolha = opcoes.pick_random()
	
	# Aplicar configurações
	$Label.text = escolha["texto"]
	$Polygon2D.color = escolha["cor"]
	
	# Configurar componentes
	$Dropable.setup()
	$ShowOnHoverDrop.setup()

func _on_dropable_dropped(food: Food) -> void:
	dropped.emit(food)
	print("Command entregue!")
	self.queue_free()
