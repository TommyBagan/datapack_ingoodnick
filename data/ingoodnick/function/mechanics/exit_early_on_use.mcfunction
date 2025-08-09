# Makes sure to give the player the ruby back.
execute if data entity @s {SelectedItem:{components:{"minecraft:custom_data":{actual_id:"constitution_ruby"}}}} run function ingoodnick:mechanics/replace_equipment {hand:mainhand}
execute if data entity @s {equipment:{offhand:{components:{"minecraft:custom_data":{actual_id:"constitution_ruby"}}}}} run function ingoodnick:mechanics/replace_equipment {hand:offhand}

# Some feedback to indicate it won't work.
playsound minecraft:block.fire.extinguish ambient @s ~ ~ ~ 0.1 1.5
title @s actionbar {translate:"item.ingoodnick.constitution_ruby.no_more_uses",fallback:"Your are at your mortal end, the jewel can empower you no more..."}

# Reset the event.
execute at @s run advancement revoke @s only ingoodnick:events/event_constitution_ruby
return 0