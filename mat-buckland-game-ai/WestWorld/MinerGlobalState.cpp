#include "MinerGlobalState.h"
#include "EntityNames.h"
#include <iostream>

using std::cout;

MinerGlobalState* MinerGlobalState::Instance(){
    static MinerGlobalState instance;
    return &instance;
}

void MinerGlobalState::Enter(Miner* pMiner){
    
}

void MinerGlobalState::Execute(Miner* pMiner){
    
}

void MinerGlobalState::Exit(Miner* pMiner){
    
}