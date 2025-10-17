Features
Add, update, and delete tasks
Mark tasks as complete/incomplete
Query tasks by status or priority
Modular walker and node architecture
Easily extensible for tagging, deadlines, or user-specific views

Core Concepts
This project leverages Jac’s strengths in:

Agent-based modeling: Each task is a node, and the user or system is an agent that interacts with it.
Walkers: Define behavior like adding or completing tasks.
Graphs: Tasks are stored in a graph structure, enabling flexible querying and relationships.


jac-todo/
├── todo.jac          # Main Jac file with node/walker definitions
├── test.jac          # Optional test script for trying out walkers
├── README.md         # This file
└── .gitignore        # Ignore compiled files or logs

steps
create a virtual env
    python3 -m venv jac-env
activate 
    source jac-env/bin/activate
install jac 
    pip install -U jaclang jac-cloud byllm
run 
    jac run todo.jac
