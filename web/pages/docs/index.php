<?php include"../../include/package_data.php"; ?>
<?php include"../../include/header.php"; ?>
    <?php include"../../include/nav.php"; ?>
    <main>
        <?php 
        foreach ($package as $title => $data) {
            $content = $data[1];
            echo "<h1>$title</h1><br>$content";
        }
        ?>
    </main>
<?php include"../../include/footer.php"; ?>