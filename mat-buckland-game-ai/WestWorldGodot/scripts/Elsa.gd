class_name Elsa extends BaseGameEntity

var el_natureCall: int
var el_natureCallLevel: int
var el_stateMachine: StateMachine

func _init(id:int):
	el_natureCall = 0
	el_natureCallLevel = 20
	el_stateMachine = StateMachine.new(self)	
	el_stateMachine.m_curretState = DoHousework.instance()
	el_stateMachine.m_globalState = ElsaGlobalState.instance()
	m_id = id
	
func Update():
	el_stateMachine.Update()
