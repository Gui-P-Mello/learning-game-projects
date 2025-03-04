class_name EntityManager extends Node

static var _instance: EntityManager = null

static func instance()->EntityManager:
	if(!_instance):
		_instance = EntityManager.new()
	return _instance
	
var entities:Dictionary = {}

func RegisterEntity(entity:BaseGameEntity)->void:
	entities[entity.ID()] = entity
	
func GetEntityFronID(id:int)->BaseGameEntity:
	return entities.get(id, null)
