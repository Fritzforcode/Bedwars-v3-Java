execute if score activate_generators variables matches 1 run function bedwars:generator/tick

execute as @a run function bedwars:handle_armor/main
execute as @a run function bedwars:handle_special_items

execute as @e[type=tnt,nbt={fuse:1s}] at @s run function bedwars:simulate_tnt
