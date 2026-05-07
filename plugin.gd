@tool
extends EditorPlugin

const AUTOLOAD_NAME = "UrlParser"
const SCRIPT_PATH = "res://addons/godot-urlparser/urlparser.gd"

func _enter_tree():
    if not ProjectSettings.has_setting("autoload/" + AUTOLOAD_NAME):
        add_autoload_singleton(AUTOLOAD_NAME, SCRIPT_PATH)
        ProjectSettings.save()
        print("OpenMinerva URL Parser added to Globals.")

func _exit_tree():
    if ProjectSettings.has_setting("autoload/" + AUTOLOAD_NAME):
        remove_autoload_singleton(AUTOLOAD_NAME)
        ProjectSettings.save()
        print("OpenMinerva URL Parser removed from Globals.")
