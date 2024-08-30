
fx_version 'adamant'
game 'gta5'

author 'NOTHING'
description 'Blackout System'
version '1.0.0'

lua54 "yes"

client_scripts {
    'client.lua'
}

server_scripts {
    'server.lua'
}

shared_scripts {
    'config.lua',
    '@ox_lib/init.lua'
}

files {
    'web/*'
}