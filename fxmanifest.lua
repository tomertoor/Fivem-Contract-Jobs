fx_version 'adamant'

game 'gta5'

description 'ESX Status'

version 'legacy'


server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'config.lua',
	'server/server.lua'
}

client_scripts {
	'config.lua',
	'client/main.lua',
	'client/utils.lua',
	'client/ui.lua'
}

ui_page 'html/ui.html'

files {
	'html/*.*'
}