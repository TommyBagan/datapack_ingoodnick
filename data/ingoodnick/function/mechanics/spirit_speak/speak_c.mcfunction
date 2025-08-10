execute at @e[type=vex,tag=ingoodnick_spirit_c] run playsound entity.warden.heartbeat ambient @a ~ ~ ~ 0.5 0.3
execute at @e[type=vex,tag=ingoodnick_spirit_c] run particle minecraft:sonic_boom ~ ~1 ~ 0 0 0 2 1 force
execute at @e[type=vex,tag=ingoodnick_spirit_c] run effect give @a[distance=..10] blindness 5 1 true
execute if entity @e[tag=ingoodnick_spirit_c] run schedule function ingoodnick:mechanics/spirit_speak/speak_c 3s
