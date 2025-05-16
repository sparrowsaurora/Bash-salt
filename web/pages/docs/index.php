<?php include"../../include/package_data.php"; ?>
<?php include"../../include/header.php"; ?>
    <?php include"../../include/nav.php"; ?>
    <main class="flex-grow flex items-center justify-center size-full flex-col">
        <?php 
        foreach ($package as $title => $data) {
            $content = $data[1];
            echo "<h1>$title</h1><br>$content";
        }
        ?>
<?php include"../../include/footer.php"; ?>