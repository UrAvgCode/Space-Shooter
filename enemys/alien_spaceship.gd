extends Area2D

var plBullet := preload("res://projectiles/bullet_alien_spaceship.tscn")
var plExplosion := preload("res://animation/animation_alien_spaceship_explosion.tscn")

onready var fireDelayTimer := $fireDelayTimer
onready var player = get_tree().get_nodes_in_group("player")[0]

export var fireDelay: float = 3
export var life: float = 5
export var speed: float = 100
var dirm := Vector2(0, 0)

var dir := Vector2(0, 0)


func _process(delta):
	
	#get player direction
	dir.x = player.position.x - position.x
	dir.y = player.position.y - position.y
	rotation = dir.angle()-PI/2
	
	dirm = Vector2(cos(rotation-PI/2), -sin(rotation+PI/2))
	
	position.x -= dirm.x * speed * delta
	position.y -= dirm.y * speed * delta
	
	#check if shooting
	if fireDelayTimer.is_stopped():
		fireDelayTimer.start(fireDelay)
		
		var bullet := plBullet.instance()
		bullet.position = position
		bullet.position.y -= 30
		bullet.rotation_degrees = rotation_degrees
		
		get_tree().current_scene.add_child(bullet)
		


func damage(amount: int):
	life -= amount
	if life == 0:
		var explosion := plExplosion.instance()
		explosion.position = position
		get_tree().current_scene.add_child(explosion)
		queue_free()
