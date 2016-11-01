<?php

$app = require __DIR__ . '/../app/config.php';

if ($app instanceof Silex\Application) {
    $app->run();
} else {
    echo 'Initialization failed.';
}

//use Symfony\Component\HttpFoundation\Response;

/*$app = new Silex\Application();

$app->get('/', function () use ($app) {
      return new Response('Home root');
});

$app->get("/users/{id}", function ($id) {
    return new Symfony\Component\HttpFoundation\Response("Hello world").$id;

});

$app->register(new Silex\Provider\DoctrineServiceProvider(), array(
    'db.options' => array(
        'driver'   => 'pdo_mysql',
        'host'     => '127.0.0.1',
        'dbname'   => 'vumc_test',
        'user'     => 'root',
        'password' => 'password'
    ),
));
*/
//$app['debug'] = true;

//$app->run();
