class_name EnterGoldMineAndDigForNugget extends State

static var _instance:EnterGoldMineAndDigForNugget = null

var entityName: EntityNames = EntityNames.new()

static func instance()->EnterGoldMineAndDigForNugget:
	if(!_instance):
		_instance = EnterGoldMineAndDigForNugget.new()
	return _instance
		
func enter(miner:Miner)->void:
	if (miner.m_location != Location.location_type.goldmine):
		print("\n", EntityNames.GetNameOfEntity(miner.ID()), ": Walkin' to the gold mine")
		miner.ChangeLocation(Location.location_type.goldmine)
		
func execute(miner:Miner)->void:
	miner.AddToGoldCarried(1)
	miner.IncreaseFatigue()
	
	print("\n", EntityNames.GetNameOfEntity(miner.ID()), ": Pickin' up a nugget")
	
	if(miner.PocketsFull()): 
		miner.m_stateMachine.ChangeState(VisitBankAndDeposit.instance())
	
	if(miner.Thirsty()):
		miner.m_stateMachine.ChangeState(QuenchThirst.instance())

func exit(miner: Miner):
	print("\n", EntityNames.GetNameOfEntity(miner.ID()), ": Ah'm livin' the gold mine with mah pockets full o' sweet gold")
