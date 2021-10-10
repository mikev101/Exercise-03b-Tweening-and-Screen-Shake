extends AnimatedSprite

func _ready():
	play()
	z_index = 11

func _on_Explosion_animation_finished():
	queue_free()
