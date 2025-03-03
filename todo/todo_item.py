class item:
    def __init__(self, title, desc="", status=0):
        self.title = title
        self.desc = desc
        self.status = status

    def complete(self):
        self.status = 2

    def in_progress(self):
        self.status = 1
    
    def change_desc(self, new_desc):
        self.desc = new_desc
    
    def change_title(self, new_title):
        self.title = new_title

    def change_status(self, new_status):
        if new_status not in (1, 2, 3):
            return self
        else:
            self.status = new_status
        
    def interpret_status(status):
        if status == 0:
            return "not started"
        elif status == 1:
            return "In Progress"
        elif status == 2:
            return "Complete"
        else:
            return "Error in interpret_status()"
    
    def display(self):
        print("\t{title}\n\t{desc}\n\t{interpret_status()}")