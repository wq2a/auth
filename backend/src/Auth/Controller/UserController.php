<?php
namespace Auth\Controller;

use Silex\Application;
use Silex\ControllerProviderInterface;

class UserController {//implements ControllerProviderInterface {
/*
    public function connect(Application $app)
    {
        $users = $app["controllers_factory"];

        $users->get("/", "Auth\\Controller\\UserController::home");
        $users->get("/admin", "Auth\\Controller\\UserController::test");
        //$users->get("/user", "Auth\\Controller\\UserController::index");
        //$users->post("/", "Auth\\Controller\\UserController::store");
        //$users->get("/{id}", "Auth\\Controller\\UserController::show");
        //$users->get("/edit/{id}", "Auth\\Controller\\UserController::edit");
        //$users->put("/{id}", "Auth\\Controller\\UserController::update");
        //$users->delete("/", "Auth\\Controller\\UserController::destory");

        return $users;

    }
*/
    public function home(Application $app)
    {
        $query = $app['db']->fetchAll('select * from test');
        return $app->json($query);
//        return $app['security']->getToken()->getUser()->getUsername();
    }

    public function test(Application $app) 
    {
        return 'ok';
    }

}
