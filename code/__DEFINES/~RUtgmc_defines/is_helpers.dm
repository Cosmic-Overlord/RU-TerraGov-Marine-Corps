//Human sub-species
#define isnecoarc(H) (is_species(H, /datum/species/necoarc))

//Xeno castes
#define isxenopanther(A) (istype(A, /mob/living/carbon/xenomorph/panther))
#define isxenofacehugger(A) (istype(A, /mob/living/carbon/xenomorph/facehugger))

//Gamemode
#define isdistressgamemode(O) (istype(O, /datum/game_mode/infestation/distress))

//Objects
#define iscontainmentshutter(A) (istype(A, /obj/machinery/door/poddoor/timed_late/containment/landing_zone))
