class_name GoHomeAndSleepTilRested extends State

static var _instance: GoHomeAndSleepTilRested = null

var entityName: EntityNames

static func instance()->GoHomeAndSleepTilRested:
	if(!_instance):
		_instance = GoHomeAndSleepTilRested.new()
	return _instance
	
func enter(miner:Miner)->void:
	if(miner.m_location != Location.location_type.shack):
		miner.ChangeLocation(Location.location_type.shack)
	
	print("\n", EntityNames.GetNameOfEntity(miner.ID()), ": Walkin' home")
	
func execute(miner:Miner)->void:
	miner.Sleep()
	
	print("\n", EntityNames.GetNameOfEntity(miner.ID()), ": ZZZ...")
	
	if(miner.m_iFatigue <= 0):
		miner.m_stateMachine.ChangeState(EnterGoldMineAndDigForNugget.instance())
	
func exit(miner:Miner)->void:
	print("\n", EntityNames.GetNameOfEntity(miner.ID()), ": What a God-darn fantastic nap! Time to find more gold")
