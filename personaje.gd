extends CharacterBody2D

const ppm = 24
var direccion = Vector2()
var rapidez = 3 *ppm

@onready var _animated_sprite = $AnimatedSprite2D

func ready ():
	pass
	
func _input(event):
	direccion.x = Input.get_axis("ui_left", "ui_right")
	direccion.y = Input.get_axis("ui_up", "ui_down")
	direccion = direccion.normalized()
		
func _process(delta):
	if Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_down") :
		_animated_sprite.play("moving")
	else:
		_animated_sprite.stop()
	velocity = direccion * rapidez
	move_and_slide()
