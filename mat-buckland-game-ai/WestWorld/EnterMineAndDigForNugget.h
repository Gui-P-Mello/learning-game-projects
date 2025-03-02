#include "State.h"
#include "Miner.h"

class EnterTheGoldMineAndDigForNugget:public State<Miner>{
    private:
    EnterTheGoldMineAndDigForNugget(){}

    public:
    static EnterTheGoldMineAndDigForNugget* Instance();

    virtual void Enter(Miner* pMiner);
    virtual void Execute(Miner* pMiner);
    virtual void Exit(Miner* pMiner);
};