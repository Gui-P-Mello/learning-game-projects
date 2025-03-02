#include "State.h"
#include "Miner.h"

class GoHomeAndSleepTilRested : public State<Miner>{
    private:
    GoHomeAndSleepTilRested(){}

    public:
    static GoHomeAndSleepTilRested* Instance();

    virtual void Enter(Miner* pMiner);
    virtual void Execute(Miner* pMiner);
    virtual void Exit(Miner* pMiner);
};