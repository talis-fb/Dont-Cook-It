# ScoreManager.gd (singleton auto-load)
extends Node

var score: int = 0:
	set(value):
		score = max(value, 0) # Impede pontuação negativa
		print("Pontuação atual: ", score)

func reset():
	score = 0
