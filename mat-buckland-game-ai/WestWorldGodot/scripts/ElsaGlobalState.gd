class_name ElsaGlobalState extends State

static var _instance:ElsaGlobalState = null

static func instance()->ElsaGlobalState:
	if(!_instance):
		_instance = ElsaGlobalState.new()
	return _instance

func execute(elsa:Elsa)->void:
	elsa.el_natureCall += 1
