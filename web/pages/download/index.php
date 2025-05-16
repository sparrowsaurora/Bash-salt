<!-- a dedicated download page -->
<?php 
$fun_facts = array(
    "Bash-salt is a play on words of 'Bassalt'; what I originally wanted to call this project",
    "2",
    "3",
    "4"
);

include"../../include/header.php"; 
?>
    <?php include"../../include/nav.php"; ?>
    <main style="height: 97.4vh;"> <!-- EDIT TO BE 100% of DVH -->
        <div class="flex items-center justify-center size-full">
            <div class="text-center">
                <h2 class="font-semibold text-6xl mb-5">Download Bash-salt</h2>
                <?php include"../../include/download_btn.php"; ?>
                <h3 class="mt-50 font-semibold text-3xl underline decoration-dashed">Fun Fact</h3>
                <p class="mt-5 text-lg">
                    <?= $fun_facts[array_rand($fun_facts)];?>
                </p>
            </div>
        </div>
<?php include"../../include/footer.php"; ?>