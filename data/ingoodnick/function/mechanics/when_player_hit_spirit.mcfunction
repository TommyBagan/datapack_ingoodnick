# Reset event
advancement revoke @s only ingoodnick:events/event_player_hit_spirit

execute at @e[type=vex,tag=ingoodnick_spirit] run playsound minecraft:entity.allay.hurt ambient @a ~ ~ ~ 0.5 0.2
execute at @e[type=vex,tag=ingoodnick_spirit] run particle minecraft:soul_fire_flame ~ ~ ~ 0 0 0 0.5 15 normal