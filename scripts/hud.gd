extends Control

@onready var score_label = $Score

func set_score(score):
	score_label.text = str(score)
