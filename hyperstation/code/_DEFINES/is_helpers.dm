#if DM_VERSION < 513
#define islist(L) (istype(L, /list))
#endif

#if DM_VERSION < 513
#define ismovableatom(A) (istype(A, /atom/movable))
#else
#define ismovableatom(A) ismovable(A)
#endif

#define iscloudturf(A) (istype(A, /turf/open/chasm/cloud))

#define isavian(A) (is_species(A, /datum/species/avian))
#define isaquatic(A) (is_species(A, /datum/species/aquatic))

// Hyperstation Carbon Stuff
#define iswendigo(A) (istype(A, /mob/living/carbon/wendigo))

#define ismimic(A) (istype(A, /mob/living/simple_animal/hostile/hs13mimic))

GLOBAL_LIST_INIT(shoefootmob, typecacheof(list(
	/mob/living/carbon/human/,
	/mob/living/simple_animal/cow,
	/mob/living/simple_animal/hostile/cat_butcherer,
	/mob/living/simple_animal/hostile/faithless,
	/mob/living/simple_animal/hostile/nanotrasen,
	/mob/living/simple_animal/hostile/pirate,
	/mob/living/simple_animal/hostile/russian,
	/mob/living/simple_animal/hostile/syndicate,
	/mob/living/simple_animal/hostile/wizard,
	/mob/living/simple_animal/hostile/zombie,
	/mob/living/simple_animal/hostile/retaliate/clown,
	/mob/living/simple_animal/hostile/retaliate/spaceman,
	/mob/living/simple_animal/hostile/retaliate/nanotrasenpeace,
	/mob/living/simple_animal/hostile/retaliate/goat,
	/mob/living/carbon/true_devil,
	)))

GLOBAL_LIST_INIT(clawfootmob, typecacheof(list(
	/mob/living/carbon/alien/humanoid,
	/mob/living/simple_animal/hostile/alien,
	/mob/living/simple_animal/pet/cat,
	/mob/living/simple_animal/pet/dog,
	/mob/living/simple_animal/pet/fox,
	/mob/living/simple_animal/chicken,
	/mob/living/simple_animal/hostile/bear,
	/mob/living/simple_animal/hostile/jungle/mega_arachnid
	)))

GLOBAL_LIST_INIT(barefootmob, typecacheof(list(
	/mob/living/carbon/monkey,
	/mob/living/simple_animal/pet/penguin,
	/mob/living/simple_animal/hostile/gorilla,
	/mob/living/simple_animal/hostile/jungle/mook
	)))

GLOBAL_LIST_INIT(heavyfootmob, typecacheof(list(
	/mob/living/simple_animal/hostile/megafauna,
	/mob/living/simple_animal/hostile/jungle/leaper
	)))

GLOBAL_LIST_INIT(pointed_types, typecacheof(list(
	/obj/item/pen,
	/obj/item/screwdriver,
	/obj/item/reagent_containers/syringe,
	/obj/item/kitchen/fork)))

#define is_pointed(W) (is_type_in_typecache(W, GLOB.pointed_types))
