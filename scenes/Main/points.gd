extends Node2D

@export var points: int = 0

func _process(delta: float) -> void:
	$Label.text = str(points)
	
func _on_area_comandas_food_delivered(food: Food) -> void:
	var points_made = 0
	for ingredient in food.ingredients:
		points_made += ingredient.get_tasty()
	
	points += points_made
	
