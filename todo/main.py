from todo_item import item

txt = "C:/Users/Sparrow/Documents/GitHub/Bash-salt/todo/items.txt"

def main():
    while True:
        command = input("a (add) / rm (remove) / v (veiw)\n>> ").lower().strip()
        if command == "a":
            print("")
            ask_for_task()
        elif command == "rm":
            print("")
            rm_task()
        elif command == "v":
            print("")
            veiw_tasks()
        else:
            continue
   
def ask_for_task():
    # add ability to use flaggs to add a description
    task = input("enter a task ('q' to Quit)\n>> ").strip().lower()
    print("")
    if task.lower() in ("q", "quit", "exit", "n"):
        quit()

    # Check if -m is used
    if " -m " in task:
        parts = task.split(' -m ', 1)
        title = parts[0].strip().title()
        desc = parts[1].strip()
        task_item = item(title, desc)
    else:
        title = task.strip().title()
        task_item = item(title)

    validation(task_item.title, task_item.desc, task_item.status)
        

def validation(title, description, status):
    if description:
        input_description = f"< {description} >"
    while True:
        confirmation = input(f"confirm task < {title} > {input_description if description else ''} (Y/n)\n>> ")
        print("")
        if confirmation.lower().startswith("n"):
            break
        elif confirmation.lower().startswith("y") or confirmation.strip() == "":
            add_task(title, description, status)
            break
        else:
            print("Not a valid input.")
            continue
    
def add_task(title, desc, status):
    with open(txt, "a") as file:
        file.write(f"{title}/b/{desc}/b/{status}\n")

def rm_task():
    task_to_remove = ""
    while type(task_to_remove) != int:
        task_to_remove = input("Enter a Task (number) To Remove\n>> ")

        try:
            task_to_remove = int(task_to_remove)
        except ValueError:
            print("Invalid input. Please enter a valid task number.")
            continue

        with open(txt, "r") as file:
            tasks = file.readlines()

        if task_to_remove < 1 or task_to_remove > len(tasks):
            print("Invalid task number.")
            continue

    print("")
    
    with open(txt, "w") as file:
        i = 1
        for task in tasks:
            if i != task_to_remove:
                file.write(task)
            i += 1

def veiw_tasks():
    with open(txt, "r") as file:
        tasks = file.readlines()
        index = 0
        for task in tasks:
            index += 1
            part = task.strip().split("/b/")
            print(f"\t{index}: < {part[0]} >\n\t< {part[1] if part[1] != "" else '--No Description--'} >\n\t< status: {part[2]} >\n")

main()