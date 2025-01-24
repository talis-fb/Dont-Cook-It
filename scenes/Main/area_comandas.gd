extends Node2D

signal food_delivered(food: Food)

var quant_comanda = 0

func _ready() -> void:
	_on_timer_timeout()

func _on_timer_timeout() -> void:
	var new_comanda = preload("res://scenes/Comanda/comanda.tscn").instantiate()
	new_comanda.dropped.connect(food_delivered.emit)
	
	new_comanda.position = Vector2(40, 30 + quant_comanda * 80)
	quant_comanda += 1
	
	add_child(new_comanda)
