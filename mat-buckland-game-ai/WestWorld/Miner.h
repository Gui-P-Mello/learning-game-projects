

#include "BaseGameEntity.h"
#include "Locations.h"
#include "State.h"
#include "StateMachine.h"
#include "GoHomeAndSleepTilRested.h"
#include "MinerGlobalState.h"

class Miner : public BaseGameEntity{
    private:
    StateMachine<Miner>* m_pStateMachine;
    // State<Miner>* m_pCurrentState;
    // State<Miner>* m_pPreviousState;
    // State<Miner>* m_pGlobalState;
    location_type m_location;

    int m_iGoldCarried;
    int m_iMoneyInBank;
    int m_iThirst;
    int m_iThirstLevel = 10;
    int m_iFatigue;
    int m_iMaxNuggets = 5;
    int m_iComfortLevel = 10;
    

    public:
    Miner(int id):m_location(shack),
        m_iGoldCarried(0),
        m_iMoneyInBank(0),
        m_iThirst(0),
        m_iFatigue(0),
        BaseGameEntity(id){
            m_pStateMachine = new StateMachine<Miner>(this);
            m_pStateMachine->SetCurrentState(GoHomeAndSleepTilRested::Instance());
            m_pStateMachine->SetGlobalState(MinerGlobalState::Instance());
        }
    
    ~Miner(){delete m_pStateMachine;}

    void Update();

    void ChangeState(State<Miner>* pNewState);
    void RevertToPreviousSate();

    void ChangeLocation(location_type newLocation);

    void AddToGoldCarried(int val);

    location_type Location()const{return m_location;}
    bool PocketsFull()const{return m_iGoldCarried >= m_iMaxNuggets;}
    void IncreaseFatigue(){m_iFatigue += 1;}

    void Deposit();
    int Get_m_iMoneyInBank(){return m_iMoneyInBank;}
    int Get_m_iComfortLevel(){return m_iComfortLevel;}
    int Get_m_iFatigue(){return m_iFatigue;}

    bool Thirsty(){if (m_iThirst >= m_iThirstLevel) return true; return false;}
    void Drink(){m_iThirst = 0;}

    void Sleep(){m_iFatigue-=1;}

    StateMachine<Miner>* GetStateMachine(){return m_pStateMachine;}
};

