#include <string>

enum{
    ent_Miner_BoB,
    ent_Elsa
};

inline std::string GetNameOfEntity(int n){
    switch(n){
        case ent_Miner_BoB:
            return "Miner Bob";

        case ent_Elsa:
            return "Elsa";

        default:
            return "Unknown";
    }
}