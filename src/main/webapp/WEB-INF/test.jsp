<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<table>
    <tr>
        <td>类型</td>
    </tr>
        <c:forEach items="${requestScope.list}" var="item">
            <tr>
    <td>
        ${item}
    </td>
            </tr>

        </c:forEach>
    </tr>
</table>
