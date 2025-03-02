class_name StateMachine

var m_owner: BaseGameEntity
var m_curretState: State
var m_previousState: State
var m_globalState: State

func _init(owner: BaseGameEntity):
	m_owner = owner
	m_curretState = null
	m_previousState = null
	m_globalState = null
	
func SetCurrentState(s: State): m_curretState = s
func SetPreviousState(s: State): m_previousState = s
func SetGlobalState(s: State): m_globalState = s

func Update() -> void:
	if(m_globalState): m_globalState.execute(m_owner)
	if(m_curretState): m_curretState.execute(m_owner)
	
func ChangeState(newState: State)->void:
	assert(newState && "<ChangeState():State>: trying to change to a null state")
	m_curretState.exit(m_owner)
	m_previousState = m_curretState
	m_curretState = newState
	m_curretState.enter(m_owner)
	
func RevertToPreviousState()->void:
	m_curretState.exit(m_owner)
	m_curretState = m_previousState
	
func CurrentState()->State: return m_curretState
func PreviousState()->State: return m_previousState
func GlobalState()->State: return m_globalState
