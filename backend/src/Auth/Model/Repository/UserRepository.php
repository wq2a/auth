<?php

namespace Auth\Model\Repository;

use Symfony\Component\Security\Core\Exception\UsernameNotFoundException,
    Symfony\Component\Security\Core\Exception\UnsupportedUserException,
    Symfony\Component\Security\Core\User\UserProviderInterface,
    Symfony\Component\Security\Core\User\UserInterface,
    Doctrine\ORM\NoResultException,
    Doctrine\ORM\EntityRepository,
    App\Model\Entity\User;

class UserRepository extends EntityRepository implements UserProviderInterface
{

    public function loadUserByUsername($username)
    {
        $q = $this->createQueryBuilder('u')
            ->where('u.username = :username OR u.email = :email')
            ->setParameter('username', $username)
            ->setParameter('email', $username)
            ->getQuery();
        try
        {
            $user = $q->getSingleResult();
        }
        catch (NoResultException $e)
        {
            throw new UsernameNotFoundException(
                sprintf('Username "%s" does not exist.', $username));
        }
        return new User($user->getId(), $user->getUsername(), 
            $user->getEmail(), $user->getPassword(), 
            explode(',', $user->getRoles()), $user->isEnabled(), 
            true, true, true);
    }

    public function loadUserById($id)
    {
        return $this->findOneBy(array('id' => $id));
    }

    public function refreshUser(UserInterface $user)
    {
        if (!$user instanceof User)
        {
            throw new UnsupportedUserException(
                sprintf('Instances of "%s" are not supported.', 
                get_class($user)));
        }
        return $this->loadUserByUsername($user->getEmail());
    }

    public function supportsClass($class)
    {
        return $class === 'Symfony\Component\Security\Core\User\User';
    }

}
