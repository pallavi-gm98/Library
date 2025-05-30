<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <div class="card">
            <h2>Login</h2>
            <form id="login-form">
                <div class="form-input">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" required>
                </div>
                <div class="form-input">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" required>
                </div>
                <div class="form-input captcha">
                    <label for="captcha-input">Enter Captcha</label>
                    <div class="preview" id="captcha"></div>
                    <input type="text" id="captcha-input" required>
                    <button type="button" class="captcha-refresh" onclick="generateCaptcha()" style="margin: 12px;">Refresh</button>
                </div>
                <button type="submit" id="login-btn">Login</button>
            </form>
        </div>
    </div>
    <script src="script.js"></script>
</body>
</html>


<script>

let captchaValue;

function generateCaptcha() {
    const randomChars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    captchaValue = '';
    for (let i = 0; i < 5; i++) {
        captchaValue += randomChars.charAt(Math.floor(Math.random() * randomChars.length));
    }
    document.getElementById('captcha').innerText = captchaValue;
}

document.getElementById('login-form').addEventListener('submit', function(event) {
    event.preventDefault();
    const inputCaptcha = document.getElementById('captcha-input').value;
    if (inputCaptcha === captchaValue) {
    	 window.location.href="./index";
    	 return false;
        alert('Login successful!');
        // Proceed with login
    } else {
        alert('Invalid captcha. Please try again.');
        generateCaptcha();
    }
});

// Initialize captcha on page load
window.onload = generateCaptcha;
</script>

<style>

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: Arial, sans-serif;
    background-color: #f5f5f5;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

.container {
    display: flex;
    justify-content: center;
    align-items: center;
}

.card {
    background-color: #fff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
    width: 300px;
}

.card h2 {
    text-align: center;
    margin-bottom: 20px;
}

.form-input {
    margin-bottom: 15px;
}

.form-input label {
    display: block;
    margin-bottom: 5px;
}

.form-input input {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

.captcha {
    display: flex;
    flex-direction: column;
    align-items: center;
}

.captcha .preview {
    width: 100%;
    text-align: center;
    border: 1px dashed #888;
    padding: 10px;
    margin-bottom: 5px;
    font-family: monospace;
}

.captcha-refresh {
    background-color: #4CAF50;
    color: white;
    border: none;
    padding: 5px 10px;
    border-radius: 5px;
    cursor: pointer;
}

#login-btn {
    width: 100%;
    padding: 10px;
    background-color: #4CAF50;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

</style>