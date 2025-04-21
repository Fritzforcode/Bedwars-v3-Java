execute if items entity @s container.* chainmail_chestplate \
    unless items entity @s armor.chest chainmail_chestplate \
    unless items entity @s armor.chest iron_chestplate \
    unless items entity @s armor.chest diamond_chestplate \
    run function bedwars:handle_armor/chainmail

execute if items entity @s container.* iron_chestplate \
    unless items entity @s armor.chest iron_chestplate \
    unless items entity @s armor.chest diamond_chestplate \
    run function bedwars:handle_armor/iron

execute if items entity @s container.* diamond_chestplate \
    unless items entity @s armor.chest diamond_chestplate \
    run function bedwars:handle_armor/diamond

execute unless items entity @s armor.chest * run function bedwars:handle_armor/set
