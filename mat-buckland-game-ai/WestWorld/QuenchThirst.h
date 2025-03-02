#include "State.h"
#include "Miner.h"
class QuenchThirst : public State<Miner>{
    private:
    QuenchThirst(){}

    public:
    static QuenchThirst* Instance();

    virtual void Enter(Miner* pMiner);
    virtual void Execute(Miner* pMiner);
    virtual void Exit(Miner* pMiner);
};