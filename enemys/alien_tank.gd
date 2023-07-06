extends Area2D

var plBullet := preload("res://projectiles/bullet_alien.tscn")
var plExplosion := preload("res://animation/animation_alien_explode.tscn")
onready var fireDelayTimer := $fireDelayTimer
onready var helmet := $Helmet

export var fireDelay: float = 2
var life: float = 4

func _process(delta):
	
	if fireDelayTimer.is_stopped():
		fireDelayTimer.start(fireDelay)
		
		var bullet := plBullet.instance()
		bullet.position = position
		bullet.position.y += 30
		get_tree().current_scene.add_child(bullet)
		
	position.y += 5 * delta
	
	if life == 4:
		helmet.play("suit_0")
	elif life == 3:
		helmet.play("suit_1")
	elif life == 2:
		helmet.play("suit_2")
	elif life == 1:
		helmet.play("suit_3")

#hit by bullet
func damage(_amount: int):
	life -= 1
	if life == 0:
		var explosion := plExplosion.instance()
		explosion.position = position
		get_tree().current_scene.add_child(explosion)
		queue_free()
		
