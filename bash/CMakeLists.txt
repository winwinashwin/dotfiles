install(FILES .alias .bashrc .env .functions .rosdev
        DESTINATION $ENV{HOME}
        PERMISSIONS OWNER_READ GROUP_READ)
