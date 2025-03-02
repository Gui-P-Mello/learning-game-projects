#include "Miner.h"
#include "EntityNames.h"
int main()
{

  Miner miner(ent_Miner_BoB);

  for (int i=0; i<20; ++i)
  { 
    miner.Update();
  }

  return 0;
}