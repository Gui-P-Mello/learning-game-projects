class_name VisitBankAndDeposit extends State

static var _instance:VisitBankAndDeposit = null

var entityName: EntityNames = EntityNames.new()

static func instance()->VisitBankAndDeposit:
	if(!_instance):
		_instance = VisitBankAndDeposit.new()
	return _instance
	
func enter(miner:Miner)->void:
	if (miner.m_location != Location.location_type.bank):
		print("\n", EntityNames.GetNameOfEntity(miner.ID()), ": Goin' to the bank. Yes siree")
		miner.ChangeLocation(Location.location_type.bank)
func execute(miner:Miner)->void:
	miner.Deposit()
	
	print("\n", EntityNames.GetNameOfEntity(miner.ID()), " Depositin’ gold. Total savings now: ", miner.m_iMoneyInBank)
	if(miner.m_iMoneyInBank >= miner.m_iComfortLevel):
		miner.m_stateMachine.ChangeState(GoHomeAndSleepTilRested.instance())
	else:
		miner.m_stateMachine.ChangeState(EnterGoldMineAndDigForNugget.instance())

func exit(miner:Miner)->void:
	print("\n", EntityNames.GetNameOfEntity(miner.ID()), ": Leavin' the bank")
