Hola, guachines.

Nomás corran el comando `./build.sh` haciendo antes un `chmod +x *.sh` estando en este folder.

Si quieren pueden modificar el archivo docker-compose.yml.

En el archivo `cron.sh` pueden modificar la notificacion. Yo en este caso uso `espeak`.

####CRON
Configuren con `crontab -e` algo así como:
`
    @reboot /path-to-file/cron.sh
`

Si tienen prisas pues nomás metan en consola: `./cron.sh &` y ya estará corriedo en segundo plano.

####IMPORTANTE
Esto es para usarse sólo en un ambiente local!! No sean boludos de ponerlo en producción.
Funciona muy bien con UPTIME KUMA para obtener notificaciones de servidores.
