<?php

namespace App\Controller;

use App\Repository\ProductRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class ProductController extends AbstractController
{
    #[Route('/product/{id}', name: 'product.index')]
    public function index(ProductRepository $productRepository, int $id): Response
    {
        $this->denyAccessUnlessGranted('ROLE_USER');
        //$products = $repository->findAll(); 
        $products = $productRepository->findProductsByUserId($id);
        //$products = ['TV', 'Smartphone', 'Ordinateur'];
        return $this->render('product/index.html.twig', [
            'products' => $products,
            'userId' => $id,
        ]);
    }
}
