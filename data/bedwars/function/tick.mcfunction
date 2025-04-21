execute if score activate_generators variables matches 1 run function bedwars:generator/tick

execute as @a run function bedwars:handle_armor/main
execute as @a run function bedwars:handle_special_items

execute as @e[type=tnt,nbt={fuse:1s}] at @s run function bedwars:simulate_tnt
spawnpoint @a 8 -41 -41
execute positioned 8 -41 -41 as @a[distance=..3,tag=!respawn] run function bedwars:set_respawn_counter

execute positioned 8 -41 -41 as @a[distance=..3,tag=blue,tag=respawn] run function bedwars:respawn_blue
execute positioned 8 -41 -41 as @a[distance=..3,tag=red,tag=respawn] run function bedwars:respawn_red
scoreboard players remove @a[tag=respawn] respawn_countdown 1
