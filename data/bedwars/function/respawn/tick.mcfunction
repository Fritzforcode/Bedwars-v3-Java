scoreboard players remove @s respawn_timer 1


execute unless block 35 -60 -41 minecraft:blue_bed run scoreboard players set blue bed_alive 0
execute unless block -19 -60 -41 minecraft:red_bed run scoreboard players set red bed_alive 0

#title @s actionbar ["Respawning in ", {"score":{"name":"@s","objective":"respawn_timer"}}]
execute if score @s respawn_timer matches 100 run title @s title {"color":"green","text":"Respawning in 5s"}
execute if score @s respawn_timer matches 80 run title @s title {"color":"green","text":"Respawning in 4s"}
execute if score @s respawn_timer matches 60 run title @s title {"color":"green","text":"Respawning in 3s"}
execute if score @s respawn_timer matches 40 run title @s title {"color":"green","text":"Respawning in 2s"}
execute if score @s respawn_timer matches 20 run title @s title {"color":"green","text":"Respawning in 1s"}

execute if score @s respawn_timer matches 0 run function bedwars:respawn/respawn

