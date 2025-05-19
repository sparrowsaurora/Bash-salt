<!-- A page to contact me for jobs, to make pull requests by email and to give feedback -->
<?php 

include "../../config/database.php";

$name = $email = $body = '';
$nameErr = $emailErr = $bodyErr = '';

//check for form submit
if(isset($_POST['submit'])) {
    // validate name
    if(empty($_POST['name'])) {
        $nameErr = "Name is required";
    } else {
        $name = filter_input(INPUT_POST, 'name', FILTER_SANITIZE_FULL_SPECIAL_CHARS);
    }
    // validate email
    if(empty($_POST['email'])) {
        $emailErr = "email is required";
    } else {
        $email = filter_input(INPUT_POST, 'email', FILTER_SANITIZE_EMAIL);
    }
    // validate body
    if(empty($_POST['body'])) {
        $bodyErr = "Feedback is required";
    } else {
        $body = filter_input(INPUT_POST, 'body', FILTER_SANITIZE_FULL_SPECIAL_CHARS);
    }
        
    if(empty($nameErr) && empty($emailErr) && empty($bodyErr)) {
        // if no err add to DB
        $sql = "INSERT INTO feedback (name, email, feedback) VALUES ('$name', '$email', '$body')";
        
        if (mysqli_query($conn, $sql)) {
            // success
            header("Location: /");
            exit();
        } else {
            echo 'Error' . mysqli_error($conn);
        }
    }
}

include"../../include/header.php";
include"../../include/nav.php"; 
?>
    <main class="flex-grow flex items-center justify-center size-full flex-col">
        <div class="feedback-form bg-gray-600 mb-20">
            <!-- Goes to feedback database -->
            <form action="<?= htmlspecialchars($_SERVER['PHP_SELF']); ?>" method="POST" class="mt-4 w-75">
                <div class="mb-3">
                    <label for="name" class="form-label">Name</label>
                    <input
                        type="text"
                        class="form-control <?= !$nameErr ?: 'is-invalid'; ?>"
                        id="name"
                        name="name"
                        placeholder="Enter your name"
                    />
                    <div class="invalid-feedback">
                        <?= $nameErr; ?>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input
                        type="email"
                        class="form-control <?= !$emailErr ?: 'is-invalid'; ?>"
                        id="email"
                        name="email"
                        placeholder="Enter your email"
                    />
                    <div class="invalid-feedback">
                        <?= $emailErr; ?>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="body" class="form-label">Feedback</label>
                    <textarea
                        class="form-control <?= !$bodyErr ?: 'is-invalid'; ?>"
                        id="body"
                        name="body"
                        placeholder="Enter your feedback"
                    ></textarea>
                    <div class="invalid-feedback">
                        <?= $bodyErr; ?>
                    </div>
                </div>
                <div class="mb-3">
                    <input
                        type="submit"
                        name="submit"
                        value="Send"
                        class="btn btn-dark w-100"
                    />
                </div>
            </form>
        </div>
        <div class="contact-me">
            <!-- Emails Sparrows.au@gmail.com -->
            <form action="" method="POST"></form>
        </div>
        <a href="../../assets/Ryan_Kelley_Software_Engineer.pdf" class="my-resume">See my Resume</a>
<?php include"../../include/footer.php"; ?>