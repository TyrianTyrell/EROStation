//LISTMOS
//indices of values in gas lists.
#define META_GAS_SPECIFIC_HEAT	1
#define META_GAS_NAME			2
#define META_GAS_MOLES_VISIBLE	3
#define META_GAS_OVERLAY		4
#define META_GAS_DANGER			5
#define META_GAS_ID				6
#define META_GAS_FUSION_POWER   7

//PIPES
//Atmos pipe limits
#define VOLUME_PUMP_LEAK_AMOUNT				0.05 //5% of an overclocked volume pump leaks into the air
#define VOLUME_PUMP_THRESHOLD_LEAK_AMOUNT				0.10 //10% of an overclocked volume pump leaks into the air if it goes beyond normal threshold

#define ARCHIVE_TEMPERATURE(gas) gas.temperature_archived = gas.temperature

#define MIASMA_CORPSE_MOLES 0.02
#define MIASMA_GIBS_MOLES 0.005
