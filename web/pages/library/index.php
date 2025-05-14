<!-- a new page for small description and images of each module with subheaddings on catagory -->
<?php include"../../include/package_data.php"; ?>
<?php include"../../include/header.php"; ?>
    <?php include"../../include/nav.php"; ?>
    <main>
        <div class="catalogue">
            <!-- will be toggleable and start closed -->
        </div>
        <?php 
        foreach ($package as $title => $data) {
            $image = $data[0][0];
            $alt = $data[0][1];
            $content = $data[1];
            $summary = $data[2];

            echo <<<HTML
            <h1>$title</h1>
            <img src="../../images/$image" alt="$alt">
            <sub>$summary</sub>
            <p>$content</p>
            HTML;
        }
        ?>
    </main>
<?php include"../../include/footer.php"; ?>