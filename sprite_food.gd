extends Sprite2D

@export var food: Food

func _process(delta: float) -> void:
	$Label.text = str(food.ingredients.size())

func _on_draggable_start(food: Food) -> void:
	modulate = Color(1, 1, 1, 0.5)

func _on_draggable_finish(food: Food) -> void:
	modulate = Color(1, 1, 1)

func _on_draggable_cancel(food: Food) -> void:
	modulate = Color(1, 1, 1)
