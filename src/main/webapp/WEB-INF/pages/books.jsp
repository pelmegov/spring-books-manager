<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
    <title>Books Page</title>
    <!-- Bootstrap core CSS -->
    <link href="<c:url value="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />" rel="stylesheet">
</head>
<body>

<div class="container">
    <div class="row"><div class="col-xs-12"><a href="/">Back to main menu</a></div></div>
    <div class="row">
        <div class="col-xs-6">

            <h1>Book List</h1>

            <c:if test="${!empty listBooks}">
                <table class="table">
                    <tr>
                        <th>ID</th>
                        <th>Title</th>
                        <th>Author</th>
                        <th>Price</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                    <c:forEach items="${listBooks}" var="book">
                        <tr>
                            <td>${book.id}</td>
                            <td><a href="/bookdata/${book.id}">${book.bookTitle}</a></td>
                            <td>${book.bookAuthor}</td>
                            <td>${book.price/100}${book.price%100}</td>
                            <td><a href="<c:url value='/edit/${book.id}'/>">Edit</a></td>
                            <td><a href="<c:url value='/remove/${book.id}'/>">Delete</a></td>
                        </tr>
                    </c:forEach>
                </table>
            </c:if>
        </div>

        <div class="col-xs-1"></div>

        <div class="col-xs-5">
            <h1>Add a Book</h1>

            <c:url var="addAction" value="/books/add"/>

            <form:form action="${addAction}" commandName="book">
                <table class="table">
                    <c:if test="${!empty book.bookTitle}">
                        <tr>
                            <td>
                                <form:label path="id">
                                    <spring:message text="ID"/>
                                </form:label>
                            </td>
                            <td>
                                <form:input path="id" readonly="true" size="8" disabled="true"/>
                                <form:hidden path="id"/>
                            </td>
                        </tr>
                    </c:if>
                    <tr>
                        <td>
                            <form:label path="bookTitle">
                                <spring:message text="Title"/>
                            </form:label>
                        </td>
                        <td>
                            <form:input path="bookTitle"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <form:label path="bookAuthor">
                                <spring:message text="Author"/>
                            </form:label>
                        </td>
                        <td>
                            <form:input path="bookAuthor"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <form:label path="price">
                                <spring:message text="Price"/>
                            </form:label>
                        </td>
                        <td>
                            <form:input path="price"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <c:if test="${!empty book.bookTitle}">
                                <input type="submit" value="<spring:message text="Edit Book"/>"/>
                            </c:if>
                            <c:if test="${empty book.bookTitle}">
                                <input type="submit" value="<spring:message text="Add Book"/>"/>
                            </c:if>
                        </td>
                    </tr>
                </table>
            </form:form>
        </div>
    </div>
</div>
</body>
</html>
