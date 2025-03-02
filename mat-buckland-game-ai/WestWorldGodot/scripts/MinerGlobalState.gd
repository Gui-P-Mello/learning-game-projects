class_name MinerGlobalState extends State

static var _instance: MinerGlobalState = null

static func instance()->MinerGlobalState:
	if(!_instance):
		_instance = MinerGlobalState.new()
	return _instance

func enter(entity)->void:
	pass
func execute(entity)->void:
	pass
	
func exit(entity)->void:
	pass

