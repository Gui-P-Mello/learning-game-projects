class_name Miner extends BaseGameEntity

var m_stateMachine: StateMachine
var m_location: Location.location_type

var m_iGoldCarried: int
var m_iMoneyInBank: int
var m_iThirst: int
var m_iThirstLevel: int = 10
var m_iFatigue: int
var m_iMaxNuggets: int = 5
var m_iComfortLevel: int = 10

func _init(id: int):
	m_location = Location.location_type.shack
	m_iGoldCarried = 0
	m_iMoneyInBank = 0
	m_iThirst = 0
	m_iFatigue = 0
	m_stateMachine = StateMachine.new(self)
	m_stateMachine.m_curretState = GoHomeAndSleepTilRested.instance()
	m_stateMachine.m_globalState = MinerGlobalState.instance()
		
func Update()->void:
	m_iThirst+=1
	m_stateMachine.Update()

func ChangeLocation(newLocation: Location.location_type)->void:	m_location = newLocation

func AddToGoldCarried(val:int)->void:	m_iGoldCarried += val
func PocketsFull()->bool: return m_iGoldCarried >= m_iMaxNuggets

func Thirsty()->bool: return true if m_iThirst >= m_iThirstLevel else false
func Drink()->void: m_iThirst = 0

func Deposit()->void: 
	m_iMoneyInBank += m_iGoldCarried
	m_iGoldCarried = 0

func IncreaseFatigue()->void: m_iFatigue+=1
func Sleep()->void: m_iFatigue -= 1

func HandleMessage(telegram:Telegram)->bool:
	return m_stateMachine.HandleMessage(telegram)
