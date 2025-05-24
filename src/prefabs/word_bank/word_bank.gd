extends Control
@export var consonant_container : HFlowContainer
@export var consonant_assembler : Node
@export var vowel_container : HFlowContainer
@export var vowel_assembler : Node
@export var total_container : HFlowContainer
@export var total_assembler : Node
@export var split : bool
@export var scale_items : float = 1.0

# Called when the node enters the scene tree for the first time.
func _ready():
	if split == true:
		total_container.visible = false
	consonant_assembler.scale_mult = scale_items
	vowel_assembler.scale_mult = scale_items
	total_assembler.scale_mult = scale_items
	pass # Replace with function body.

func get_scale_items() -> float:
	return scale_items

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
