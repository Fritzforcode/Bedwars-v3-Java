execute if score @s armor_level matches 0 run return 0
execute if score @s armor_level matches 1 run \
    item replace entity @s armor.chest with \
        minecraft:chainmail_chestplate[minecraft:enchantments={"minecraft:binding_curse": 1}, enchantment_glint_override=false] 1
execute if score @s armor_level matches 2 run \
    item replace entity @s armor.chest with \
        minecraft:iron_chestplate[minecraft:enchantments={"minecraft:binding_curse": 1}, enchantment_glint_override=false] 1
execute if score @s armor_level matches 3 run \
    item replace entity @s armor.chest with \
        minecraft:diamond_chestplate[minecraft:enchantments={"minecraft:binding_curse": 1}, enchantment_glint_override=false] 1
