execute if entity @s[tag=blue] unless block -19 -60 -41 blue_bed run function bedwars:won_red
execute if entity @s[tag=red] unless block 35 -60 -41 red_bed run function bedwars:won_blue

scoreboard players set @s respawn_countdown 60
tag @s add respawn

