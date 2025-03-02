class BaseGameEntity
{
    private:
    int m_ID;
    static int m_iNextValidID;
    void setID(int val);

    public:
    BaseGameEntity(int id){
        setID(id);
    }

    virtual  ~BaseGameEntity(){}
    
    virtual void Update()=0;
    int ID()const{return m_ID;}
};