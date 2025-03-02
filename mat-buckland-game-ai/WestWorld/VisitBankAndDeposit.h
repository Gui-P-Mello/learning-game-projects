#include "State.h"

class VisitBankAndDeposit : public State<Miner>{
    private:
    VisitBankAndDeposit(){}

    public:
    static VisitBankAndDeposit* Instance();

    virtual void Enter(Miner* pMiner);
    virtual void Execute(Miner* pMiner);
    virtual void Exit(Miner* pMiner);
};