extends MeshInstance

onready var tween := $Tween
onready var material := get_surface_material(0)


func _ready() -> void:
	material.set_shader_param("Dissolve_amount", -1)


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		dissolve()


func dissolve():
	visible = true
	tween.interpolate_method(
		self, "animate_dissolve", -1, 11, 6.5, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
	)
	tween.start()


func animate_dissolve(progress: float) -> void:
	material.set_shader_param("Dissolve_amount", progress)


func _on_Tween_tween_all_completed() -> void:
	visible = false
