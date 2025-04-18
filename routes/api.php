<?php
   use App\Http\Controllers\PostController;
   use App\Http\Controllers\GalleryController;
   use App\Http\Controllers\BlogController;
   use App\Http\Controllers\PortfolioController;
   use App\Http\Controllers\ProjectController;

   Route::apiResource('projects', ProjectController::class);
//portfolios
Route::get('/portfolios', [PortfolioController::class, 'index']);
 // blogs
   Route::get('/blogs', [BlogController::class, 'index']);
   Route::post('/blogs', [BlogController::class, 'store']);
   Route::get('/blogs/{id}', [BlogController::class, 'show']);
   Route::put('/blogs/{id}', [BlogController::class, 'update']);
   Route::delete('/blogs/{id}', [BlogController::class, 'destroy']);
//gallery
Route::apiResource('gallery', GalleryController::class);
Route::put('/gallery/{id}', [GalleryController::class, 'update']);
   Route::apiResource('posts', PostController::class);