<?php
header("HTTP/1.1 200 OK");
$pipe_route = '/var/www/html/pipe/pipe';
$pipe_original_route = '/var/www/html/pipe_original';

if (!file_exists($pipe_route)) {
    exec("chmod -R 777 /var/www/html/pipe");
    exec("mkfifo $pipe_route");
}
$is_post = $_POST['data']??false !== false;
$is_get = !$is_post;
if ($is_post) {
    $mensaje = $_POST['data']??null;
} else {
    $mensaje = $_GET['mensaje']??null;
}
if ($mensaje) {
    if ($is_post) {
        try {
            $detalle = json_decode($mensaje, JSON_OBJECT_AS_ARRAY);
            $mensaje = $detalle['msg']??'ERROR Desconocido';
        } catch (\Exception $e) {
            //
        }
    }
    echo "Recibido nuevo mensaje: $mensaje";
    exec("echo $mensaje > $pipe_route");
    exit;
}
//exec("echo $mensaje > $pipe_route");
//echo 'Bye';
exit;