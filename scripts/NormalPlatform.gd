extends Area2D

onready var sprite = $Sprite

var spring_path = "res://scenes/Spring.tscn"
const SPRING_CHANGE = 5

var sprite_half_width
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	connect("body_entered", self, "_on_body_entered")
	sprite_half_width = sprite.texture.get_size().x / 2 * scale.x
	if rand_range(0,100) > (100 - SPRING_CHANGE):
		var new_spring = load(spring_path).instance()
		add_child(new_spring)
		new_spring.position = Vector2(0, -new_spring.height)

func _on_body_entered(body):
	if body.name == "Player":
		if body.position.y < position.y:
			body.jump()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
