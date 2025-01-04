class_name IngredientStats
extends Resource

@export var name: String
@export var texture: Texture2D

# Sabor (base da pontuação)
@export var raw_tasty: int

# Informações nutricional
@export var calories: int
@export var fat: int
@export var carbohydrate: int
@export var sugar: int
@export var protein: int
@export var fibres: int
@export var has_lactose: bool
@export var has_gluten: bool

func to_food_entity() -> Food:
	var ingredient = Ingredient.new()
	ingredient.set_ingredient_stats(self)
	var food = Food.new()
	food.ingredients.append(ingredient)
	return food
