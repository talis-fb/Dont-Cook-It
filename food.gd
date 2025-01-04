class_name Food
extends Node

@export var ingredients: Array[Ingredient] = []

func get_texture() -> Texture2D:
	if ingredients.size() == 1:
		return ingredients[0].get_texture()
	elif ingredients.size() > 1:
		return load("res://icon.svg")
	else:
		return null

func get_tasty() -> int:
	var sum = 0
	for el in ingredients:
		sum += el.get_tasty()
	return sum

func combine(new_food: Food):
	self.ingredients.append_array(new_food.ingredients)

func clear():
	ingredients.clear()
