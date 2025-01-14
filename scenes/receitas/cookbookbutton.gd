extends TextureButton

@onready var janela_receita = $"../Janela_receita"

func _on_pressed() -> void:
	print('oi')
	janela_receita.visible = true
