document.addEventListener("DOMContentLoaded", () => {
  loadDocumentation();
});

const package_data = {
  Tree: {
    image: {
      src: "tree.png",
      alt: "Tree module file-map image",
    },
    shortDescription:
      "A file mapping tool that displays a stylistic text-based display of the file map",
    docs:
      "A tool that displays a map of the files in a specified directory. It's a smooth, readable and text-based display which either shows on the terminal or saves to a file depending on the flags given.",
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
        /*
        <div class="flex m-2 px-10 h-50 w-1/2 border-b"> <!-- Potentially a link to the package page? -->
            <!-- <img src="" alt=""> potentially add 50 x 50 image for each file-->
            <div class="flex items-start justify-end h-full flex-col pb-5"> 
                <h2 class="font-semibold text-4xl ml-3">Package > '$title'</h2>
                <sub class="text-xl ml-3 mb-5 font-extralight underline decoration-gray-500">$summary</sub>
                <p class="ml-3">$title's Documentation:</p>
                <p class=" ml-3 mb-3">$documentation</p>
            </div> 
        </div>
        */
        

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
