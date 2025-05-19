<?php 

//  Data structure 
//  [
//      $title => [
//          [
//              $hero_image_name, 
//              $alt_text, 
//          ],
//          $content, 
//          $summary,
//          $documentation
//      ],
//  ]

/*
Dummy Data Example:

"Test" => [
        ['test.png', ''],
        'small summary',
        'General content/infomation & how to use the commands etc.',
        'Documentation and more extensive information on commands'
    ],
*/

// add ability to use \n in here

$package_data = array(
    "Tree" => [
        ['tree.png', 'Tree module file-map image'],
        'A file mapping tool that displays a stylistic text-based display of the file map',
        'A tool that displays a map of the files in a specified directory. 
        It\'s a smooth, readable and text-based display which either shows on the terminal or saves to a file depending on the flags given. 
        // NOTE ENTER FLAG DETAILS HERE',
        'lorem ipsum; Documentation text here'
    ],

);