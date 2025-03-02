#include "GoHomeAndSleepTilRested.h"
#include "EntityNames.h"
#include "Miner.h"
#include "EnterMineAndDigForNugget.h"
#include <iostream>

using std::cout;

GoHomeAndSleepTilRested* GoHomeAndSleepTilRested::Instance(){
    static GoHomeAndSleepTilRested instance;
    return &instance;
}

void GoHomeAndSleepTilRested::Enter(Miner* pMiner){
    if(pMiner->Location()!= shack){
        cout << "\n" << GetNameOfEntity(pMiner->ID()) << " : "
        << "Walkin' home";

        pMiner->ChangeLocation(location_type::shack);
    }
}

void GoHomeAndSleepTilRested::Execute(Miner* pMiner){
    pMiner->Sleep();

     cout << "\n" << GetNameOfEntity(pMiner->ID()) << " : "
    << "ZZZZ...";

    if(pMiner->Get_m_iFatigue() <= 0){
        pMiner->GetStateMachine()->ChangeState(EnterTheGoldMineAndDigForNugget::Instance());
    }
    
}

void GoHomeAndSleepTilRested::Exit(Miner* pMiner){
    cout << "\n" << GetNameOfEntity(pMiner->ID()) << " : "
    <<  "What a God-darn fantastic nap! Time to find more gold";    
}