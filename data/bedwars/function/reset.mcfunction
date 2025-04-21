scoreboard players reset @a armor_level
scoreboard players reset @a has_shears
scoreboard players reset @e g_tick
scoreboard players set activate_generators variables 0
effect clear @a
clear @a[gamemode=survival]
item replace entity @a armor.chest with air
kill @e[type=item]
kill @e[type=villager]

function bedwars:summon_villager/all
