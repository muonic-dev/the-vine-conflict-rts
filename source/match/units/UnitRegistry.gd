extends Node

var _next_id := 1
var units := {}  # int -> Unit
var unit_id: int


func _ready():
    unit_id = UnitRegistry.register(self)

    MatchSignals.unit_died.connect(unregister)

func register(unit) -> int:
    var id := _next_id
    _next_id += 1
    units[id] = unit
    return id

func get_unit(id: int):
    return units.get(id, null)

## has to be called on unit death
func unregister(_unit):
    units.erase(_unit.id)
