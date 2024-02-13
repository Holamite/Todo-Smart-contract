
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;


// Write a todo smart Contract that makes use of struct and arrays.
contract Todo{

    // Add a status of isDone using a boolean.
    bool isDone;

    struct TodoItem {
        string title;
        string description;
    }

    TodoItem[]public todoItems;
     
    
    // This contract has nothing to do with mapping.
   
    // One function should toggle the isDone status.
    // Users should be able to update title, description, isdone status and delete todo.
    // Finally, write and test with remix and hardhat.


     // Function to create a new Todo item
    function createTodo(string memory _title, string memory _description) public {
        // Create a new Todo item
          TodoItem memory todoItem;
        todoItem.title = _title;
        todoItem.description = _description;
        
        // Storing the created Todo item to an array
        todoItems.push(todoItem);
    }

    // Users should be able to update title, description,
    function updateTodo(uint _id, string memory _title, string memory _description)public{

        // Check if the id exist in the array
        require(_id < todoItems.length, "Invalid Item");

        // Retrieve the Todo from the struct using the id of the array
        TodoItem storage todo = todoItems[_id];

        // Updating the todo in the array
        todo.title = _title;
        todo.description = _description;
    }

    // // Users should be able to delete todo.
    // function deleteTodo(uint _id) public{
    //     // Check if the id exist in the array
    //     require(_id < todoItems.length, "Invalid Item");

    //     // Deleting the todo in the array using the ID
    //     delete todoItems[_id];
    // }

    function deleteTodo(uint _id) public {
        require(_id < todoItems.length, "Invalid Item");

        // Shift elements after the deleted index to the left
        for (uint i = _id; i < todoItems.length - 1; i++) {
            todoItems[i] = todoItems[i + 1];
        }
        
        // Remove the last element (which is now a duplicate) and decrease the array length
        todoItems.pop();
    }

    function status (uint id) external {
        require(id < todoItems.length, "Invalid Item");
        isDone = true; 
    }
}