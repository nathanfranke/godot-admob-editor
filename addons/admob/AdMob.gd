@tool
extends EditorPlugin

var AdMobConfigScene : Control

func _enter_tree():
	add_autoload_singleton("MobileAds", "res://addons/admob/scripts/MobileAds.gd")
	AdMobConfigScene = load("res://addons/admob/scenes/AdMobConfig.tscn").instantiate()
	get_editor_interface().get_editor_main_control().add_child(AdMobConfigScene)
	AdMobConfigScene.hide()

func _exit_tree():
	remove_autoload_singleton("MobileAds")
	get_editor_interface().get_editor_main_control().remove_child(AdMobConfigScene)
	AdMobConfigScene.queue_free()
	
func _has_main_screen():
	return true

func _make_visible(visible):
	AdMobConfigScene.visible = visible

func _get_plugin_name():
	return "AdMob"

func _get_plugin_icon():
	return load("res://addons/admob/assets/icon-15.png")
