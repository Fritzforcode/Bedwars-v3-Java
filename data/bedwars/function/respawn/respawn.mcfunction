tag @s remove respawning
scoreboard players reset @s respawn_timer

# BLUE TEAM
execute if entity @s[team=blue] if score @s blue bed_alive matches 1 run tp @s 35 -59 -41
execute if entity @s[team=blue] if score @s blue bed_alive matches 0 run gamemode spectator @s

# RED TEAM
execute if entity @s[team=red] if score @s red bed_alive matches 1 run tp @s -19 -59 -41
execute if entity @s[team=red] if score @s red bed_alive matches 0 run gamemode spectator @s

# Effects (optional)
playsound minecraft:entity.enderman.teleport master @s
particle minecraft:totem_of_undying ~ ~ ~ 0.3 1 0.3 0 10
