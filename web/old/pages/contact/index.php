<!-- A page to contact me for jobs, to make pull requests by email and to give feedback -->
<?php
include"../../config/database.php";
include"../../include/header.php";
include"../../include/nav.php"; 
?>
    <main class="flex-grow flex items-center justify-center size-full flex-col">
        <h2 class="font-semibold text-4xl pb-2 mt-15">Give Me Some Feedback</h2>
        <!-- Goes to feedback database -->
        <?php include"../../include/feedback_block.php"; ?>

        <h2 class="font-semibold text-4xl pb-2 mt-10">Contact me Here</h2>
        <p>If this is about potential employment:<a href="../../assets/Ryan_Kelley_Software_Engineer.pdf" class="my-resume underline pl-3">See my Resume</a></p>
        <!--Goes to contact database as to let me response on my own time :) -->
        <?php include"../../include/email_block.php"; ?>
<?php include"../../include/footer.php"; ?>