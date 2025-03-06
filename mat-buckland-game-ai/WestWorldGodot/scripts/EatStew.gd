class_name EatStew extends State

static var _instance:EatStew = null

var entityName: EntityNames = EntityNames.new()

static func instance()->EatStew:
	if(!_instance):
		_instance = EatStew.new()
	return _instance
	
func enter(miner:Miner)->void:
	print("\n", EntityNames.GetNameOfEntity(miner.ID()), ": Smells reaaal goood, Elsa!")
	
func execute(miner:Miner)->void:
	print("\n", EntityNames.GetNameOfEntity(miner.ID()), ": Tastes real good too!")
	miner.m_stateMachine.RevertToPreviousState()
	
func exit(miner:Miner)->void:
	print("\n", EntityNames.GetNameOfEntity(miner.ID()), ": Thank ya li'l lady. Ah better get back to whatever ah wuz doin'")
	
