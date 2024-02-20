extends Area2D

signal player_score

func _ready():
	global_position.y = get_viewport_rect().size.y + 200
	global_scale.x = get_viewport_rect().size.x * 2

func _on_area_entered(area):
	player_score.emit()
	area.queue_free()
