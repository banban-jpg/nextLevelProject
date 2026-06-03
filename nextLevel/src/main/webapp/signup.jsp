<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
function checkDuplicate() {
    var loginId = $('#loginId').val();
    if (!loginId) {
        alert('아이디를 입력해주세요.');
        return;
    }
    $.ajax({
        url: '${pageContext.request.contextPath}/signup',
        type: 'POST',
        data: {
            action: 'checkDuplicate',
            loginId: loginId
        },
        success: function(response) {
            if (response === 'true') {
                alert('이미 사용 중인 아이디입니다.');
                $('#submitBtn').attr('disabled', true);
            } else {
                alert('사용 가능한 아이디입니다.');
                $('#submitBtn').attr('disabled', false);
                $('#idChecked').val('true');
            }
        }
    });
}

function validateForm() {
    if ($('#idChecked').val() !== 'true') {
        alert('아이디 중복 확인을 해주세요.');
        return false;
    }
    return true;
}
</script>
</head>
<body>
    <div class="container">
        <h2>회원가입</h2>
        <form action="${pageContext.request.contextPath}/signup" method="post" onsubmit="return validateForm()">
            <input type="hidden" id="idChecked" value="false">
            <div class="form-group">
                <label for="loginId">아이디</label>
                <input type="text" id="loginId" name="loginId" required>
                <button type="button" onclick="checkDuplicate()">중복확인</button>
            </div>
            <div class="form-group">
                <label for="password">비밀번호</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="form-group">
                <label for="name">이름</label>
                <input type="text" id="name" name="name" required>
            </div>
            <c:if test="${not empty error}">
                <p style="color: red;">${error}</p>
            </c:if>
            <button type="submit" id="submitBtn">회원가입</button>
        </form>
        <p>이미 계정이 있으신가요? <a href="${pageContext.request.contextPath}/login">로그인</a></p>
    </div>
</body>
</html>
