extends Node2D

var quant_comanda = 0

func _on_timer_timeout() -> void:
	var new_comanda = preload("res://scenes/comanda.tscn").instantiate()
	
	new_comanda.position = Vector2(-26.24, 5 + quant_comanda * 80)
	quant_comanda += 1
	
	add_child(new_comanda)
