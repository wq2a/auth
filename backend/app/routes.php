<?php

$app->mount("/admin", new Auth\UserControllerProvider());
