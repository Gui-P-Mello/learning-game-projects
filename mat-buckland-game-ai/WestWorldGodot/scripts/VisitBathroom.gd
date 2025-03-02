class_name VisitBathroom extends State

static var _intance:VisitBathroom = null

static func instance()->VisitBathroom:
	if(!_intance):
		_intance = VisitBathroom.new()
	return _intance

func enter(elsa:Elsa)->void:
	print("\n", EntityNames.GetNameOfEntity(elsa.ID()), ": Walkin' to the can. Need to powda mah pretty li'l nose")

func execute(elsa:Elsa)->void:
	elsa.el_natureCall = 0
	print("\n", EntityNames.GetNameOfEntity(elsa.ID()), ": Ahhhhhh! Sweet relief!")
	elsa.el_stateMachine.RevertToPreviousState()

func exit(elsa:Elsa)->void:
	print("\n", EntityNames.GetNameOfEntity(elsa.ID()), ": Leavin' the john")
