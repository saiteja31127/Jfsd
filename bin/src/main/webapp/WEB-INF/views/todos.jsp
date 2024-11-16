<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>To-Do List</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            padding-top: 70px;
        }
        .todo-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-bottom: 10px;
        }
        .completed {
            color: green;
        }
        .pending {
            color: red;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
        <a class="navbar-brand" href="/">To-Do App</a>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/add-todo">Add New To-Do</a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container">
        <h1 class="mb-4">To-Do List</h1>
        <ul class="list-group">
            <c:forEach items="${todos}" var="todo">
                <li class="list-group-item todo-item">
                    <span>
                        ${todo.description} 
                        <c:if test="${todo.completed}">
                            <span class="completed">(Completed)</span>
                        </c:if>
                        <c:if test="${!todo.completed}">
                            <span class="pending">(Pending)</span>
                        </c:if>
                    </span>
                    <span>
                        <a href="/update-todo/${todo.id}" class="btn btn-primary btn-sm">Update</a>
                        <a href="/delete-todo?id=${todo.id}" class="btn btn-danger btn-sm">Delete</a>
                    </span>
                </li>
            </c:forEach>
        </ul>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
