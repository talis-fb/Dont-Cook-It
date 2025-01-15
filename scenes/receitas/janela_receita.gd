extends Control
# Referências aos nodes recipes e nutrition
@onready var recipes = $recipes
@onready var nutrition = $Nutrition

func trocar_pagina():
	# Alterna a visibilidade dos dois nodes
	recipes.visible = not recipes.visible
	nutrition.visible = not nutrition.visible
	
func fechar_janela():
	self.visible = false  # Oculta a janela
	
