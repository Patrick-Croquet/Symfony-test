<?php

namespace App\Controller;

use App\Entity\User;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Routing\Attribute\Route;

class LuckyController extends AbstractController
{
    #[Route('/', name: 'home')]
    public function index(Request $request, EntityManagerInterface $em, UserPasswordHasherInterface $hasher): Response
    {
    /*$user = new User();
    $user->setEmail('john@doe.fr')
    ->setUsername('JohnDoe')
    ->setPassword($hasher->hashPassword($user, '0000'))
    ->setRoles([]);
    $em->persist($user);
    $em->flush();*/

        return $this->render('lucky/index.html.twig', [
            'controller_name' => 'LuckyController',
        ]);
    }

    #[Route('/number')]
    public function number(): Response
    {
        $number = random_int(0, 100);
        //dd($number);

        return new Response(
            '<html><body>Lucky number: '.$number.'</body></html>'
        );
    }
}
