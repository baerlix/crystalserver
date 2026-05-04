local mType = Game.createMonsterType("Ratmiral Blackwhiskers")
local monster = {}

monster.description = "Ratmiral Blackwhiskers"
monster.experience = 50000
monster.outfit = {
	lookType = 1377,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 220000
monster.maxHealth = 220000
monster.race = "blood"
monster.corpse = 35846
monster.speed = 115
monster.manaCost = 0

monster.events = {
	"ratmiralDeath",
	"BugMonsterDeath",
	"ratmiralHealth",
}

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.bosstiary = {
	bossRaceId = 2006,
	bossRace = RARITY_ARCHFOE,
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
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 70,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true,
}

monster.light = {
	level = 0,
	color = 0,
}

monster.summon = {
	maxSummons = 1,
	summons = {
		{ name = "tibianus", chance = 100, interval = 2000, count = 1 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{ name = "crystal coin", chance = 12216, maxCount = 1 },
	{ name = "great health potion", chance = 11069, maxCount = 10 },
	{ name = "great mana potion", chance = 11220, maxCount = 10 },
	{ name = "mastermind potion", chance = 13762, maxCount = 5 },
	{ name = "pirate coin", chance = 13958, maxCount = 55 },
	{ name = "ultimate mana potion", chance = 14751, maxCount = 10 },
	{ name = "cheesy membership card", chance = 11109, maxCount = 1 },
	{ name = "golden cheese wedge", chance = 15083, maxCount = 1 },
	{ name = "exotic amulet", chance = 1250, maxCount = 1 },
	{ name = "golden dustbin", chance = 4182, maxCount = 1 },
	{ name = "throwing axe", chance = 1250, maxCount = 1 },
	{ name = "exotic amulet", chance = 1250, maxCount = 1 },
	{ name = "bast legs", chance = 1250, maxCount = 1 },
	{ name = "exotic legs", chance = 1250, maxCount = 1 },
	{ name = "jungle bow", chance = 1250, maxCount = 1 },
	{ name = "jungle flail", chance = 1250, maxCount = 1 },
	{ name = "jungle quiver", chance = 1250, maxCount = 1 },
	{ name = "jungle rod", chance = 1250, maxCount = 1 },
	{ name = "make-do boots", chance = 1250, maxCount = 1 },
	{ name = "makeshift boots", chance = 1250, maxCount = 1 },
	{ name = "soap", chance = 800, maxCount = 1 },
	{ name = "scrubbing brush", chance = 800, maxCount = 1 },
	{ name = "bambus jo", chance = 800, maxCount = 1 },
	{ name = "jungle survivor legs", chance = 800, maxCount = 1 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -400, maxDamage = -1000 },
	{ name = "ratmiral fire wave", interval = 2000, chance = 35 },
	{ name = "ratmiral ball", interval = 2000, chance = 20 },
}

monster.defenses = {
	defense = 60,
	armor = 82,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
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
