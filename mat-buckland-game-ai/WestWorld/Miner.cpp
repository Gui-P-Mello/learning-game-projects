#include "Miner.h"
#include "State.h"
#include <cassert>
void Miner::ChangeState(State<Miner>* pNewState){
    assert(m_pCurrentState && pNewState);
    
    m_pCurrentState->Exit(this);

    m_pPreviousState = m_pCurrentState;

    m_pCurrentState = pNewState;

    m_pCurrentState->Enter(this);
}

void Miner::RevertToPreviousSate(){
    m_pCurrentState->Exit(this);

    m_pCurrentState = m_pPreviousState;

    m_pCurrentState->Enter(this);
}

void Miner::Update(){
        m_iThirst++;

        m_pStateMachine->Update();
        
        // if(m_pCurrentState){
        //     m_pCurrentState->Execute(this);
        // }
}

void Miner::ChangeLocation(location_type newLocation){
    m_location = newLocation;
}

void Miner::AddToGoldCarried(int val){
    m_iGoldCarried += val;

    if(m_iGoldCarried < 0) m_iGoldCarried = 0;
}

void Miner::Deposit(){
    m_iMoneyInBank += m_iGoldCarried;
    m_iGoldCarried = 0;
}