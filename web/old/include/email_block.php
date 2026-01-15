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
    <form action="/contact/" method="POST" class="mt-4 w-75">
        <div class="mb-3">
            <label for="name" class="mr-3">Name:</label>
            <input
                type="text"
                class="border rounded <?= !$nameErr ?: 'text-red-600 font-medium'; ?>"
                id="name"
                name="name"
                placeholder="Enter your name"
            />
            <div class="bg-red-200 rounded-lg text-center text-red-700 font-medium my-1">
                <?= $nameErr; ?>
            </div>
        </div>
        <div class="mb-3">
            <label for="email" class="mr-4">Email:</label>
            <input
                type="email"
                class="border rounded <?= !$nameErr ?: 'text-red-600 font-medium'; ?>"
                id="email"
                name="email"
                placeholder="Enter your email"
            />
            <div class="bg-red-200 rounded-lg text-center text-red-700 font-medium my-1">
                <?= $emailErr; ?>
            </div>
        </div>
        <div class="mb-3">
            <label for="body" class="form-label">Content:</label>
            <textarea
                class="border rounded w-full h-15 <?= !$nameErr ?: 'text-red-600 font-medium'; ?>"
                id="body"
                name="body"
                placeholder="Enter your email content"
            ></textarea>
            <div class="bg-red-200 rounded-lg text-center text-red-700 font-medium my-1">
                <?= $bodyErr; ?>
            </div>
        </div>
        <div class="mb-3">
            <input
                type="submit"
                name="submit_email"
                value="Send Email"
                class="w-full bg-slate-500 py-2 rounded-lg font-semibold text-white"
            />
        </div>
    </form>
</div>