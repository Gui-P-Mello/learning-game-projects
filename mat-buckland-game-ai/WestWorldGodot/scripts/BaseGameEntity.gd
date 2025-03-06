class_name BaseGameEntity

var m_id: int
static var m_nextValidID: int

func setID(id: int) -> void:
	m_id = id

func _init(id: int): setID(id)

func ID()->int:
	return m_id

func Update() -> void:
	pass

func HandleMessage(telegram:Telegram)->bool:
	return false



