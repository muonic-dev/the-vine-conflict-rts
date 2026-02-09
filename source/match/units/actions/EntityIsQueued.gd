extends "res://source/match/units/actions/Action.gd"

var entity_id = null
var unit_type = null
var time_total = null

@onready var _unit = Utils.NodeEx.find_parent_with_group(self , "units")


func _init(a_entity_id, a_unit_type, a_time_total):
	entity_id = a_entity_id
	unit_type = a_unit_type
	time_total = a_time_total


func _to_string():
	return "{0}({1})".format([ super (), unit_type])
