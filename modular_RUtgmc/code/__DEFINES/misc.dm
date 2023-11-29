// Foreign mess

#define FOREIGN_LEGION_MARINE "Marine"
#define FOREIGN_LEGION_LEADER "Leader"

#define FOREIGN_LEGION_RANKS list(FOREIGN_LEGION_MARINE, FOREIGN_LEGION_LEADER)

#define FOREIGN_LEGION_MARINE_INT 1
#define FOREIGN_LEGION_LEADER_INT 2

#define FOREIGN_ALLOWED_LEADER 2

var/global/list/foreign_legion_ranks_ordered = list(
	FOREIGN_LEGION_MARINE = FOREIGN_LEGION_MARINE_INT,
	FOREIGN_LEGION_LEADER = FOREIGN_LEGION_LEADER_INT
)

// TODO: Разобраться какого хуя эта хуйня вообще здесь делает, блядь.
