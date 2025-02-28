# from item import item

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
    task = input("enter a task ('q' to Quit)\n>> ").strip().title()
    print("")
    if task.lower() in ("q", "quit", "exit", "n"):
        quit()
    else:
        validation(task)
        

def validation(task):
    while True:
        confirmation = input(f"confirm task < {task} > (Y/n)\n>> ")
        print("")
        if confirmation.lower().startswith("n"):
            break
        elif confirmation.lower().startswith("y") or confirmation.strip() == "":
            add_task(task)
            break
        else:
            print("Not a valid input.")
            continue
    
def add_task(task):
    with open(txt, "a") as file:
        file.write(task + "\n")

def rm_task():
    task_to_remove = input("Enter a Task To Remove\n>> ")
    print("")
    with open(txt, "r") as file:
        tasks = file.readlines()
    
    with open(txt, "w") as file:
        for task in tasks:
            if task.strip() != task_to_remove:
                file.write(task)

def veiw_tasks():
    with open(txt, "r") as file:
        tasks = file.readlines()
        for task in tasks:
            print(f"\t< {task.strip()} >")
        print("")

main()