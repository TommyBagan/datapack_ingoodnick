execute at @e[type=vex,tag=ingoodnick_spirit_d] run playsound entity.warden.heartbeat ambient @a ~ ~ ~ 0.5 0.4
execute at @e[type=vex,tag=ingoodnick_spirit_d] run particle minecraft:sonic_boom ~ ~1 ~ 0 0 0 2 1 force
execute at @e[type=vex,tag=ingoodnick_spirit_d] run effect give @a[distance=..10] blindness 5 1 true
execute if entity @e[tag=ingoodnick_spirit_d] run schedule function ingoodnick:mechanics/spirit_speak/speak_d 3s
