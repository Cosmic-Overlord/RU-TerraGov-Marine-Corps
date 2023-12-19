// What kind of function to use for Explosions falling off.

#define EXPLOSION_FALLOFF_SHAPE_LINEAR   0
#define EXPLOSION_FALLOFF_SHAPE_EXPONENTIAL  1
#define EXPLOSION_FALLOFF_SHAPE_EXPONENTIAL_HALF 2

#define EXPLOSION_MAX_POWER 5000

/// how much it takes to gib a mob
#define EXPLOSION_THRESHOLD_GIB 200
/// prone mobs receive less damage from explosions
#define EXPLOSION_PRONE_MULTIPLIER 0.5

//Explosion damage multipliers for different objects
#define EXPLOSION_DAMAGE_MULTIPLIER_DOOR 15
#define EXPLOSION_DAMAGE_MULTIPLIER_WALL 15
#define EXPLOSION_DAMAGE_MULTIPLIER_WINDOW 10

//Additional explosion damage modifier for open doors
#define EXPLOSION_DAMAGE_MODIFIER_DOOR_OPEN 0.5

//Melee weapons and xenos do more damage to resin structures
#define RESIN_EXPLOSIVE_MULTIPLIER 0.85

#define EXPLOSION_THRESHOLD_VLOW 100
#define EXPLOSION_THRESHOLD_LOW 200
#define EXPLOSION_THRESHOLD_MLOW 300
#define EXPLOSION_THRESHOLD_MEDIUM 600
#define EXPLOSION_THRESHOLD_HIGH 1000

/// Projectile is shrpanel which allow it to skip some collisions
#define PROJECTILE_SHRAPNEL  (1<<0)
