// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract TodoList {

    uint8 public taskCount = 0;

    struct Task {
        uint8 id;
        string content;
        bool completed;
    }

    event TaskCreated(
        uint8 id,
        string content,
        bool completed
    );

    event TaskCompleted(
        uint8 id,
        bool completed
    );

    mapping(uint8 => Task) public tasks;

    constructor() {
        createTask("New task created.");
    }

    function createTask(string memory _content) public {
        unchecked {
            taskCount ++;
        }
        tasks[taskCount] = Task(taskCount, _content, false);
        emit TaskCreated(taskCount, _content, false);
    }

    function toggleCompleted(uint8 _id) public {
        Task memory _task = tasks[_id];
        _task.completed = !_task.completed;
        tasks[_id] = _task;
        emit TaskCompleted(_id, _task.completed);
    }
}