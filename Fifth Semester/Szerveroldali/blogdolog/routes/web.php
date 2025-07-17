<?php

use App\Http\Controllers\ProfileController;
use App\Models\Post;
use Illuminate\Support\Facades\Route;
use Illuminate\Http\Request;
use App\Models\Topic;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('/posts/create', function () {
    return view('posts.create');
})->name('posts.create');

Route::post('/posts/store', function (Request $request) {
    $request->validate([
        'title' => 'required|min:3|max:255',
        'desc'  => 'required|min:15|max:250',
        'author' => 'required|min:4|max:20',
        'topics' => 'required|array|min:1',
        'topics.*' => 'distinct', // azt még nem ellenőrizzük, hogy létezik-e ilyen topic!
        'content' => 'required|min:20',
        'attach_file' => 'nullable|file|mimes:txt,doc,docx,pdf,xls|max:4096',
        'attach_image' => 'nullable|file|mimes:jpg,png|max:4096'

    ], [
        'required' => 'Kötelezően kitöltendő mező :attribute , abba az attributeba behelyettesítődik, hogy "title"!',
        'name.required' => 'Ez egy specifikusabb megfogalmazás, ide beleírhatom kézzel, hogy "név".'
    ]);

    Post::create([
        'title' => $request->title,
        'desc' => $request->desc,
        'author' => $request->author,
        'topics' => json_encode($request->topics)
        //ide majd még kell 
    ]);
})->name('posts.store');

Route::get('/topics/create', function () {
    return view('topics.create');
})->name('topics.create');

Route::post('/topics/store', function (Request $request) {
    $request->validate([
        'shortname' => 'required|min:4|max:20',
        'fullname'  => 'required|min:4|max:50',
        'color'  => 'required|min:4|max:30',
    ]);

    Topic::create([
        'shortname' => $request->shortname,
        'fullname' => $request->fullname,
        'color' => $request->color,
    ]);
})->name('topics.store');

Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__ . '/auth.php';
