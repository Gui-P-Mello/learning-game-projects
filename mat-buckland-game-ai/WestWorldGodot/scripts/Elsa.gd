class_name Elsa extends BaseGameEntity

var el_natureCall: int
var el_natureCallLevel: int
var el_stateMachine: StateMachine
var _cooking: bool

func _init(id:int):
	el_natureCall = 0
	el_natureCallLevel = 20
	el_stateMachine = StateMachine.new(self)	
	el_stateMachine.m_curretState = DoHousework.instance()
	el_stateMachine.m_globalState = ElsaGlobalState.instance()
	m_id = id
	_cooking = false
	
func Update()->void:
	el_stateMachine.Update()

func Cooking()->bool:
	return _cooking

func SetCooking(val:bool)->void:
	_cooking = val

func HandleMessage(telegram:Telegram)->bool:
	return el_stateMachine.HandleMessage(telegram)
