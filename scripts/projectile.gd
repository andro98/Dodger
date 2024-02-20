extends Area2D

class_name Projectile

var gravity_speed = 200
var gravity_rate = 10

func setup_rate(rate: float):
	gravity_rate = rate

func _physics_process(delta):
	global_position.y += gravity_speed * delta 
	gravity_speed += gravity_rate

func _on_body_entered(body):
	if body is Player:
		queue_free()
		body.took_damage()
