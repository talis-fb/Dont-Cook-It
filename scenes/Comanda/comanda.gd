#comanda
extends Node2D

signal dropped(food: Food)

@export var _requested_food: Food
var restriction: String

func _ready() -> void:
	randomize_restriction()
	
	$Dropable.setup()
	$ShowOnHoverDrop.setup()

func randomize_restriction():
	var opcoes = [
		{"texto": "vegano", "cor": Color.DARK_GREEN, "restricao": "vegan"},
		{"texto": "lactose", "cor": Color.GOLD, "restricao": "lactose"},
		{"texto": "colesterol", "cor": Color.HOT_PINK, "restricao": "cholesterol"}
	]
	
	var escolha = opcoes.pick_random()
	restriction = escolha["restricao"]
	$Label.text = escolha["texto"]
	$Polygon2D.color = escolha["cor"]
	
func check_restrictions(food: Food) -> bool:
	for ingredient in food.ingredients:
		var stats = ingredient._ingredient_stats
		match restriction:
			"lactose":
				if stats.has_lactose:
					return false
			"cholesterol":
				if stats.fat > 15: # Ajuste o valor conforme necessário
					return false
			"vegan":
				if not stats.is_vegan:
					return false
	return true
	
func _on_dropable_dropped(food: Food) -> void:
	if not check_restrictions(food):
		ScoreManager.score -= 30
		print("Violação de restrição! -30 pontos")
		self.queue_free()
		return
	
	dropped.emit(food)
	print("Comanda entregue!")
	self.queue_free()
