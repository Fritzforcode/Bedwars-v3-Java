execute if score @s respawn_countdown matches 60 run tellraw @s {"text":"[Bedwars] Respawning in 3","color":"yellow"}
execute if score @s respawn_countdown matches 40 run tellraw @s {"text":"[Bedwars] Respawning in 2","color":"yellow"}
execute if score @s respawn_countdown matches 20 run tellraw @s {"text":"[Bedwars] Respawning in 1","color":"yellow"}
execute if score @s respawn_countdown matches 0 run teleport @s 35 -59 -41
execute if score @s respawn_countdown matches 0 run tag @s remove respawn
