<?php
// src/Controller/PaymentController.php
namespace App\Controller;

use Stripe\Stripe;
use Stripe\Checkout\Session;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;

class PaymentController extends AbstractController

{
    #[Route('/pay', name: 'app_pay')]
    public function pay(Request $request)
    {
        // ... (configuration de Stripe)

        $session = Session::create([
            'payment_method_types' => ['card'],
            'line_items' => [[
                'price_data' => [
                    'currency' => 'eur',
                    'unit_amount' => 2000,
                    'product_data' => [
                        'name' => 'Mon produit',
                    ],
                ],
                'quantity' => 1,
            ]],
            'mode' => 'payment',
            'success_url' => $this->generateUrl('app_success'),
            'cancel_url' => $this->generateUrl('app_cancel'),
        ]);

        return $this->redirect($session->url, 303);
    }
}