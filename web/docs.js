document.addEventListener("DOMContentLoaded", () => {
  loadDocumentation();
});

const package_data = {
  // Tree: {
  //   image: {
  //     src: "tree.png",
  //     alt: "Tree module file-map image",
  //   },
  //   shortDescription:
  //     "A file mapping tool that displays a stylistic text-based display of the file map",
  //   docs:
  //     "A tool that displays a map of the files in a specified directory. It's a smooth, readable and text-based display which either shows on the terminal or saves to a file depending on the flags given.",
  // },
  Speedtest: {
    image: {
      src: "speedtest.png",
      alt: "Speedtest module image",
    },
    shortDescription:
      "A simple internet speed testing tool that uses the download speed of a 10MB file to test your connection",
    docs:
      "It provides download and upload speeds, as well as ping times. You can run the test directly from the terminal and view the results instantly.\
      <br />Run using the command `speedtest` to see your internet speed metrics.",
  },
  Uptime: {
    image: {
      src: "uptime.png",
      alt: "Uptime module image",
    },
    shortDescription:
      "A lightweight website uptime monitoring tool that periodically checks a URL and reports availability over time.",
    docs:
      "This tool continuously pings a specified website at a configurable interval and tracks its uptime percentage based on successful HTTP responses. \
      It validates URLs, reports live status updates, and calculates uptime over repeated checks. \
      <br />Run using the command `uptime_monitor &lt;url&gt; --interval &lt;minutes&gt;` to begin monitoring a website directly from the terminal.",
  },
  OnStartup: {
    image: {
      src: "onstartup.png",
      alt: "On startup greeting module image",
    },
    shortDescription:
      "A startup greeting utility that displays a personalized welcome message and the current time.",
    docs:
      "This tool reads user profile data from a local configuration file and displays a personalized welcome message when the program starts. \
      It also shows the current local time using a clean, formatted output with terminal styling. \
      <br />Designed to be run automatically on startup or manually from the terminal to provide a friendly, informative greeting.",
  },
  Wordle: {
    image: {
      src: "wordle.png",
      alt: "Word guessing game module image",
    },
    shortDescription:
      "A terminal-based Wordle-style word guessing game with colored feedback and duplicate letter handling.",
    docs:
      "This game challenges players to guess a hidden 5-letter word within six attempts. \
      After each guess, letters are color-coded to indicate correctness: green for correct letters in the correct position, yellow for correct letters in the wrong position, and red for letters not in the word. \
      <br />It features input validation, help instructions, accurate handling of duplicate letters, and a running display of past guesses. \
      The game is played entirely in the terminal using ANSI color codes for a clean, interactive experience.",
  },
};

function loadDocumentation() {
    const docsLoop = document.getElementById("docs-loop");

    if (!docsLoop) {
        console.error("docs-loop element not found");
        return;
    }

    docsLoop.innerHTML = "";

    Object.entries(package_data).forEach(([name, data]) => {
        const docElement = document.createElement("div");

        // TODO: Add image support later

        docElement.className = "p-6";

        docElement.innerHTML = `
        <h3 class="mb-2 text-2xl font-semibold">${name}</h3>

        <p class="mb-2 ">
            ${data.shortDescription}
        </p>

        <p class="text-sm">
            ${data.docs}
        </p>
        `;

        docsLoop.appendChild(docElement);
    });
}
