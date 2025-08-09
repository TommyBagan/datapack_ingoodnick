$execute as @s run attribute @s max_health base set $(hp)
$title @s title {translate:"message.ingoodnick.$(hp)", fallback:"Pain.", color:"red",shadow_color:-2565120,bold:true}
$damage @s $(damage) ingoodnick:blood_rituals