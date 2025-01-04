extends Sprite2D

@export var food: Food

func _process(delta: float) -> void:
	self.texture = food.get_texture()
	$Label.text = str(food.ingredients.size())
	$Tasty.text = str(food.get_tasty())

func _on_draggable_start(food: Food) -> void:
	modulate = Color(1, 1, 1, 0.5)

func _on_draggable_end(food: Food) -> void:
	modulate = Color(1, 1, 1)
