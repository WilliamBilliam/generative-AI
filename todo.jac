node TodoItem {
    has title: str;
    has completed: bool = False;
}

node TodoList {
    has items: list[TodoItem] = [];
}

walker add_todo {
    has title: str;
    
    can add_item with TodoList entry {
        new_item = TodoItem(title=self.title);
        here.items.append(new_item);
        print(f"Added: {self.title}");
    }
}

walker list_todos {
    can show_all with TodoList entry {
        if len(here.items) == 0 {
            print("No todos yet!");
        } else {
            print("\n=== Todo List ===");
            i = 0;
            for item in here.items {
                status = "✓" if item.completed else " ";
                print(f"{i+1}. [{status}] {item.title}");
                i += 1;
            }
        }
    }
}

walker complete_todo {
    has index: int;
    
    can mark_complete with TodoList entry {
        if self.index >= 0 and self.index < len(here.items) {
            here.items[self.index].completed = True;
            print(f"Completed: {here.items[self.index].title}");
        } else {
            print("Invalid todo index!");
        }
    }
}

walker delete_todo {
    has index: int;
    
    can remove_item with TodoList entry {
        if self.index >= 0 and self.index < len(here.items) {
            removed = here.items.pop(self.index);
            print(f"Deleted: {removed.title}");
        } else {
            print("Invalid todo index!");
        }
    }
}

# Main execution
with entry {
    todo_list = TodoList();
    
    # Add some todos
    add_todo(title="Buy groceries") spawn todo_list;
    add_todo(title="Write Jac code") spawn todo_list;
    add_todo(title="Exercise") spawn todo_list;
    
    # List all todos
    list_todos() spawn todo_list;
    
    # Complete a todo (index 1 = second item)
    complete_todo(index=1) spawn todo_list;
    
    # List todos again
    list_todos() spawn todo_list;
    
    # Delete a todo (index 0 = first item)
    delete_todo(index=0) spawn todo_list;
    
    # Final list
    list_todos() spawn todo_list;
}