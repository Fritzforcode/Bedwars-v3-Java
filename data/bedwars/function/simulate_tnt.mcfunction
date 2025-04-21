fill ~-3 ~-3 ~-3 ~3 ~3 ~3 air replace blue_wool
fill ~-3 ~-3 ~-3 ~3 ~3 ~3 air replace red_wool
fill ~-3 ~-3 ~-3 ~3 ~3 ~3 air replace blue_terracotta
fill ~-3 ~-3 ~-3 ~3 ~3 ~3 air replace red_terracotta
fill ~-3 ~-3 ~-3 ~3 ~3 ~3 air replace oak_planks

# Explosion effects
playsound minecraft:entity.generic.explode master @a[distance=..30] ~ ~ ~ 1 1
particle explosion ~ ~ ~ 0.5 0.5 0.5 0.1 20

kill @s
