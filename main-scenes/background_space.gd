extends ParallaxBackground

export var scrolling_speed: float = 500

func _process(delta):
	scroll_offset.y += scrolling_speed * delta
