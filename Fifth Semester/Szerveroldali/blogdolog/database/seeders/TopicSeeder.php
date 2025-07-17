<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Topic;

class TopicSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $topics = (object)[
            'food' => (object)[
                'name' => 'Gastronomy',
                'color' => 'bg-red-200',
            ],/*...*/
        ];
    
        foreach ($topics as $index => $topic) {
            Topic::create([
                'shortname' => $index,
                'fullname' => $topic->name,
                'color' => $topic->color,
            ]);
        }
    }
}
