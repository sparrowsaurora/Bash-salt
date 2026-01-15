<?php include "../../include/package_data.php"; ?>
<?php include "../../include/header.php"; ?>
<?php include "../../include/nav.php"; ?>
<main class="flex-grow flex items-center justify-center size-full flex-col">
    <h1 class="font-semibold text-7xl ml-3 pt-30 pb-10">The Docs</h1>
    <!-- <div>
            aside search bar like navigation in ms word
        </div> -->
    <!-- make this display 2 columns to take more page space on larger screens -->
    <?php
    foreach ($package_data as $title => $data) {
        $title = ucwords(strtolower("$title"), ".-/ ");
        $summary = $data[1];
        $documentation = $data[3];

        echo <<<HTML
            <div class="flex m-2 px-10 h-50 w-1/2 border-b"> <!-- Potentially a link to the package page? -->
                <!-- <img src="" alt=""> potentially add 50 x 50 image for each file-->
                <div class="flex items-start justify-end h-full flex-col pb-5"> 
                    <h2 class="font-semibold text-4xl ml-3">Package > '$title'</h2>
                    <sub class="text-xl ml-3 mb-5 font-extralight underline decoration-gray-500">$summary</sub>
                    <p class="ml-3">$title's Documentation:</p>
                    <p class=" ml-3 mb-3">$documentation</p>
                </div> 
            </div>
            HTML;
    }
    ?>
    <?php include "../../include/footer.php"; ?>