blue_block_trades = [
    # Blocks
    ("iron_ingot",  4, "blue_wool", 16),
    ("iron_ingot", 12, "blue_terracotta", 16),
    ("gold_ingot",  4, "oak_planks", 16),
    ("iron_ingot", 12, "light_gray_stained_glass", 4),
    ("iron_ingot", 24, "end_stone", 12),
    ("iron_ingot",  4, "ladder", 8),
    ("emerald"   ,  4, "obsidian", 4),
]

red_block_trades = [
    # Blocks
    ("iron_ingot",  4, "red_wool", 16),
    ("iron_ingot", 12, "red_terracotta", 16),
    ("gold_ingot",  4, "oak_planks", 16),
    ("iron_ingot", 12, "light_gray_stained_glass", 4),
    ("iron_ingot", 24, "end_stone", 12),
    ("iron_ingot",  4, "ladder", 8),
    ("emerald"   ,  4, "obsidian", 4),
]

weapon_armor_trades = [
    # Weapons
    ("iron_ingot", 10, "stone_sword", 1),
    ("gold_ingot",  7, "iron_sword", 1),
    ("emerald"   ,  4, "diamond_sword", 1),
    ("gold_ingot",  5, "stick", 1, {
        "minecraft:enchantments": {"minecraft:knockback": 1}
    }), 
    # Armor (Permanent)
    ("iron_ingot", 24, "chainmail_chestplate", 1, {
        "minecraft:enchantments": {"minecraft:binding_curse": 1},
        "enchantment_glint_override": False,
    }),
    ("gold_ingot", 12, "iron_chestplate", 1, {
        "minecraft:enchantments": {"minecraft:binding_curse": 1},
        "enchantment_glint_override": False,
    }),
    ("emerald"   ,  6, "diamond_chestplate", 1, {
        "minecraft:enchantments": {"minecraft:binding_curse": 1},
        "enchantment_glint_override": False,
    }),
]

tool_trades = [
    # Pickaxes
    ("iron_ingot", 10, "wooden_pickaxe" , 1, {
        "minecraft:enchantments": {"minecraft:efficiency": 1}, 
    }),
    ("iron_ingot", 10, "iron_pickaxe"   , 1, {
        "minecraft:enchantments": {"minecraft:efficiency": 2}
    }),
    ("gold_ingot",  3, "golden_pickaxe" , 1, {
        "minecraft:enchantments": {"minecraft:efficiency": 3, "minecraft:sharpness": 2}
    }),
    ("gold_ingot",  6, "diamond_pickaxe", 1, {
        "minecraft:enchantments": {"minecraft:efficiency": 3}
    }),
    # Shears
    ("iron_ingot", 20, "shears", 1, {
        "minecraft:custom_data": {"undroppable":1},
    }),
    # Axes
    ("iron_ingot", 10, "wooden_axe" , 1, {
        "minecraft:enchantments": {"minecraft:efficiency": 1}
    }),
    ("iron_ingot", 10, "stone_axe"  , 1, {
        "minecraft:enchantments": {"minecraft:efficiency": 1}
    }),
    ("gold_ingot",  3, "iron_axe"   , 1, {
        "minecraft:enchantments": {"minecraft:efficiency": 2}
    }),
    ("gold_ingot",  6, "diamond_axe", 1, {
        "minecraft:enchantments": {"minecraft:efficiency": 3}
    }),
  
]

bow_arrow_trades = [
    # Bows & Arrows
    ("gold_ingot", 12, "bow", 1),
    ("gold_ingot", 20, "bow", 1),
    ("emerald"   ,  6, "bow", 1),
    ("gold_ingot",  2, "arrow", 6),
]

special_trades = [
    # Potions
    ("emerald"   , 1, "potion", 1, {
        "minecraft:potion_contents": {"potion": "minecraft:strong_swiftness"},
        "minecraft:potion_duration_scale": 0.5,
    }),
    ("emerald"   , 1, "potion", 1, {
        "minecraft:potion_contents": {"custom_effects": [{"id": "minecraft:jump_boost", "amplifier": 4, "duration": 900}]},
        "minecraft:custom_name": {"italic": False, "text": "Potion of Jump Boost"},
    }),
    ("emerald"   , 2, "potion", 1, {
        "minecraft:potion_contents": {"potion": "minecraft:invisibility"},
        "minecraft:potion_duration_scale": 0.17,
    }),
    ("gold_ingot", 3, "tnt", 1),
    ("emerald"   , 4, "ender_pearl", 1),
    ("gold_ingot", 2, "water_bucket", 1),
    ("gold_ingot", 2, "sponge", 4),
]
# TODO's:
# - allow permanent armor + shears
# - tools shouldn't get damage
# - enchant axes efficiency I, I, II, III
# - enchant pickaxes effi I, II, [III + sharpness II], III
# - allow bows entchanted [], [Power I], [Power I + Punch 1]
# - potion types

