# Beat Box Project

## Project Overview
*BeatBox* is a solo project that focuses on creating functionality for a linked list data structure and playing sounds based on the data within the linked list. This project involves building a custom linked list structure and utilizing it to manage a sequence of beats that can be played back within the terminal as sound.

<br/><br/>
Since linked lists are not one of the native data structures in Ruby, this project challenged me to implement the complex functionality from scratch. This showcases my ability to design and implement data structures, manage system interactions, and create a well-organized and functional project.

### Languages, Frameworks, and Tools used:
- **Built with:** Ruby
- **Tested with:** RSpec (and Pry for spiking out solutions)
- **Tools / Workflow:** Git, GitHub

---

### Features
- **Node Class -** A simple Node class that holds data and the next node's information.
  ```
  node = Node.new("plop")
  node.data  # Returns "plop"
  node.next_node  # Returns nil
  ```
- **Linked List Class -** The LinkedList class manages the list of nodes, and it supports operations such as
  - appending
  - prepending
  - counting elements
  - popping elements
  - finding a specific number of elements by position in the linked list
  - determining if the list includes specific values
  - generating a string representation of the list
  ```
  list = LinkedList.new
  list.append("doop")
  list.head.data  # Returns "doop"
  list.count  # Returns 1
  list.to_string  # Returns "doop"
  ```
- **BeatBox Class -** The BeatBox class serves as a wrapper for the LinkedList class. It handles data formatting before passing it to the linked list, allowing multiple elements to be added at once.
  ```
  bb = BeatBox.new
  bb.append("deep doo ditt woo hoo shu")
  bb.count  # Returns 6
  bb.play  # Plays the corresponding sounds
  ```

### Challenges
- One challenge was properly formatting and parsing the input data for beats. The project involves processing strings containing beat patterns and splitting them into individual beats for insertion into the linked list, so it was difficult to ensure consistent and accurate data handling
- Implementing various linked list operations such as appending, inserting, and removing nodes can be complex. Ensuring that these operations are correctly synchronized, maintaining proper references between nodes, and handling edge cases (such as inserting at the beginning or end of the list) proved to be challenging.

### Accomplishments
- Built a Node class that forms the building blocks of the linked list. Each node contained data and a reference to the next node, enabling the chaining of beats and their organized storage.
- Successfully designed and implemented a linked list data structure from scratch. This allowed me to efficiently manage the sequence of beats and their playback order.
- Executed various linked list operations such as appending, inserting, and counting nodes. This required careful management of pointers and references to maintain the integrity of the list.
- Demonstrated a solid understanding of data structure and its implementation in an object-oriented programming context. Ultimately, gaining a deeper understanding of data structures, algorithms, and system interactions. 

---

## Setup 
For more details, feel free to explore the code and run the provided tests.
1. **Clone the Repository:** Begin by cloning this repository to your local machine using the following command:
`git clone git@github.com:westonio/Beat_box.git`
2. **Navigate to Project Directory:** Move into the project directory:
`cd Beat_box`
3. **Run the Tests:** To run the entire test suite, use the following command: `rspec spec`
