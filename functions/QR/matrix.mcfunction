scoreboard players set @s qr_encode 0
execute if block ~~1~ minecraft:air [] unless block ~~2~ minecraft:air [] run clone ~~2~ ~~2~ ~~1~ masked move

execute if block ~~~ minecraft:white_concrete [] run scoreboard players add @s qr_encode 1
execute if block ~~1~ minecraft:white_concrete [] run scoreboard players add @s qr_encode -1

execute if block ~~~ minecraft:black_concrete [] run scoreboard players add @s qr_encode 2
execute if block ~~1~ minecraft:black_concrete [] run scoreboard players add @s qr_encode -2

execute if block ~~1~ minecraft:air [] run scoreboard players reset @s qr_encode 

execute if block ~~~ minecraft:air [] if block ~~1~ minecraft:white_concrete [] run scoreboard players set @s qr_encode -10
execute if block ~~~ minecraft:air [] if block ~~1~ minecraft:black_concrete [] run scoreboard players set @s qr_encode 10

execute if score @s qr_encode matches -10..10 run fill ~~~ ~~1~ minecraft:air
execute if score @s qr_encode matches !0 run setblock ~~~ minecraft:black_concrete
execute if score @s qr_encode matches 0 run setblock ~~~ minecraft:white_concrete
execute if score @s qr_encode matches -10 run setblock ~~~ minecraft:white_concrete
execute if score @s qr_encode matches 10 run setblock ~~~ minecraft:black_concrete

tp @s ~1~~ 
scoreboard players add @s qr_decode 1
execute if score mode qr_uid matches 1..3 if score @s qr_decode = @s GF_1 run tp @s ~-29~~1
execute if score mode qr_uid matches 4..6 if score @s qr_decode = @s GF_1 run tp @s ~-41~~1
execute if score mode qr_uid matches 7..9 if score @s qr_decode = @s GF_1 run tp @s ~-53~~1
execute if score mode qr_uid matches 10..12 if score @s qr_decode = @s GF_1 run tp @s ~-65~~1
execute if score mode qr_uid matches 13..15 if score @s qr_decode = @s GF_1 run tp @s ~-77~~1
execute if score mode qr_uid matches 16..18 if score @s qr_decode = @s GF_1 run tp @s ~-89~~1
execute if score mode qr_uid matches 19..21 if score @s qr_decode = @s GF_1 run tp @s ~-101~~1
execute if score mode qr_uid matches 22..25 if score @s qr_decode = @s GF_1 run tp @s ~-117~~1
execute if score mode qr_uid matches 26..30 if score @s qr_decode = @s GF_1 run tp @s ~-137~~1
execute if score mode qr_uid matches 31..35 if score @s qr_decode = @s GF_1 run tp @s ~-157~~1
execute if score mode qr_uid matches 36..40 if score @s qr_decode = @s GF_1 run tp @s ~-177~~1
execute if score @s qr_decode = @s GF_1 run scoreboard players add @s qr_encode_l 1
execute if score @s qr_decode = @s GF_1 run scoreboard players set @s qr_decode 0
execute if score @s qr_encode_l = @s GF_1 run scoreboard players set @e[name=qr_main,scores={qr_prg=19}] qr_prg 20
execute if score @s qr_encode_l = @s GF_1 as @e[name=qr_main] run scoreboard players operation time qr_uid /= "20" NUM
execute if score @s qr_encode_l = @s GF_1 as @e[name=qr_main] run tellraw @a { "rawtext": [ { "text": "\n§b§l二维码生成完毕\n§f用时： §6"},{ "score": {"name": "time", "objective": "qr_uid" }},{ "text": "S\n§l" }] }
execute if score @s qr_encode_l = @s GF_1 run kill @e[name=qr_main]
execute if score @s qr_encode_l = @s GF_1 run kill @e[name=qr_read]
execute if score @s qr_encode_l = @s GF_1 run kill @e[name=qr_decode]
execute if score @s qr_encode_l = @s GF_1 run kill @e[name=qr_split]
execute if score @s qr_encode_l = @s GF_1 run kill @e[name=qr_split_set]
execute if score @s qr_encode_l = @s GF_1 run kill @e[name=qr_split_sub]
execute if score @s qr_encode_l = @s GF_1 run kill @e[name=qr_read_sub]
execute if score @s qr_encode_l = @s GF_1 run kill @e[name=qr_matrix]

#By Baby_2016