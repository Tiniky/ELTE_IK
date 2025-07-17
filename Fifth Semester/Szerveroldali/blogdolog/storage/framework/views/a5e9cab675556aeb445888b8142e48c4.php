<?php if (isset($component)) { $__componentOriginal69dc84650370d1d4dc1b42d016d7226b = $component; } ?>
<?php $component = App\View\Components\GuestLayout::resolve([] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? (array) $attributes->getIterator() : [])); ?>
<?php $component->withName('guest-layout'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag && $constructor = (new ReflectionClass(App\View\Components\GuestLayout::class))->getConstructor()): ?>
<?php $attributes = $attributes->except(collect($constructor->getParameters())->map->getName()->all()); ?>
<?php endif; ?>
<?php $component->withAttributes([]); ?>
     <?php $__env->slot('title', null, []); ?> Új bejegyzés <?php $__env->endSlot(); ?>

    <h1>Új bejegyzés</h1>

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
    ?>

    <form class="flex flex-col gap-4" action="<?php echo e(route('posts.store')); ?>" method="POST">
        <?php echo csrf_field(); ?>
        <label for="title">Cím</label>
        <input type="text" name="title" id="title" class="thor-input-field" value="<?php echo e(old('title', '')); ?>">
        <?php $__errorArgs = ['title'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
            <div class="text-red-500">Cím hiba: <?php echo e($message); ?></div>
        <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>

        <label for="desc">Leírás</label>
        <textarea name="desc" id="desc" cols="30" rows="5" class="thor-input-field"><?php echo e(old('desc', '')); ?></textarea>
        <?php $__errorArgs = ['desc'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
            <div class="text-red-500">Leírás hiba: <?php echo e($message); ?></div>
        <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>

        <label for="author">Szerző</label>
        <input type="text" name="author" id="author" class="thor-input-field" value="<?php echo e(old('author', '')); ?>">
        <?php $__errorArgs = ['author'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
            <div class="text-red-500">Szerző hiba: <?php echo e($message); ?></div>
        <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>

        <label for="topics">Témák</label>
        <?php $__currentLoopData = $topics; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $index => $topic): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            <div class="flex items-center gap-2">
                <input type="checkbox" name="topics[]" id="topic-<?php echo e($index); ?>" value="<?php echo e($index); ?>"
                    class="thor-checkbox-field" <?php if(in_array($index, old('topics') ?? [])): echo 'checked'; endif; ?>>
                <label for="topic-<?php echo e($index); ?>"
                    class="text-sm text-gray-900 <?php echo e($topic->color); ?> rounded-full px-2 py-1 mr-1 mb-1"><?php echo e($topic->name); ?></label>
            </div>
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        <?php $__errorArgs = ['topics'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
            <div class="text-red-500">Téma hiba: <?php echo e($message); ?></div>
        <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
        <?php $__errorArgs = ['topics.*'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
            <div class="text-red-500">Téma hiba: <?php echo e($message); ?></div>
        <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>

        <label for="content">Tartalom</label>
        <textarea name="content" id="content" cols="30" rows="10" class="thor-input-field"><?php echo e(old('content', '')); ?></textarea>
        <?php $__errorArgs = ['content'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
            <div class="text-red-500">Tartalom hiba: <?php echo e($message); ?></div>
        <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>

        <label for="attach_file">Csatolmány</label>
        <input type="file" name="attach_file" id="attach_file" class="thor-input-field">
        <?php $__errorArgs = ['attach_file'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
            <div class="text-red-500">File hiba: <?php echo e($message); ?></div>
        <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>

        <label for="attach_image>">Borítókép</label>
        <input type="file" name="attach_image" id="attach_image" class="thor-input-field">
        <?php $__errorArgs = ['attach_image'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
            <div class="text-red-500">Kép hiba: <?php echo e($message); ?></div>
        <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>

        <button type="submit" class="p-2 bg-blue-500 hover:bg-blue-900 text-white rounded-lg shadow-sm">Küldés</button>
    </form>
 <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginal69dc84650370d1d4dc1b42d016d7226b)): ?>
<?php $component = $__componentOriginal69dc84650370d1d4dc1b42d016d7226b; ?>
<?php unset($__componentOriginal69dc84650370d1d4dc1b42d016d7226b); ?>
<?php endif; ?>
<?php /**PATH C:\Users\timea\Desktop\ELTE Stuff\Fifth Semester\Szerveroldali\gyak\blog-dolog\blogdolog\resources\views/posts/create.blade.php ENDPATH**/ ?>