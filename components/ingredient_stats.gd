class_name IngredientStats
extends Resource

@export var name: String
@export var texture: Texture2D


# Sabor (base da pontuação)
@export var raw_tasty: int

# Pontos que definem o tasty real pelo valor de cozimento, a partir desses pontos 
#  é retirado uma função afim para cada intervalo que define os valores de tasty entre eles
#
#  Se assume que quando cooking é zero, o tasty seja o "raw_tasty"
#  (x,y) 
#    x = valor de "cooking"
#    y = valor real do "tasty"
@export var cooking_tasty: Array[Vector2]


# Informações nutricional
@export var calories: int
@export var fat: int
@export var carbohydrate: int
@export var sugar: int
@export var protein: int
@export var fibres: int
@export var has_lactose: bool
@export var has_gluten: bool
@export var is_vegan: bool = false
@export var cholesterol_level: int = 0

func to_food_entity() -> Food:
	var ingredient = Ingredient.new()
	ingredient.set_ingredient_stats(self)
	var food = Food.new()
	food.ingredients.append(ingredient)
	return food
