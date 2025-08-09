# Reset the event.
execute at @s run advancement revoke @s only ingoodnick:events/event_constitution_ruby

# Records player HP as an integer.
scoreboard players set @s ingoodnick_player_hp 0
execute store result score @s ingoodnick_player_hp run attribute @s max_health base get 1

# If the player has more than 20 hearts, they can't use the ruby anymore so we back out early.
execute if score @s ingoodnick_player_hp matches 40.. run function ingoodnick:mechanics/exit_early_on_use
execute if score @s ingoodnick_player_hp matches 40.. run return 0

# We boost player HP by 2 for each ruby. Note I would typically use a macro here, but that would require
# putting the player's HP in storage. Given storage is global and unlocked, this could cause strange
# race conditions. The match clauses here also fix any potential bounds issues.
execute if score @s ingoodnick_player_hp matches 1..6 run function ingoodnick:mechanics/set_hp {hp:8,damage:5}
execute if score @s ingoodnick_player_hp matches 7..8 run function ingoodnick:mechanics/set_hp {hp:10,damage:7}
execute if score @s ingoodnick_player_hp matches 9..10 run function ingoodnick:mechanics/set_hp {hp:12,damage:9}
execute if score @s ingoodnick_player_hp matches 11..12 run function ingoodnick:mechanics/set_hp {hp:14,damage:11}
execute if score @s ingoodnick_player_hp matches 13..14 run function ingoodnick:mechanics/set_hp {hp:16,damage:13}
execute if score @s ingoodnick_player_hp matches 15..16 run function ingoodnick:mechanics/set_hp {hp:18,damage:15}
execute if score @s ingoodnick_player_hp matches 17..18 run function ingoodnick:mechanics/set_hp {hp:20,damage:17}
execute if score @s ingoodnick_player_hp matches 19..20 run function ingoodnick:mechanics/set_hp {hp:22,damage:19}
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
execute if score @s ingoodnick_player_hp matches 40 run title @s actionbar {translate:"item.ingoodnick.constitution_ruby.no_more_uses",fallback:"Your are at your mortal end, the jewel can empower you no more..."}

# Has some perceptive effects when the player uses the ruby.
playsound minecraft:entity.warden.heartbeat ambient @s ~ ~ ~ 1 0.5
effect give @s minecraft:darkness 4 100 true
effect give @s minecraft:nausea 5 1 true
execute at @s run particle minecraft:crit ~ ~1 ~ 0 0 0 1 60
playsound minecraft:particle.soul_escape block @s ~ ~ ~10
playsound minecraft:particle.soul_escape block @s ~ ~ ~-10
playsound minecraft:particle.soul_escape block @s ~10 ~ ~
playsound minecraft:particle.soul_escape block @s ~-10 ~ ~

return 0