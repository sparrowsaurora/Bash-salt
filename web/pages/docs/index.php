<?php include"../../include/doc_items.php"; ?>
<?php include"../../include/header.php"; ?>
    <?php include"../../include/nav.php"; ?>
    <main>
        <?php 
        foreach ($doc_items as $title => $content) {
            echo "<h1>$title</h1> : $content <br>";
        }
        ?>
    </main>
    <?php include"../../include/footer.php"; ?>