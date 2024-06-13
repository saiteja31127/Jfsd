package com.example.todoapp.controller;

import com.example.todoapp.model.TodoItem;
import com.example.todoapp.repository.TodoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
public class ViewController {

    @Autowired
    private TodoRepository todoRepository;

    @GetMapping("/")
    public String getAllTodos(Model model) {
        List<TodoItem> todos = todoRepository.findAll();
        model.addAttribute("todos", todos);
        return "todos";
    }

    @GetMapping("/add-todo")
    public String showAddTodoForm() {
        return "add-todo";
    }

    @PostMapping("/add-todo")
    public String addTodoItem(@RequestParam("description") String description, @RequestParam("status") String status) {
        TodoItem todoItem = new TodoItem();
        todoItem.setDescription(description);
        boolean isCompleted = status.equals("Completed");
        todoItem.setCompleted(isCompleted);
        todoRepository.save(todoItem);
        return "redirect:/";
    }

    @GetMapping("/update-todo/{id}")
    public String showUpdateTodoForm(@PathVariable("id") Long id, Model model) {
        Optional<TodoItem> optionalTodoItem = todoRepository.findById(id);
        if (optionalTodoItem.isPresent()) {
            model.addAttribute("todo", optionalTodoItem.get());
            return "update-todo";
        } else {
            return "redirect:/";
        }
    }

    @PostMapping("/update-todo")
    public String updateTodoItem(@RequestParam("id") Long id, @RequestParam("description") String description, @RequestParam("status") String status) {
        Optional<TodoItem> optionalTodoItem = todoRepository.findById(id);
        if (optionalTodoItem.isPresent()) {
            TodoItem todoItem = optionalTodoItem.get();
            todoItem.setDescription(description);
            boolean isCompleted = status.equals("Completed");
            todoItem.setCompleted(isCompleted);
            todoRepository.save(todoItem);
        }
        return "redirect:/";
    }

    @GetMapping("/delete-todo")
    public String deleteTodoItem(@RequestParam("id") Long id) {
        Optional<TodoItem> optionalTodoItem = todoRepository.findById(id);
        if (optionalTodoItem.isPresent()) {
            todoRepository.delete(optionalTodoItem.get());
        }
        return "redirect:/";
    }
}
