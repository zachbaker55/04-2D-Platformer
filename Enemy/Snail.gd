extends KinematicBody2D

var basespeed = 30
var speed = basespeed
var spawnposition = Vector2.ZERO
var dir = 1 #0 is left, 1 is right


func _ready():
	spawnposition = position
	
func _physics_process(_delta):
	var velocity = Vector2(speed,0)
	move_and_slide(velocity, Vector2(0,0))
	if ($Right.is_colliding() and dir == 1):
		dir = 0
		$AnimatedSprite.flip_h = true
		speed = basespeed *-1
				
	if ($Left.is_colliding() and dir == 0):
		dir = 1
		$AnimatedSprite.flip_h = false
		speed = basespeed
	
	
	
func _on_Area2D_body_entered(body):
	if body.name == 'Player':
		body.die()
		position = spawnposition
		dir = 1
		$AnimatedSprite.flip_h = false
		speed = basespeed
