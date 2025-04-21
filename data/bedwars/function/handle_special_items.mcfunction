execute if items entity @s container.* shears unless score @s has_shears matches 1 run scoreboard players set @s has_shears 1
execute if score @s has_shears matches 1 \
        unless items entity @s container.* shears \
        unless items entity @s player.cursor shears \
    run give @s shears[custom_data={"undroppable":1}] 1

kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{undroppable:1}}}}]

