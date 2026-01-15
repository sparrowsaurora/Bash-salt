<!-- a new page for small description and images of each module with subheaddings on catagory -->
<?php include"../../include/package_data.php"; ?>
<?php include"../../include/header.php"; ?>
    <?php include"../../include/nav.php"; ?>
    <main class="flex-grow flex items-center justify-center size-full flex-col">
        <h1 class="font-semibold text-6xl ml-3 pt-30 pb-5">The Library</h1>
    <!-- <div class="catalogue text-center">
            will be toggleable and start closed
        </div> -->
        <?php 
        foreach ($package_data as $title => $data) {
            $title = ucwords(strtolower("$title"), ".-/ ");
            $image = '../../images/' . $data[0][0];
            if(!file_exists($image)) {
                $image = '../../images/default.png';
            }
            $alt = $data[0][1];
            if($alt == "") {
                $alt = "No image attached to project: $title";
            }
            $summary = $data[1];
            $content = $data[2];


            echo <<<HTML
            <div class="flex m-10 h-50 w-1/2"> <!-- Potentially a link to the package page? -->
                <img src="$image" alt="$alt" class="h-full rounded-xl">
                <div class="flex items-start justify-end h-full flex-col pb-5"> 
                    <h2 class="font-semibold text-5xl ml-3 underline">$title</h2>
                    <sub class="text-xl ml-3 mb-3">$summary</sub>
                    <p class="font-extralight ml-3">$content</p>
                </div> 
            </div>
            HTML;
        }
        ?>
<?php include"../../include/footer.php"; ?>