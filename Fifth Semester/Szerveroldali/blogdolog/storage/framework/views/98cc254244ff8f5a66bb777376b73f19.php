<?php if (isset($component)) { $__componentOriginal69dc84650370d1d4dc1b42d016d7226b = $component; } ?>
<?php $component = App\View\Components\GuestLayout::resolve([] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? (array) $attributes->getIterator() : [])); ?>
<?php $component->withName('guest-layout'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag && $constructor = (new ReflectionClass(App\View\Components\GuestLayout::class))->getConstructor()): ?>
<?php $attributes = $attributes->except(collect($constructor->getParameters())->map->getName()->all()); ?>
<?php endif; ?>
<?php $component->withAttributes([]); ?>
     <?php $__env->slot('title', null, []); ?> Főoldal <?php $__env->endSlot(); ?>

    <?php
        $topics = (object) [
            'food' => (object) [
                'name' => 'Gastronomy',
                'color' => 'bg-red-200',
            ],
            'family' => (object) [
                'name' => 'Family & home',
                'color' => 'bg-green-200',
            ],
            'politics' => (object) [
                'name' => 'Politics & economy',
                'color' => 'bg-blue-200',
            ],
            'menthe' => (object) [
                'name' => 'Mental health',
                'color' => 'bg-yellow-200',
            ],
        ];
        $posts = [
            (object) [
                'title' => 'My son, the dog',
                'desc' => 'This is an article about how adopting a dog transformed me into the father figure my friends knew I am, but I never thought I could become.',
                'author' => 'Bátori Gergő',
                'topics' => ['family', 'menthe'],
            ],
            (object) [
                'title' => 'How to train your dogon',
                'desc' => 'Are you unsure of what to do with your active and loud little friend? I\'m here to help you regulate your first puppy!',
                'author' => 'Pozmáni Bálint',
                'topics' => ['family', 'food'],
            ],
            (object) [
                'title' => 'Me, the dog',
                'desc' => 'Join me on my journey of self discovery, where you can learn more about the furry spirit inside you.',
                'author' => 'Etyke Áron',
                'topics' => ['menthe'],
            ],
            (object) [
                'title' => 'Cats > Dogs',
                'desc' => 'In this article we will give a theoretical proof for the absolute value of cats and dogs.',
                'author' => 'Miklósi Péter',
                'topics' => ['politics', 'family', 'food'],
            ],
            (object) [
                'title' => 'Not food: the dog',
                'desc' => 'As a passionate food guru I travel the world to find unique culinary experiences. However, in this episode I have reached my limits.',
                'author' => 'Győrffy Rezső',
                'topics' => ['food'],
            ],
            (object) [
                'title' => 'Cats > Dogs: Practical testing',
                'desc' => 'Building on the research of Péter Miklósi et.al. we will demonstrate with extensive experimenting that practice and theory do align, and cats are indeed superior to dogs.',
                'author' => 'Pécsettes Míra',
                'topics' => ['politics', 'family', 'food'],
            ],
            (object) [
                'title' => 'Oh no, this dog brumms',
                'desc' => 'How to differentiate a dog from a bear? Easy, poke it with a stick and see if you survive... or read this article, to learn some actual advice.',
                'author' => 'Debreczeny László',
                'topics' => ['family'],
            ],
        ];
    ?>

    <h1>Blog</h1>

    <div class=" py-6 ">
        <a href="<?php echo e(route('posts.create')); ?>"
            class="p-2 bg-blue-500 hover:bg-blue-900 text-white rounded-lg shadow-sm mt-4">Új bejegyzés</a>

        <a href="<?php echo e(route('topics.create')); ?>"
            class="p-2 bg-blue-500 hover:bg-blue-900 text-white rounded-lg shadow-sm mt-4">Új téma</a>
    </div>

    <div class="grid grid-cols-1 lg:grid-cols-3 gap-4">
        <?php $__currentLoopData = $posts; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $post): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            <div class="p-6 thor-post-colors flex flex-col shadow-sm rounded-lg">
                <h2 class="text-xl font-bold"><?php echo e($post->title); ?></h2>
                <p class=""><?php echo e($post->desc); ?></p>
                <p class="text-right mt-auto"><?php echo e($post->author); ?></p>
                <div class="flex flex-wrap mt-auto">
                    <?php $__currentLoopData = $post->topics; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $topic): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <span
                            class="text-xs <?php echo e($topics->$topic->color); ?> rounded-full px-2 py-1 mr-1 mb-1"><?php echo e($topics->$topic->name); ?></span>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </div>
            </div>
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
    </div>

 <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginal69dc84650370d1d4dc1b42d016d7226b)): ?>
<?php $component = $__componentOriginal69dc84650370d1d4dc1b42d016d7226b; ?>
<?php unset($__componentOriginal69dc84650370d1d4dc1b42d016d7226b); ?>
<?php endif; ?>
<?php /**PATH C:\Users\timea\Desktop\ELTE Stuff\Fifth Semester\Szerveroldali\gyak\blog-dolog\blogdolog\resources\views/welcome.blade.php ENDPATH**/ ?>