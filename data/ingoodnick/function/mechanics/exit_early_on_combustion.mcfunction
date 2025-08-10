# Makes sure to give the player the item back.
$execute if data entity @s {SelectedItem:{components:{"minecraft:custom_data":{actual_id:"$(item)"}}}} run function ingoodnick:mechanics/replace_equipment {hand:mainhand,item:"ingoodnick:$(item)"}
$execute if data entity @s {equipment:{offhand:{components:{"minecraft:custom_data":{actual_id:"$(item)"}}}}} run function ingoodnick:mechanics/replace_equipment {hand:offhand,item:"ingoodnick:$(item)"}

# Basically kill the player via internal combustion!
playsound entity.generic.explode ambient @a ~ ~ ~ 0.5 0.8
particle minecraft:explosion_emitter ~ ~ ~ 0 0 0 1 1 force
effect give @s minecraft:invisibility 10 1 true
particle minecraft:soul_fire_flame ~ ~1 ~ 0 0 0 0.3 20 normal
particle minecraft:soul ~ ~1 ~ 0 0 0 0.3 10 normal
damage @s 40 ingoodnick:blood_rituals
return 0