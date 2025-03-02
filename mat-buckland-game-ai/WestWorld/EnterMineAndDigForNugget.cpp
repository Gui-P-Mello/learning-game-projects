#include "EnterMineAndDigForNugget.h"
#include <iostream>
#include "EntityNames.h"
#include "VisitBankAndDeposit.h"
#include "State.h"
#include "Locations.h"
#include "QuenchThirst.h"
using std::cout;


EnterTheGoldMineAndDigForNugget* EnterTheGoldMineAndDigForNugget::Instance(){
    static EnterTheGoldMineAndDigForNugget instance;
    return &instance;
}

void EnterTheGoldMineAndDigForNugget::Enter(Miner* pMiner){
    if(pMiner->Location()!= goldmine){
        cout << "\n" << GetNameOfEntity(pMiner->ID()) << " : "
        << "Walkin' to the gold mine";

        pMiner->ChangeLocation(location_type::goldmine);
    }
}

void EnterTheGoldMineAndDigForNugget::Execute(Miner* pMiner){
        pMiner->AddToGoldCarried(1);
        pMiner->IncreaseFatigue();

         cout << "\n" << GetNameOfEntity(pMiner->ID()) << " : "
        << "Pickin' up a nugget";

        if(pMiner->PocketsFull()){
            pMiner->GetStateMachine()->ChangeState(VisitBankAndDeposit::Instance());
        }

        if(pMiner->Thirsty()){
            pMiner->GetStateMachine()->ChangeState(QuenchThirst::Instance());
        }
}

void EnterTheGoldMineAndDigForNugget::Exit(Miner* pMiner){
    cout << "\n" << GetNameOfEntity(pMiner->ID()) << " : "
        << "Ah'm livin' the gold mine with mah pockets full o' sweet gold";
}