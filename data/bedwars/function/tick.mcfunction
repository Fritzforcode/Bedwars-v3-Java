execute if score activate_generators variables matches 1 run function bedwars:generator/tick

execute as @a run function bedwars:handle_armor/main
execute as @a run function bedwars:handle_special_items

execute as @e[type=tnt,nbt={fuse:1s}] at @s run function bedwars:simulate_tnt

spawnpoint @a 8 -41 -41
execute as @a[x=8,y=-41,z=-41,dx=0,dy=1,dz=0,tag=!respawning] run function bedwars:respawn/begin
execute as @a[tag=respawning] at @s run function bedwars:respawn/tick