# Failed TODO's:
# - allow multiple items?

import json

def complete_item_id(item_id):
    return item_id if ":" in item_id else "minecraft:" + item_id

def generate_item_string(item_id, item_count=1, components={}):
    property_strings = []
    property_strings.append("id:" + json.dumps(complete_item_id(item_id)))
    property_strings.append("count:" + json.dumps(item_count))
    if components:
        property_strings.append("components:" + json.dumps(components))
    return "{" + ",".join(property_strings) + "}"

def write_custom_trades_villager_command(villager_trades, villager_position, villager_profession, villager_biome, filename):
    command  = 'summon villager '
    command += villager_position
    command += ' {Silent:1b,Invulnerable:1b,PersistenceRequired:1b,NoAI:1b,VillagerData:{level:5,profession:"minecraft:'
    command += villager_profession
    command += '",type:"minecraft:'
    command += villager_biome
    command += '"},Offers:{Recipes:['

    recipe_strings = []
    for trade in villager_trades:
        recipe_str = '{maxUses:9999,rewardExp:0b,buy:'
        recipe_str += generate_item_string(item_id=trade[0], item_count=trade[1])
        recipe_str += ',sell:'
        if 4 in range(len(trade)):
            recipe_str += generate_item_string(item_id=trade[2], item_count=trade[3], components=trade[4])
        else:
            recipe_str += generate_item_string(item_id=trade[2], item_count=trade[3])
        recipe_str += '}'
        recipe_strings.append(recipe_str)
    command += ",".join(recipe_strings)
    command += "]}}"
    with open(filename, "w") as file:
        file.write(command+"\n")

write_custom_trades_villager_command(
    villager_trades=blue_block_trades, 
    villager_position="-24 -60 -46",
    villager_profession="mason",
    villager_biome="plains",
    filename="../../data/bedwars/function/summon_villager/blue/blocks.mcfunction",
)
write_custom_trades_villager_command(
    villager_trades=weapon_armor_trades, 
    villager_position="-23 -60 -46",
    villager_profession="armorer",
    villager_biome="plains",
    filename="../../data/bedwars/function/summon_villager/blue/weapons_armor.mcfunction",
)
write_custom_trades_villager_command(
    villager_trades=tool_trades, 
    villager_position="-22 -60 -46",
    villager_profession="toolsmith",
    villager_biome="plains",
    filename="../../data/bedwars/function/summon_villager/blue/tools.mcfunction",
)
write_custom_trades_villager_command(
    villager_trades=bow_arrow_trades, 
    villager_position="-21 -60 -46",
    villager_profession="fletcher",
    villager_biome="plains",
    filename="../../data/bedwars/function/summon_villager/blue/bows_arrows.mcfunction",
)
write_custom_trades_villager_command(
    villager_trades=special_trades, 
    villager_position="-20 -60 -46",
    villager_profession="cleric",
    villager_biome="plains",
    filename="../../data/bedwars/function/summon_villager/blue/special.mcfunction",
)

write_custom_trades_villager_command(
    villager_trades=red_block_trades, 
    villager_position="-24 -60 -46",
    villager_profession="mason",
    villager_biome="plains",
    filename="../../data/bedwars/function/summon_villager/red/blocks.mcfunction",
)
write_custom_trades_villager_command(
    villager_trades=weapon_armor_trades, 
    villager_position="-23 -60 -46",
    villager_profession="armorer",
    villager_biome="plains",
    filename="../../data/bedwars/function/summon_villager/red/weapons_armor.mcfunction",
)
write_custom_trades_villager_command(
    villager_trades=tool_trades, 
    villager_position="-22 -60 -46",
    villager_profession="toolsmith",
    villager_biome="plains",
    filename="../../data/bedwars/function/summon_villager/red/tools.mcfunction",
)
write_custom_trades_villager_command(
    villager_trades=bow_arrow_trades, 
    villager_position="-21 -60 -46",
    villager_profession="fletcher",
    villager_biome="plains",
    filename="../../data/bedwars/function/summon_villager/red/bows_arrows.mcfunction",
)
write_custom_trades_villager_command(
    villager_trades=special_trades, 
    villager_position="-20 -60 -46",
    villager_profession="cleric",
    villager_biome="plains",
    filename="../../data/bedwars/function/summon_villager/red/special.mcfunction",
)

