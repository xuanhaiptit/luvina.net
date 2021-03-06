<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="${pageContext.request.contextPath }/View/css/style.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript" src="View/js/user.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<title>ユーザ管理</title>
</head>
<body>

	<!-- Begin vung header -->
	<%@ include file="header.jsp"%>
	<!-- End vung header -->


	<!-- Begin vung input-->
	<form action="AddUserInput.do?type=edit&key=${userInfo.id}"
		method="get" name="inputform">
		<table class="tbl_input" border="0" width="75%" cellpadding="0"
			cellspacing="0">
			<tr>
				<th align="left">
					<div style="padding-left: 100px;">情報確認</div>
					<div style="padding-left: 100px;">&nbsp;</div>
				</th>
			</tr>
			<tr>
				<td align="left">
					<div style="padding-left: 100px;">
						<table border="1" width="70%" class="tbl_input" cellpadding="4"
							cellspacing="0">
							<tr>
								<td class="lbl_left" width="40%">アカウント名:</td>
								<td align="left">${userInfo.loginName}</td>
							</tr>
							<tr>
								<td class="lbl_left">グループ:</td>
								<td align="left">Group ${userInfo.group}</td>
							</tr>
							<tr>
								<td class="lbl_left">氏名:</td>
								<td align="left">${userInfo.fullName}</td>
							</tr>
							<tr>
								<td class="lbl_left">カタカナ氏名:</td>
								<td align="left">${userInfo.kanaName}</td>
							</tr>
							<tr>
								<td class="lbl_left">生年月日:</td>
								<td align="left"><fmt:formatDate pattern="yyyy/MM/dd"
										value="${userInfo.birthday}" /></td>
							</tr>
							<tr>
								<td class="lbl_left">メールアドレス:</td>
								<td align="left">${userInfo.email}</td>
							</tr>
							<tr>
								<td class="lbl_left">電話番号:</td>
								<td align="left">${userInfo.tel}</td>
							</tr>
							<tr>
								<th colspan="2"><a href="#"
									onclick="clickLinkLevelJapanese()">日本語能力</a></th>
							</tr>
						</table>
					</div>
				</td>
			</tr>
			<tr>
				<td align="left">
					<div style="display: none; margin-left: 100px" id="tableLvelJapan">
						<table border="1" width="70%" class="tbl_input" cellpadding="4"
							cellspacing="0">
							<tr>
								<td class="lbl_left" width="40%">資格:</td>
								<td align="left"><c:if
										test="${!userInfo.codeLevel.equals('')}">
										<label>${userInfo.codeLevel}</label>
									</c:if></td>
							</tr>
							<tr>
								<td class="lbl_left">資格交付日:</td>
								<td align="left"><c:if
										test="${!userInfo.codeLevel.equals('')}">
										<fmt:formatDate pattern="yyyy/MM/dd"
											value="${userInfo.startDate}" />
									</c:if></td>
							</tr>
							<tr>
								<td class="lbl_left">失効日:</td>
								<td align="left"><c:if
										test="${!userInfo.codeLevel.equals('')}">
										<fmt:formatDate pattern="yyyy/MM/dd"
											value="${userInfo.endDate}" />
									</c:if></td>
							</tr>
							<tr>
								<td class="lbl_left">点数:</td>
								<td align="left"><c:if
										test="${!userInfo.codeLevel.equals('')}">
										${fn:escapeXml(userInfo.total)}
									</c:if></td>
							</tr>
						</table>
					</div>
				</td>
			</tr>
		</table>
		<div style="padding-left: 100px;">&nbsp;</div>
		<!-- Begin vung button -->
		<div style="padding-left: 100px;">
			<table border="0" cellpadding="4" cellspacing="0" width="300px">
				<tr>
					<th width="200px" align="center">&nbsp;</th>
					<td><input class="btn" type="button"
						onclick="javascript:window.location.href='AddUserInput.do?type=edit&key=${userInfo.id}'"
						value="編集" /></td>
					<td><input class="btn" type="button"
						onclick="javascript:window.location.href='ChangePassword.do?type=changePassword&key=${userInfo.id}'"
						value="Change Password" /></td>
					<td><input class="btn" type="button"
						onclick="alertDelete(${userInfo.id})" value="削除" /></td>
					<td><input class="btn" type="button" value="戻る"
						onclick="javascript:window.location.href='ListUser.do?type=back'" /></td>
				</tr>
			</table>
		</div>
		<!-- End vung button -->
	</form>
	<!-- End vung input -->

	<!-- Begin vung footer -->
	<%@ include file="footer.jsp"%>
	<!-- End vung footer -->
</body>

</html>