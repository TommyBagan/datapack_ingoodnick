# Reset the event.
execute at @s run advancement revoke @s only ingoodnick:events/event_spiteful_amber

# Records player HP as an integer.
scoreboard players set @s ingoodnick_player_hp 0
execute store result score @s ingoodnick_player_hp run attribute @s max_health base get 1

# If the player has less than 10 hearts, they shouldn't use the amber. So they just combust!
execute if score @s ingoodnick_player_hp matches ..19 run function ingoodnick:mechanics/exit_early_on_combustion {item:"spiteful_amber"}
execute if score @s ingoodnick_player_hp matches ..19 run return 0

# If the player has more than 20 hearts, they can't use the amber anymore so we back out early.
execute if score @s ingoodnick_player_hp matches 40.. run function ingoodnick:mechanics/exit_early_on_use {item:"spiteful_amber"}
execute if score @s ingoodnick_player_hp matches 40.. run return 0

# We boost player HP by 2 for each amber. Note I would typically use iterative macros here, but that would require
# putting the player's HP in storage. Given storage is global and unlocked, this could cause strange
# race conditions. The match clauses here also fix any potential bounds issues.
execute if score @s ingoodnick_player_hp matches 20 run function ingoodnick:mechanics/set_hp {hp:22,damage:19}
execute if score @s ingoodnick_player_hp matches 21..22 run function ingoodnick:mechanics/set_hp {hp:24,damage:21}
execute if score @s ingoodnick_player_hp matches 23..24 run function ingoodnick:mechanics/set_hp {hp:26,damage:23}
execute if score @s ingoodnick_player_hp matches 25..26 run function ingoodnick:mechanics/set_hp {hp:28,damage:25}
execute if score @s ingoodnick_player_hp matches 27..28 run function ingoodnick:mechanics/set_hp {hp:30,damage:27}
execute if score @s ingoodnick_player_hp matches 29..30 run function ingoodnick:mechanics/set_hp {hp:32,damage:29}
execute if score @s ingoodnick_player_hp matches 31..32 run function ingoodnick:mechanics/set_hp {hp:34,damage:31}
execute if score @s ingoodnick_player_hp matches 33..34 run function ingoodnick:mechanics/set_hp {hp:36,damage:33}
execute if score @s ingoodnick_player_hp matches 35..36 run function ingoodnick:mechanics/set_hp {hp:38,damage:35}
execute if score @s ingoodnick_player_hp matches 37..39 run function ingoodnick:mechanics/set_hp {hp:40,damage:37}

# Warning for the edge case, could potentially add an advancement here?
execute if score @s ingoodnick_player_hp matches 40 run title @s actionbar {translate:"item.ingoodnick.constitution_gem.no_more_uses",fallback:"Your are at your mortal end, the jewel can empower you no more..."}

# Has some perceptive effects when the player uses the ruby.
playsound minecraft:entity.warden.heartbeat ambient @s ~ ~ ~ 1 0.5
effect give @s minecraft:darkness 5 100 true
effect give @s minecraft:nausea 6 1 true
execute at @s run particle minecraft:crit ~ ~1 ~ 0 0 0 1 60
playsound minecraft:particle.soul_escape block @s ~ ~ ~10 1 0.5
playsound minecraft:particle.soul_escape block @s ~ ~ ~-10 1 0.5
playsound minecraft:particle.soul_escape block @s ~10 ~ ~ 1 0.5
playsound minecraft:particle.soul_escape block @s ~-10 ~ ~ 1 0.5

# More effects!
particle minecraft:soul ~ ~ ~10 1 0.5 0 0 3 normal
particle minecraft:soul ~ ~ ~-10 1 0.5 0 0 3 normal
particle minecraft:soul ~10 ~ ~ 1 0.5 0 0 3 normal
particle minecraft:soul ~-10 ~ ~ 1 0.5 0 0 3 normal

# Summon vexes around the player!
summon vex ~ ~ ~10 {CustomName:[{text:"Spiteful Spirit"}],Team:ingoodnick_spirits,Health:100,Silent:1b,Tags:["ingoodnick_spirit","ingoodnick_spirit_a"],equipment:{mainhand:{id:netherite_hoe,count:1},offhand:{id:netherite_hoe,count:1}},drop_chances:{offhand:0f,mainhand:0f},attributes:[{id:attack_damage,base:6f},{id:follow_range,base:300f},{id:scale,base:2f},{id:max_health,base:100},{id:knockback_resistance,base:1f}]}
summon vex ~ ~ ~-10 {CustomName:[{text:"Spiteful Spirit"}],Team:ingoodnick_spirits,Health:100,Silent:1b,Tags:["ingoodnick_spirit","ingoodnick_spirit_b"],equipment:{mainhand:{id:netherite_hoe,count:1},offhand:{id:netherite_hoe,count:1}},drop_chances:{offhand:0f,mainhand:0f},attributes:[{id:attack_damage,base:6f},{id:follow_range,base:300f},{id:scale,base:2f},{id:max_health,base:100},{id:knockback_resistance,base:1f}]}
summon vex ~10 ~ ~ {CustomName:[{text:"Spiteful Spirit"}],Team:ingoodnick_spirits,Health:100,Silent:1b,Tags:["ingoodnick_spirit","ingoodnick_spirit_c"],equipment:{mainhand:{id:netherite_hoe,count:1},offhand:{id:netherite_hoe,count:1}},drop_chances:{offhand:0f,mainhand:0f},attributes:[{id:attack_damage,base:6f},{id:follow_range,base:300f},{id:scale,base:2f},{id:max_health,base:100},{id:knockback_resistance,base:1f}]}
summon vex ~-10 ~ ~ {CustomName:[{text:"Spiteful Spirit"}],Team:ingoodnick_spirits,Health:100,Silent:1b,Tags:["ingoodnick_spirit","ingoodnick_spirit_d"],equipment:{mainhand:{id:netherite_hoe,count:1},offhand:{id:netherite_hoe,count:1}},drop_chances:{offhand:0f,mainhand:0f},attributes:[{id:attack_damage,base:6f},{id:follow_range,base:300f},{id:scale,base:2f},{id:max_health,base:100},{id:knockback_resistance,base:1f}]}
effect give @e[type=vex,tag=ingoodnick_spirit] minecraft:invisibility infinite 1 true
effect give @e[type=vex,tag=ingoodnick_spirit] minecraft:glowing infinite 1 true

# Use schedule instead of a tick for these actions, as ticks are laggy
schedule function ingoodnick:mechanics/spirit_speak/speak_a 1s replace
schedule function ingoodnick:mechanics/spirit_speak/speak_b 2s replace
schedule function ingoodnick:mechanics/spirit_speak/speak_c 3s replace
schedule function ingoodnick:mechanics/spirit_speak/speak_d 4s replace

return 0