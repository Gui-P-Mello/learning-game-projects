#include "State.h"
#include "Miner.h"
class MinerGlobalState: public State<Miner>{
    private:
    MinerGlobalState(){}

    public:
    static MinerGlobalState* Instance();

    virtual void Enter(Miner* pMiner);
    virtual void Execute(Miner* pMiner);
    virtual void Exit(Miner* pMiner);
};