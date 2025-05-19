<?php 
$package_name = $_GET['package'];

if (!isset($package_data[$package_name])) {
    echo "Title not found.";
} else {
    $data = $package_data[$package_name];

    // Access parts of the data; ASSUMING TREE
    $title = ucwords(strtolower("$package_name"), ".-/ ");
    $hero_image = $data[0][0]; // '../images/tree.png'
    $alt_text = $data[0][1];   // 'Tree module file-map image'
    $summary = $data[1];       // 'small summary here'
    $content = $data[2];       // 'content && how to use the commands etc.'
    $documentation = $data[3]; // 'lorem ipsum; Documentation text here'
}

include"../../include/header.php";
include"../../include/nav.php"; 
?>
    <main class="flex-grow flex items-center justify-center size-full flex-col">
        <div class="">
            <h1>$title</h1>
            <h2>$summary</h2>
            <img src="$hero_image" alt="$alt_text">
            <p>$content</p>
            <p>--------------------------------------</p>
            <h2>Documentation:</h2>
            <p>$documentation</p>
        </div>

<?php include"../../include/footer.php"; ?>