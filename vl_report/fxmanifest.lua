fx_version 'bodacious'
game 'gta5'

name 'Report System'
author 'Senox'
description 'Ez a script lehetővé teszi a játékosok számára, hogy jelentsék a szabálysértéseket, segítséget kérjenek vagy hibákat jelentenek be a Discord szervereden keresztül.'

ui_page 'ui/index.html'

files {
    'ui/*.*'
}

client_script 'client.lua'

server_script 'server.lua'
