fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'qbx_hint'
author 'supernoob indonesia'
description 'Lightweight world-space info hints (markers + hint panel) - free for the Qbox community'
version '1.1.0'
repository 'https://github.com/Supernoob-id/qbx_hint'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
}

client_script 'client/main.lua'

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/script.js',
    'html/icons/*',
}

dependency 'ox_lib'
