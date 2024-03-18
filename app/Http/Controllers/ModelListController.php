<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\File;
use Illuminate\Support\Str;

class ModelListController extends Controller
{
    public function listModels()
    {
        $appPath = app_path(). '\Models';
        $files = File::allFiles($appPath );

        $modelClasses = [];

        foreach ($files as $file) {
            $content = file_get_contents($file->getPathname());
            $namespace = $this->getNamespace($content);

            if (Str::startsWith($namespace, 'App\\') && preg_match('/class\s+(\w+)\s+extends\s+Model/', $content, $matches)) {
                $modelClasses[] = $matches[1];
            }
        }

        return response()->json(['model_classes' => $modelClasses]);
    }

    protected function getNamespace($content)
    {
        preg_match('/namespace\s+([^\s;]+)/', $content, $matches);

        return $matches[1] ?? '';
    }
}
