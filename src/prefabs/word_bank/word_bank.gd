extends Control
@export var consonant_container : HFlowContainer
@export var consonant_assembler : Node
@export var vowel_container : HFlowContainer
@export var vowel_assembler : Node
@export var total_container : HFlowContainer
@export var total_assembler : Node
@export var split : bool
@export var scale_items : float = 1.0

# Will this show a jumbled up version of the sounds?
@export var puzzle_mode : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if split == true:
		total_container.visible = false
		consonant_container.visible = true
		vowel_container.visible = true
	consonant_assembler.scale_mult = scale_items
	vowel_assembler.scale_mult = scale_items
	total_assembler.scale_mult = scale_items
	pass # Replace with function body.

func get_scale_items() -> float:
	return scale_items
func is_puzzle_mode() -> bool:
	return puzzle_mode

## Refreshes word bank to be the current state of the game
func add_puzzle():
	total_assembler.add_puzzle()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func remove(id):
	for child in total_container.get_children():
		if child.id == id:
			total_container.remove_child(child)
			child.queue_free()
