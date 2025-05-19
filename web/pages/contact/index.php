<!-- A page to contact me for jobs, to make pull requests by email and to give feedback -->
<?php
include"../../config/database.php";
include"../../include/header.php";
include"../../include/nav.php"; 
?>
    <main class="flex-grow flex items-center justify-center size-full flex-col">
        <h2>Give Feedback</h2>
        <!-- Goes to feedback database -->
        <?php include"../../include/feedback_block.php"; ?>
        
        <h2>Email Me</h2>
        <!--Goes to contact database as to let me response on my own time :) -->
        <?php include"../../include/email_block.php"; ?>
        <a href="../../assets/Ryan_Kelley_Software_Engineer.pdf" class="my-resume">See my Resume</a>
<?php include"../../include/footer.php"; ?>