<?php include"include/header.php"; ?>
    <?php include"include/nav.php"; ?>
    <main class="bg-slate-500 text-white text-center">

        <header class="flex w-full h-170">
            <!-- -w-3/2 -->
            <div class="p-40 w-full">
                <h1 class="text-7xl font-semibold">Bash-Salt</h1>
                <h3 class="text-xl m-4 mt-0">A BASH terminal extension to add a few extra commands</h3>
                <?php include"./include/download_btn.php"; ?>
            </div>
            <!-- <aside class="w-full">
                <img src="placeholder" alt="placeholder" class="border-1 rounded">
            </aside> -->
        </header>

        <div class="what-it-is">
            <h2 class="text-5xl font-semibold mb-5">What is it?</h2>
            <div class="flex text-stone-700">
                <div class="rounded-lg h-50 w-3/7 grow ml-50 mr-15 mb-10 bg-gray-300 font-bold text-xl">
                    <!-- Dot points about what this project is -->
                     <div class="h-full m-5 rounded-lg">
                        <p class="m-px p-3 rounded-xl hover:bg-sky-100">A collection of new tools for the terminal</p>
                        <p class="m-px p-3 rounded-xl hover:bg-sky-100">A solution to inefficient development</p>
                        <p class="m-px p-3 rounded-xl hover:bg-sky-100">Some fun tools for the terminal like wordle</p>
                    </div>
                </div>
                <div class="rounded-lg h-50 w-3/7 grow mr-50 ml-15 mb-10 bg-gray-300 font-bold text-xl">
                    <div class="h-full m-5 rounded-lg">
                        <p class="m-px p-3 rounded-xl hover:bg-sky-100">A tool to streamline development</p>
                        <p class="m-px p-3 rounded-xl hover:bg-sky-100">A collection of BASH shortcuts</p>
                        <p class="m-px p-3 rounded-xl hover:bg-sky-100">A project to put on my resume</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="why py-15">
            <h2 class="text-5xl font-semibold">Why I Made It</h2>
            <p class="text-xl mt-5">
                I made Bash-salt originally a way to streamline my development process,<br>
                but slowly it got bigger and bigger and it got harder and harder to set-up on different computers.<br>
                So i decided to make a tool that would automatically set up my shortcuts and tools on any new pc with a single download.<br>
                Eventually I realised if it's a useful too for me, it might help other developers.<br>
                And here we are on a website I built to share my project more freely
            </p>
        </div>

        <div class="about-me mb-15">
            <h2 class="text-5xl font-semibold pb-3">About the Dev</h2>
            <h2 class="text-3xl py-2">Hi, I'm Sparrow</h2>
            <h3 class="text-xl font-semibold pb-2">Programmer // Content Creator // Entrepreneur</h3>

            <p class="text-xl">
                I'm a software developer and content creator with interests in mechatronics, machine learning and building functional projects.<br>
                I'm currently studying a Diploma of Advanced programming at TAFE, and Mechatronics in my free time.<br>
                My goal is to study at MIT and develop projects that give people more access to the world.<br>
            </p>
            <a href="/contact/">Contact me here</a>
        </div>

        <div class="final-cta">
            <h2 class="text-5xl font-semibold">Last chance... I promise it's not that bad</h2>
            <?php include"./include/download_btn.php"; ?>
        </div>

        <div class="feedback flex py-15 items-center justify-center">
            <h2 class="text-4xl font-semibold mr-5">Give me some feedback</h2>
            <a href="/contact/" class="p-5 rounded-lg bg-gray-700 ml-5">think of a funny remark</a>
        </div>
<?php include"include/footer.php"; ?>