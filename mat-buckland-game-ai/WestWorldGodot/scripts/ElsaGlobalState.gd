class_name ElsaGlobalState extends State

static var _instance:ElsaGlobalState = null

static func instance()->ElsaGlobalState:
	if(!_instance):
		_instance = ElsaGlobalState.new()
	return _instance

func execute(elsa:Elsa)->void:
	elsa.el_natureCall += 1

func OnMessage(wife:BaseGameEntity, telegram:Telegram)->bool:
	match(telegram.msg):
		Message.message_type.msg_HiHoneyImHome:
			print("\nMessage handled by ", EntityManager.instance().GetEntityFromID(wife.ID()),
			" at time: ", Time.get_ticks_msec()/100)
			
			print("\n", EntityManager.instance().GetEntityFromID(wife.ID()), "\n: Hi honey. Let me make you some of mah country stew")
			wife.el_stateMachine.ChangeState(CookStew.instance())
			return true
		_:
			return false
