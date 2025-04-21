tellraw @a {"text":"[Bedwars] Loaded Bedwars Datapack","color":"green"}

scoreboard objectives remove variables
scoreboard objectives remove g_tick
scoreboard objectives remove armor_level
scoreboard objectives remove has_shears


scoreboard objectives add variables dummy "variables"
scoreboard players set const_20 variables 20

scoreboard objectives add g_tick dummy "g_tick"
scoreboard players set iron g_tick 35
scoreboard players set gold g_tick 180
scoreboard players set emerald g_tick 560
scoreboard players set diamond g_tick 420
scoreboard players set message_tick g_tick 60
#scoreboard objectives setdisplay sidebar g_tick

scoreboard objectives add armor_level dummy "armor_level"
#scoreboard objectives setdisplay sidebar armor_level

scoreboard objectives add has_shears dummy "has_shears"
#scoreboard objectives setdisplay sidebar has_shears

scoreboard objectives add respawn_countdown dummy "respawn_countdown"
