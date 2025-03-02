class_name DoHousework extends State

static var _instance: DoHousework = null

static func instance()->DoHousework:
	if(!_instance):
		_instance = DoHousework.new()
	return _instance
	
func enter(elsa:Elsa)->void:
	print("\n", EntityNames.GetNameOfEntity(elsa.ID()), ": Makin' the bed")

func execute(elsa:Elsa)->void:
	print("\n", EntityNames.GetNameOfEntity(elsa.ID()), ": Moppin' the floor")
	if(elsa.el_natureCall>=elsa.el_natureCallLevel):
		elsa.el_stateMachine.ChangeState(VisitBathroom.instance())
	

func exit(elsa:Elsa)->void:
	pass
