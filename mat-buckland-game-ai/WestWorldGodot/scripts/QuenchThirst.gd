class_name QuenchThirst extends State

static var _instance: QuenchThirst = null

static func instance()->QuenchThirst:
	if(!_instance):
		_instance = QuenchThirst.new()
	return _instance
	
var entityNames: EntityNames

func enter(miner:Miner)->void:
	if(miner.m_location !=  Location.location_type.saloon):
		print("\n", EntityNames.GetNameOfEntity(miner.ID()), "Boy, ah sure is thusty! Walkin' to the saloon")
		miner.m_location = Location.location_type.saloon

func execute(miner:Miner)->void:
	miner.Drink()
	print("\n", EntityNames.GetNameOfEntity(miner.ID()),"That's mighty fine sippin liquor")
	
	miner.m_stateMachine.ChangeState(EnterGoldMineAndDigForNugget.instance())
	
func exit(miner:Miner)->void:
	print("\n", EntityNames.GetNameOfEntity(miner.ID()), "Leavin' the saloon, feelin' good")
