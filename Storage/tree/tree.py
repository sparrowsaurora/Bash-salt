import os
import sys

def generate_file_map(directory_path: str, excluded_files: list =None, gen_file: bool =False) -> str:
    """
    Generates a Markdown file map of a directory structure.

    Args:
        directory_path (str): Path to the directory.
        excluded_files (list): Files or folders to exclude. Defaults to None.
    """
    # Get the directory name for the output file
    directory_name = os.path.basename(os.path.normpath(directory_path))
    output_file = f"{directory_name}_filemap.md"

    # Set default excluded files if none are provided
    if excluded_files is None:
        excluded_files = []

    def explore_directory(path: str, level: int =0, indent: str ="    ") -> list:
        """
        Recursively explores the directory and builds the file map.

        Args:
            path (str): Current directory path.
            level (int): Depth level in the directory.
            indent (str): Indentation for formatting.

        Returns:
            list: Formatted directory structure.
        """
        structure = []
        items = [
            item for item in os.listdir(path)
            if item != ".git" and item not in excluded_files
        ]
        items = sorted(
            items,
            key=lambda x: (os.path.isdir(os.path.join(path, x)), x)
        )

        for i, item in enumerate(items):
            item_path = os.path.join(path, item)
            is_last = i == len(items) - 1
            branch = "└── " if is_last else "├── "
            next_indent = "    " if is_last else "│   "

            if os.path.isdir(item_path):
                structure.append(f"{indent}{branch}{item}/")
                structure.extend(
                    explore_directory(item_path, level + 1, indent + next_indent)
                )
            else:
                structure.append(f"{indent}{branch}{item}")

        return structure

    # Build the directory structure
    file_structure = explore_directory(directory_path)

    if gen_file:
        # Write to the Markdown file
        with open(output_file, "w", encoding="utf-8") as file:
            file.write(f"# {directory_name} : File Map\n\n")
            file.write(f"    {directory_name}/\n")
            if file_structure:
                file.write("    │\n")
            file.write("\n".join(file_structure))

        return f"File map saved to: {output_file}"
    
    print(f"# {directory_name} : File Map\n")
    print(f"    {directory_name}/")
    if file_structure:
        print("    │")
    print("\n".join(file_structure))
    return f"Done!"
    

def get_vars() -> tuple[str, list[str]]:
    if len(sys.argv) >= 3 and sys.argv[1] == "-f":
        directory = sys.argv[2]
        enable_flag = True
    elif len(sys.argv) == 2:
        directory = sys.argv[1]
        enable_flag = False
    else:
        directory = os.getcwd()
        enable_flag = False
    excluded_input = input(
        "Enter comma-separated file names to ignore (or leave blank): "
    )
    excluded_input += '.git, target'
    print(f"Excluding: {excluded_input}")
    excluded_files = (
        [file.strip() for file in excluded_input.split(",")]
        if excluded_input
        else []
    )
    return directory, excluded_files, enable_flag

def main():
    directory, excluded_files, enable_flag = get_vars()
    print(generate_file_map(directory, excluded_files, enable_flag))

main()
