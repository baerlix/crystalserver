local mType = Game.createMonsterType("Tentugly's Head")
local monster = {}

monster.description = "Tentugly's Head"
monster.experience = 40000
monster.outfit = {
	lookTypeEx = 35105,
}

monster.bosstiary = {
	bossRaceId = 2238,
	bossRace = RARITY_ARCHFOE,
}

monster.health = 75000
monster.maxHealth = 75000
monster.race = "blood"
monster.corpse = 35600
monster.speed = 0
monster.manaCost = 0

monster.events = {
	"tentuglysDeath",
	"tentuglysHeadPhase",
}

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = true,
	illusionable = false,
	canPushItems = false,
	canPushCreatures = true,
	staticAttackChance = 70,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false,
}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{ name = "crystal coin", chance = 13762, maxCount = 3 },
	{ name = "berserk potion", chance = 13764, maxCount = 5 },
	{ name = "bullseye potion", chance = 13560, maxCount = 5 },
	{ name = "mastermind potion", chance = 13767, maxCount = 5 },
	{ name = "pirate coin", chance = 13958, maxCount = 56 },
	{ name = "platinum coin", chance = 13599, maxCount = 10 },
	{ name = "ultimate health potion", chance = 13214, maxCount = 10 },
	{ name = "ultimate mana potion", chance = 13251, maxCount = 10 },
	{ name = "ultimate spirit potion", chance = 13015, maxCount = 10 },
	{ name = "cheesy key", chance = 13333, maxCount = 1 },
	{ name = "sea horse figurine", chance = 13182, maxCount = 1 },
	{ name = "small treasure chest", chance = 13670, maxCount = 1 },
	{ name = "golden cheese wedge", chance = 13404, maxCount = 1 },
	{ name = "golden dustbin", chance = 13057, maxCount = 1 },
	{ name = "golden skull", chance = 13901, maxCount = 1 },
	{ name = "giant topaz", chance = 13328, maxCount = 1 },
	{ name = "giant amethyst", chance = 13557, maxCount = 1 },
	{ name = "tiara", chance = 14012, maxCount = 1 },
	{ name = "plushie of tentugly", chance = 14555, maxCount = 1 },
	{ name = "tentugly's eye", chance = 1250, maxCount = 1 },
	{ name = "tentugly's jaws", chance = 1250, maxCount = 1 },
	{ id = 35611, chance = 13763, maxCount = 1 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -400 },
	{ name = "combat", type = COMBAT_ENERGYDAMAGE, interval = 2000, chance = 40, minDamage = -100, maxDamage = -400, range = 5, radius = 4, target = true, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_GHOSTLY_BITE },
	{ name = "energy waveT", interval = 2000, chance = 30, minDamage = 0, maxDamage = -250 },
	{ name = "combat", type = COMBAT_ENERGYDAMAGE, interval = 2000, chance = 50, minDamage = -100, maxDamage = -300, radius = 5, effect = CONST_ME_LOSEENERGY },
}

monster.defenses = {
	defense = 60,
	armor = 82,
	--	mitigation = ???,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 30 },
	{ type = COMBAT_EARTHDAMAGE, percent = -30 },
	{ type = COMBAT_FIREDAMAGE, percent = -20 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = true },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType.onAppear = function(monster, creature)
	if monster:getType():isRewardBoss() then
		monster:setReward(true)
	end
end

mType:register(monster)
