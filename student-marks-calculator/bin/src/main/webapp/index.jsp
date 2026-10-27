<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%!
    private String escapeHtml(Object value) {
        if (value == null) return "";
        return value.toString().replace("&", "&amp;")
                .replace("<", "&lt;").replace(">", "&gt;")
                .replace("\"", "&quot;").replace("'", "&#39;");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Student Marks Calculator</title>
    <style>
        * { box-sizing: border-box; }
        body { margin: 0; padding: 32px 16px; font-family: Arial, sans-serif; background: #f1f5f9; color: #172033; }
        .card { max-width: 620px; margin: 0 auto; padding: 30px; background: #fff; border-radius: 14px; box-shadow: 0 8px 28px rgba(15,23,42,.09); }
        h1 { margin-top: 0; color: #1d4ed8; }
        .hint { color: #64748b; line-height: 1.5; }
        label { display: block; margin: 18px 0 7px; font-weight: 700; }
        input { width: 100%; padding: 12px; border: 1px solid #cbd5e1; border-radius: 7px; font-size: 16px; }
        input:focus { outline: 2px solid #93c5fd; border-color: #2563eb; }
        .marks { display: grid; grid-template-columns: repeat(3, minmax(0, 1fr)); gap: 12px; }
        button { width: 100%; margin-top: 24px; padding: 13px; background: #1d4ed8; color: #fff; border: 0; border-radius: 7px; font-size: 16px; font-weight: 700; cursor: pointer; }
        button:hover { background: #1e40af; }
        .error { margin: 18px 0; padding: 12px; color: #991b1b; background: #fee2e2; border-radius: 7px; }
        @media (max-width: 520px) { .card { padding: 22px; } .marks { grid-template-columns: 1fr; gap: 0; } }
    </style>
</head>
<body>
<main class="card">
    <h1>Student Marks Calculator</h1>
    <p class="hint">Enter the student's name and whole-number marks from 0 to 100 for each subject.</p>

    <% if (request.getAttribute("errorMessage") != null) { %>
        <p class="error" role="alert"><%= escapeHtml(request.getAttribute("errorMessage")) %></p>
    <% } %>

    <form action="${pageContext.request.contextPath}/result" method="post">
        <label for="studentName">Student Name</label>
        <input type="text" id="studentName" name="studentName" maxlength="100" required
               value="<%= escapeHtml(request.getParameter("studentName")) %>">

        <div class="marks">
            <div>
                <label for="subject1">Subject 1</label>
                <input type="number" id="subject1" name="subject1" min="0" max="100" step="1" required
                       value="<%= escapeHtml(request.getParameter("subject1")) %>">
            </div>
            <div>
                <label for="subject2">Subject 2</label>
                <input type="number" id="subject2" name="subject2" min="0" max="100" step="1" required
                       value="<%= escapeHtml(request.getParameter("subject2")) %>">
            </div>
            <div>
                <label for="subject3">Subject 3</label>
                <input type="number" id="subject3" name="subject3" min="0" max="100" step="1" required
                       value="<%= escapeHtml(request.getParameter("subject3")) %>">
            </div>
        </div>

        <button type="submit">Calculate Result</button>
    </form>
</main>
</body>
</html>
