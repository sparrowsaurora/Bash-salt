<?php
$name = $email = $body = '';
$nameErr = $emailErr = $bodyErr = '';

if(isset($_POST['submit_email'])) {
    if(empty($_POST['name'])) {
        $nameErr = "Name is required";
    } else {
        $name = filter_input(INPUT_POST, 'name', FILTER_SANITIZE_FULL_SPECIAL_CHARS);
    }

    if(empty($_POST['email'])) {
        $emailErr = "Email is required";
    } else {
        $email = filter_input(INPUT_POST, 'email', FILTER_SANITIZE_EMAIL);
    }

    if(empty($_POST['body'])) {
        $bodyErr = "Content is required";
    } else {
        $body = filter_input(INPUT_POST, 'body', FILTER_SANITIZE_FULL_SPECIAL_CHARS);
    }

    if(empty($nameErr) && empty($emailErr) && empty($bodyErr)) {
        $sql = "INSERT INTO contact (name, email, body, timestamp) VALUES ('$name', '$email', '$body', CURRENT_TIMESTAMP)";
        if (mysqli_query($conn, $sql)) {
            header("Location: /");
            exit();
        } else {
            echo 'Error: ' . mysqli_error($conn);
        }
    }
}
?>

<div class="contact-me">
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
                    <label for="body" class="form-label">Content</label>
                    <textarea
                        class="form-control <?= !$bodyErr ?: 'is-invalid'; ?>"
                        id="body"
                        name="body"
                        placeholder="Enter your Email content"
                    ></textarea>
                    <div class="invalid-feedback">
                        <?= $bodyErr; ?>
                    </div>
                </div>
                <div class="mb-3">
                    <input
                        type="submit"
                        name="submit_email"
                        value="Send Email"
                        class="btn btn-dark w-100"
                    />
                </div>
            </form>
        </div>