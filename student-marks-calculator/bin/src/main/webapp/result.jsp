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
    <title>Student Result</title>
    <style>
        * { box-sizing: border-box; }
        body { margin: 0; padding: 32px 16px; font-family: Arial, sans-serif; background: #f1f5f9; color: #172033; }
        .card { max-width: 620px; margin: 0 auto; padding: 30px; background: #fff; border-radius: 14px; box-shadow: 0 8px 28px rgba(15,23,42,.09); }
        h1 { margin-top: 0; color: #1d4ed8; }
        .student { color: #475569; }
        .grid { display: grid; grid-template-columns: repeat(2, minmax(0, 1fr)); gap: 12px; margin-top: 22px; }
        .item { padding: 16px; border: 1px solid #e2e8f0; border-radius: 9px; background: #f8fafc; }
        .label { color: #64748b; font-size: 13px; }
        .value { margin-top: 8px; font-size: 24px; font-weight: 700; overflow-wrap: anywhere; }
        .grade { color: #15803d; }
        a { display: inline-block; margin-top: 22px; padding: 12px 16px; color: #fff; background: #1d4ed8; text-decoration: none; border-radius: 7px; }
        @media (max-width: 480px) { .card { padding: 22px; } .grid { grid-template-columns: 1fr; } }
    </style>
</head>
<body>
<main class="card">
    <h1>Student Result</h1>
    <p class="student">Student Name: <strong><%= escapeHtml(request.getAttribute("studentName")) %></strong></p>

    <div class="grid">
        <div class="item"><div class="label">Subject 1</div><div class="value"><%= escapeHtml(request.getAttribute("mark1")) %> / 100</div></div>
        <div class="item"><div class="label">Subject 2</div><div class="value"><%= escapeHtml(request.getAttribute("mark2")) %> / 100</div></div>
        <div class="item"><div class="label">Subject 3</div><div class="value"><%= escapeHtml(request.getAttribute("mark3")) %> / 100</div></div>
        <div class="item"><div class="label">Total Marks</div><div class="value"><%= escapeHtml(request.getAttribute("total")) %> / 300</div></div>
        <div class="item"><div class="label">Average Marks</div><div class="value"><%= escapeHtml(request.getAttribute("average")) %> / 100</div></div>
        <div class="item"><div class="label">Final Grade</div><div class="value grade"><%= escapeHtml(request.getAttribute("grade")) %></div></div>
    </div>

    <a href="${pageContext.request.contextPath}/">Enter Another Result</a>
</main>
</body>
</html>
