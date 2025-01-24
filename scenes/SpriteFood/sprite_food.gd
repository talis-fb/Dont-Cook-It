#sprite_food
extends Sprite2D

@export var food: Food

func _process(delta: float) -> void:
	self.texture = food.get_texture()
	
	$Label.text = str(food.ingredients.size())
	if food.ingredients.size() > 0:
		$Label.text += " / 5"
		
	$Tasty.text = str(food.get_tasty())
	
	var cooking_values: Array[int] = []
	var ingredients_tasty: Array[int] = []
	
	for el: Ingredient in food.ingredients:
		cooking_values.append(el._cooking)
		ingredients_tasty.append(el.get_tasty())
	
	var has_some_cooking_ingredient: bool = cooking_values.any(func(v): return v)
	
	$Cooking.visible = has_some_cooking_ingredient
	$TastyList.visible = has_some_cooking_ingredient
	
	if has_some_cooking_ingredient:
		$Cooking.text = str(cooking_values)
		$TastyList.text = str(ingredients_tasty)

func _on_draggable_start(food: Food) -> void:
	modulate = Color(1, 1, 1, 0.5)

func _on_draggable_end(food: Food) -> void:
	modulate = Color(1, 1, 1)
