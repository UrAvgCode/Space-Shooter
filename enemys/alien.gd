extends Area2D

var plBullet := preload("res://projectiles/bullet_alien.tscn")
var plExplosion := preload("res://animation/animation_alien_explode.tscn")
onready var fireDelayTimer := $fireDelayTimer

export var fireDelay: float = 2

func _process(delta):
	
	if fireDelayTimer.is_stopped():
		fireDelayTimer.start(fireDelay)
		
		var bullet := plBullet.instance()
		bullet.position = position
		bullet.position.y += 30
		get_tree().current_scene.add_child(bullet)
		
	position.y += 5 * delta

#hit by bullet
func damage(_amount: int):
	var explosion := plExplosion.instance()
	explosion.position = position
	get_tree().current_scene.add_child(explosion)
	queue_free()
	
