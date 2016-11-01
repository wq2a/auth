<?php

namespace Auth\Model\Entity;

use Symfony\Component\Security\Core\User\AdvancedUserInterface,
    Doctrine\ORM\Mapping as ORM;

class User implements AdvancedUserInterface
{

    private $id;
    private $email;
    private $username = '';
    private $password = '';
    private $roles = '';
    private $isActive;

    public function __construct($id, $username, $email, $password,
        array $roles = array(), $enabled = true, $userNonExpired = true,
        $credentialsNonExpired = true, $userNonLocked = true)
    {
        if(empty($email))
        {
            //throw new \InvalidArgumentException('The email cannot be empty.');
        }
        else if(empty($password))
        {
            throw new \InvalidArgumentException('Password cannot be empty.');
        }

        $this->id = $id;
        $this->username = $username;
        $this->email = $email;
        $this->password = $password;
        $this->enabled = $enabled;
        $this->accountNonExpired = $userNonExpired;
        $this->credentialsNonExpired = $credentialsNonExpired;
        $this->accountNonLocked = $userNonLocked;
        $this->roles = $roles;
        $this->isActive = $enabled;
    }

    public function getId()
    {
        return $this->id;
    }

    public function getEmail()
    {
        return $this->email;
    }

    public function getUsername()
    {
        return $this->username;
    }

    public function getSalt()
    {
        return null;
    }

    public function getPassword()
    {
        return $this->password;
    }

    public function getRoles()
    {
        return $this->roles;
    }

    public function isAccountNonExpired()
    {
        return true;
    }

    public function isAccountNonLocked()
    {
        return true;
    }

    public function isCredentialsNonExpired()
    {
        return true;
    }

    public function isEnabled()
    {
        return $this->isActive;
    }

    public function eraseCredentials() { }

    public function getIsActive()
    {
        return $this->isActive;
    }

    public function setEmail($email)
    {
        $this->email = $email;
        return $this;
    }

    public function setUsername($username)
    {
        $this->username = $username;
        return $this;
    }

    public function setPassword($password)
    {
        $this->password = $password;
        return $this;
    }

    public function setRoles($roles)
    {
        $this->roles = $roles;
        return $this;
    }

    public function setIsActive($isActive)
    {
        $this->isActive = $isActive;
        return $this;
    }
}
