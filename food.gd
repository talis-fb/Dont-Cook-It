class_name Food
extends Node

@export var ingredients: Array[Ingredient] = []

func get_texture() -> Texture2D:
	if ingredients.size() == 1:
		return ingredients[0].get_texture()
	elif ingredients.size() > 1:
		return preload("res://resources/sprites/icon.svg")
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

func clone() -> Food:
	var cloned_ingredients: Array[Ingredient] = []
	for el: Ingredient in self.ingredients:
		cloned_ingredients.append(el.clone())
		
	var new_food := Food.new()
	new_food.ingredients.append_array(cloned_ingredients)
	return new_food
