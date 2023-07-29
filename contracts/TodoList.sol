// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract TodoList {

    uint public taskCount = 0;

    struct Task {
        uint id;
        string content;
        bool completed;
    }

    event TaskCreated(
        uint id,
        string content,
        bool completed
    );

    mapping(uint => Task) public tasks;

    constructor() {
        createTask("New task created.");
    }

    function createTask(string memory _content) public {
        taskCount ++;
        tasks[taskCount] = Task(taskCount, _content, false);
        emit TaskCreated(taskCount, _content, false);
    }
}