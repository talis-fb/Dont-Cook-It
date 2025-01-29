extends Node2D

func _process(delta: float) -> void:
	$Label.text = str(ScoreManager.score)  # Usa o score do manager global
	
func _on_area_comandas_food_delivered(food: Food) -> void:
	var points_made = 0
	for ingredient in food.ingredients:
		points_made += ingredient.get_tasty()
	
	ScoreManager.score += points_made  # Modifica o score global
