#include "VisitBankAndDeposit.h"
#include "EntityNames.h"
#include "EnterMineAndDigForNugget.h"
#include "GoHomeAndSleepTilRested.h"
#include <iostream>

using std::cout;

VisitBankAndDeposit* VisitBankAndDeposit::Instance(){
    static VisitBankAndDeposit instance;
    return &instance;
}

void VisitBankAndDeposit::Enter(Miner* pMiner){
    if(pMiner->Location()!= bank){
        cout << "\n" << GetNameOfEntity(pMiner->ID()) << " : "
        << " Goin' to the bank. Yes siree";

        pMiner->ChangeLocation(location_type::bank);
    }
}

void VisitBankAndDeposit::Execute(Miner* pMiner){
    pMiner->Deposit();

     cout << "\n" << GetNameOfEntity(pMiner->ID()) << " : "
    << " Depositin’ gold. Total savings now: " << pMiner->Get_m_iMoneyInBank();

    if(pMiner->Get_m_iMoneyInBank() >= pMiner->Get_m_iComfortLevel()){
        pMiner->GetStateMachine()->ChangeState(GoHomeAndSleepTilRested::Instance());
    }
    else{
        pMiner->GetStateMachine()->ChangeState(EnterTheGoldMineAndDigForNugget::Instance());
    }
    
}

void VisitBankAndDeposit::Exit(Miner* pMiner){
    cout << "\n" << GetNameOfEntity(pMiner->ID()) << " : "
    <<  "Leavin' the bank";    
}