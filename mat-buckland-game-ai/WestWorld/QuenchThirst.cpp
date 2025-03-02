#include "QuenchThirst.h"
#include "GoHomeAndSleepTilRested.h"
#include "EntityNames.h"
#include "EnterMineAndDigForNugget.h"
#include <iostream>

using std::cout;

QuenchThirst* QuenchThirst::Instance(){
    static QuenchThirst instance;
    return &instance;
}

void QuenchThirst::Enter(Miner* pMiner){
    if(pMiner->Location()!= saloon){
        cout << "\n" << GetNameOfEntity(pMiner->ID()) << " : "
        << "Boy, ah sure is thusty! Walkin' to the saloon";

        pMiner->ChangeLocation(location_type::saloon);
    }
}

void QuenchThirst::Execute(Miner* pMiner){
    pMiner->Drink();

     cout << "\n" << GetNameOfEntity(pMiner->ID()) << " : "
    << "That's mighty fine sippin liquor";

    pMiner->GetStateMachine()->ChangeState(EnterTheGoldMineAndDigForNugget::Instance());    
}

void QuenchThirst::Exit(Miner* pMiner){
    cout << "\n" << GetNameOfEntity(pMiner->ID()) << " : "
    <<  "Leavin' the saloon, feelin' good";    
}