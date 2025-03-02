#include"State.h"
template<class entity_type>
class StateMachine{
    private:
        entity_type* m_pOwner;

        State<entity_type>* m_pCurrentState;

        State<entity_type>* m_pPreviousState;

        State<entity_type>* m_pGlobalState;

    public:
        StateMachine(entity_type* owner):m_pOwner(owner),
            m_pCurrentState(NULL),
            m_pPreviousState(NULL),
            m_pGlobalState(NULL){}
    
        void SetCurrentState(State<entity_type>* s){m_pCurrentState = s;}
        void SetGlobalState(State<entity_type>* s) {m_pGlobalState = s;}
        void SetPreviousState(State<entity_type>* s){m_pPreviousState = s;}

        void Update(){
            if (m_pGlobalState) m_pGlobalState->Execute(m_pOwner);
            if (m_pCurrentState) m_pCurrentState->Execute(m_pOwner);
        }
        
        void ChangeState(State<entity_type>* pNewState){
            assert(pNewState && "<StateMachine<class entity_type>::ChangeState>: trying to change to a null state");
            
            m_pCurrentState->Exit(m_pOwner);
        
            m_pPreviousState = m_pCurrentState;
        
            m_pCurrentState = pNewState;
        
            m_pCurrentState->Enter(m_pOwner);
        }

    State<entity_type>* CurrentState(){return m_pCurrentState;}
    State<entity_type>* PreviousState(){return m_pPreviousState;}
    State<entity_type>* GlobalState(){return m_pGlobalState;}

    // bool isInState(const State<entity_type>& st)const;
};