// No neighbors
#define NEIGHBORS_NONE  0
// Cardinal neighborhood
#define NEIGHBORS_CARDINAL 1
// Ordinal neighborhood
#define NEIGHBORS_ORDINAL  2
// Note that NEIGHBORS_CARDINAL | NEIGHBORS_ORDINALS gives you all 8 surrounding neighbors

/// how much it takes to gib a mob
#define EXPLOSION_THRESHOLD_GIB 200 // maybe should change it to 300?
/// prone mobs receive less damage from explosions
#define EXPLOSION_PRONE_MULTIPLIER 0.5

//Explosion damage multipliers for different objects
#define EXPLOSION_DAMAGE_MULTIPLIER_DOOR 5
#define EXPLOSION_DAMAGE_MULTIPLIER_DOOR_OPEN 0.5
#define EXPLOSION_DAMAGE_MULTIPLIER_WALL 7.5
#define EXPLOSION_DAMAGE_MULTIPLIER_WINDOW 5

//Explosion damage multipliers for different objects
#define RESIN_EXPLOSIVE_MULTIPLIER 0.85
