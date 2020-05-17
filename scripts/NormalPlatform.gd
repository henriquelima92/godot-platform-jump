extends Area2D

onready var sprite = $Sprite
var sprite_half_width
# Called when the node enters the scene tree for the first time.
func _ready():
	sprite_half_width = sprite.texture.get_size().x / 2 * scale.x
	connect("body_entered", self, "_on_body_entered")
	pass # Replace with function body.

func _on_body_entered(body):
	if body.name == "Player":
		if body.position.y < position.y:
			body.jump()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
