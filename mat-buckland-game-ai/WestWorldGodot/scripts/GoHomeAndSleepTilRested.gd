class_name GoHomeAndSleepTilRested extends State

static var _instance: GoHomeAndSleepTilRested = null

var entityName: EntityNames
var messageDispatcher: MessageDispatcher = MessageDispatcher.instance()

static func instance()->GoHomeAndSleepTilRested:
	if(!_instance):
		_instance = GoHomeAndSleepTilRested.new()
	return _instance
	
func enter(miner:Miner)->void:
	if(miner.m_location != Location.location_type.shack):
		print("\n", EntityNames.GetNameOfEntity(miner.ID()), ": Walkin' home")
		miner.ChangeLocation(Location.location_type.shack)
	messageDispatcher.DispatchMessage(miner.ID(), EntityNames.ent_Elsa, Message.message_type.msg_HiHoneyImHome, 0.0, null)
	
	
func execute(miner:Miner)->void:
	miner.Sleep()
	
	print("\n", EntityNames.GetNameOfEntity(miner.ID()), ": ZZZ...")
	
	if(miner.m_iFatigue <= 0):
		miner.m_stateMachine.ChangeState(EnterGoldMineAndDigForNugget.instance())
	
func exit(miner:Miner)->void:
	print("\n", EntityNames.GetNameOfEntity(miner.ID()), ": What a God-darn fantastic nap! Time to find more gold")

func OnMessage(miner:BaseGameEntity, telegram:Telegram)->bool:
	match telegram.msg:
		Message.message_type.msg_StewReady:
			print("\nMessage received by ", EntityNames.GetNameOfEntity(miner.ID()), " at time: ", Time.get_ticks_msec() / 1000)
			print("\n", EntityNames.GetNameOfEntity(miner.ID()), ": Okay hun, ahm a-comin'!")
			
			miner.m_stateMachine.ChangeState(EatStew.instance())
			return true
		_:
			return false
