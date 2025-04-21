scoreboard players operation emerald_secs g_tick = emerald g_tick
scoreboard players operation emerald_secs g_tick /= const_20 variables
execute positioned 8 -60 -65 run tellraw @a[distance=..4] {"text":"Next Emerald in ","extra":[{"score":{"name":"emerald_secs","objective":"g_tick"}},{"text":"s"}]}

scoreboard players operation diamond_secs g_tick = diamond g_tick
scoreboard players operation diamond_secs g_tick /= const_20 variables
execute positioned 8 -60 -17 run tellraw @a[distance=..4] {"text":"Next Diamond in ","extra":[{"score":{"name":"diamond_secs","objective":"g_tick"}},{"text":"s"}]}

scoreboard players set message_tick g_tick 60
