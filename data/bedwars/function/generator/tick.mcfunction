scoreboard players remove iron g_tick 1
execute if score iron g_tick matches ..0 run function bedwars:generator/gen_iron

scoreboard players remove gold g_tick 1
execute if score gold g_tick matches ..0 run function bedwars:generator/gen_gold

scoreboard players remove emerald g_tick 1
execute if score emerald g_tick matches ..0 run function bedwars:generator/gen_emerald

scoreboard players remove diamond g_tick 1
execute if score diamond g_tick matches ..0 run function bedwars:generator/gen_diamond

scoreboard players remove message_tick g_tick 1
execute if score message_tick g_tick matches ..0 run function bedwars:generator/send_messages
