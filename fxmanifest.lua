fx_version 'cerulean'

author 'Wuski4'
description 'Ox Inventory weapon serial number scratch'
game 'gta5'
credits 'https://github.com/KevinGirardx/kevin-weaponscratch'

lua54 'yes'

shared_scripts {
	'@ox_lib/init.lua',
}

client_scripts {
	'client/*.lua',
}

server_scripts {
	'server/*.lua',
}


dependencies {
    'ox_lib',
    'ox_inventory'
}