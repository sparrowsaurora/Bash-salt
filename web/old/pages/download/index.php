<!-- a dedicated download page -->
<?php 
$fun_facts = array(
    "Bash-salt is a play on words of 'Bassalt'; what I originally wanted to call this project",
    "This project was originally a way to quickly add my BASH commands to any computer I used",
    "PHP is my second favourite language; I strongly dislike JavaScript. So this site is made with PHP"
);

include"../../include/header.php"; 
include"../../include/nav.php"; 
?>
<main class="flex-grow flex items-center justify-center size-full">
    <div class="text-center">
        <h2 class="font-semibold text-6xl mb-5">Download Bash-salt</h2>
        <?php include"../../include/download_btn.php"; ?>
        <h3 class="mt-50 font-semibold text-3xl underline decoration-dashed">Fun Fact</h3>
        <p class="mt-3 text-lg">
            <?= $fun_facts[array_rand($fun_facts)];?>
        </p>
    </div>
<?php include"../../include/footer.php"; ?>