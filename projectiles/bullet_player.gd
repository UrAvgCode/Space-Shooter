extends Area2D

export var speed: float = 800
var dir := Vector2(0, 0)

func _physics_process(delta):
	dir = Vector2(cos(rotation-PI/2), -sin(rotation+PI/2))
	
	position.x += dir.x * speed * delta
	position.y += dir.y * speed * delta

#delete bullets outside of the screen
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

#hit damageables
func _on_bullet_player_area_entered(area):
	if area.is_in_group("damageable"):
		area.damage(1)
		queue_free()
