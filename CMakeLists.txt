cmake_minimum_required(VERSION 3.18)

project(dotfiles)

add_subdirectory(bash)
add_subdirectory(misc)
add_subdirectory(nvim)

install(FILES crontab 
        DESTINATION /etc/cron.d
        PERMISSIONS OWNER_READ GROUP_READ
        RENAME ashwin_utils)
