<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@400;500;600;700&display=swap">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="icon" type="image/svg+xml" href="/blog/favicon.svg">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/header.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/sidemenu.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/footer.css">
<title>T1 Diary</title>
</head>

<body>

	<%@ include file="/header.jsp"%>
	<%@ include file="/sidemenu.jsp"%>

	<!-- 본문+댓글 레이아웃 -->
	<div
		style="max-width: 900px; margin: 48px auto 0 auto; display: flex; gap: 32px;">

		<!-- 본문 영역 -->
		<div
			style="flex: 2; background: #fff; border-radius: 18px; box-shadow: 0 2px 12px rgba(0, 0, 0, 0.07); padding: 36px 32px;">

			<!-- 작성자 정보 + 메뉴 버튼 -->
			<div
				style="display: flex; align-items: center; gap: 7px; margin-bottom: 2px;">
				<div style="display: flex; align-items: center; gap: 7px; flex: 1;">
					<c:if test="${not empty view.member.profile}">
						<img src="/img/${view.member.profile}"
							style="width: 48px; height: 48px; border-radius: 50%; object-fit: cover;">
					</c:if>
					<c:if test="${empty view.member.profile}">
						<img src="/blog/image/default_profile.png"
							style="width: 48px; height: 48px; border-radius: 50%; object-fit: cover;">
					</c:if>
					<div>
						<div style="font-weight: 600; color: #222; font-size: 1.08em;">
							${view.member.username}</div>
						<div style="color: #888; font-size: 0.97em;">
							${view.regdate}</div>
					</div>
				</div>
				<!-- 메뉴 버튼 (세로 점 3개) -->
				<div style="position: relative;">
					<button type="button" class="menuBtn"
						style="background: none; border: none; padding: 6px; cursor: pointer;">
						<span
							style="display: block; width: 4px; height: 4px; background: #888; border-radius: 50%; margin: 2px auto;"></span>
						<span
							style="display: block; width: 4px; height: 4px; background: #888; border-radius: 50%; margin: 2px auto;"></span>
						<span
							style="display: block; width: 4px; height: 4px; background: #888; border-radius: 50%; margin: 2px auto;"></span>
					</button>
					<div class="menuDropdown"
						style="display: none; position: absolute; right: 0; top: 28px; background: #fff; border: 1px solid #e0e0e0; border-radius: 8px; box-shadow: 0 2px 8px rgba(0, 0, 0, 0.10); min-width: 110px; z-index: 10; padding: 0;">
						<a href="#" class="editBtn"
							style="display: block; padding: 10px 16px; color: #222; text-decoration: none; font-size: 0.98em; border: none; background: none; width: 100%; text-align: left;">編集する</a>
						<form class="deleteForm" action="/blog/bc/diarydelete.do"
							method="post" style="margin: 0;">
							<input type="hidden" name="bno" value="${view.bno}">
							<button type="button" class="deleteBtn"
								style="display: block; width: 100%; background: none; border: none; color: #d6002f; padding: 10px 16px; text-align: left; font-size: 0.98em; cursor: pointer;">削除する</button>
						</form>
					</div>
				</div>
			</div>

			<!-- 글 내용 -->
			<div
				style="font-size: 1.18em; color: #222; margin-top: -18px; white-space: pre-line; line-height: 1.7;">
				${view.content}</div>

			<!-- 첨부 이미지 -->
			<c:if test="${not empty view.imgfile}">
				<img src="/img/${view.imgfile}"
					style="width: 100%; border-radius: 12px; margin-top: 18px;">
			</c:if>
		</div>

		<!-- 우측 댓글 영역 -->
		<div
			style="flex: 1; display: flex; flex-direction: column; gap: 24px;">

			<!-- 댓글 작성 -->
			<div
				style="background: #fff; border-radius: 16px; box-shadow: 0 2px 8px rgba(0, 0, 0, 0.09); padding: 28px 24px 18px 24px;">
				<form action="/blog/bc/diaryreply.do" method="post"
					style="display: flex; flex-direction: column; gap: 12px;">
					<input type="hidden" name="diary_bno" value="${view.bno}">
					<textarea name="replytext" rows="3" maxlength="500" required
						placeholder="コメントを入力してください"
						style="border-radius: 12px; border: 1.5px solid #e0e0e0; padding: 12px; font-size: 1.08em; background: #f7faff; resize: none;"></textarea>
					<div style="display: flex; justify-content: flex-end; gap: 10px;">
						<button type="reset"
							style="background: #e0e0e0; color: #222; border: none; border-radius: 14px; padding: 7px 22px;">
							リセット</button>
						<button type="submit"
							style="background: #987de8; color: #fff; border: none; border-radius: 14px; padding: 7px 22px; font-size: 1em; font-weight: 600; cursor: pointer;">
							登録</button>
					</div>
				</form>

			</div>

			<!-- 댓글 리스트 -->
			<div style="margin-top: 18px;">
				<c:forEach var="c" items="${rpview}">
					<div
						style="background: #f7faff; border-radius: 12px; box-shadow: 0 1px 4px rgba(26, 122, 209, 0.06); padding: 18px 20px 12px 20px; margin-bottom: 14px; position: relative;">
						<!-- 3-dot menu at top right -->
						<div
							style="position: absolute; top: 14px; right: 14px; z-index: 2;">
							<button type="button" class="commentMenuBtn"
								style="background: none; border: none; padding: 6px; cursor: pointer;">
								<span
									style="display: block; width: 4px; height: 4px; background: #888; border-radius: 50%; margin: 2px auto;"></span>
								<span
									style="display: block; width: 4px; height: 4px; background: #888; border-radius: 50%; margin: 2px auto;"></span>
								<span
									style="display: block; width: 4px; height: 4px; background: #888; border-radius: 50%; margin: 2px auto;"></span>
							</button>
							<div class="commentMenuDropdown"
								style="display: none; position: absolute; right: 0; top: 28px; background: #fff; border: 1px solid #e0e0e0; border-radius: 8px; box-shadow: 0 2px 8px rgba(0, 0, 0, 0.10); min-width: 110px; z-index: 10; padding: 0;">
								<form class="commentDeleteForm"
									action="${pageContext.request.contextPath}/bc/diaryreplydelete.do"
									method="post" style="margin: 0;">
									<input type="hidden" name="diary_bno" value="${view.bno}">
									<input type="hidden" name="reply_bno" value="${c.reply_bno}">
									<button type="button" class="commentDeleteBtn"
										style="display: block; width: 100%; background: none; border: none; color: #d6002f; padding: 10px 16px; text-align: left; font-size: 0.98em; cursor: pointer;">削除する</button>
								</form>
							</div>
						</div>
						<div style="display: flex; align-items: center; gap: 12px;">
							<!-- 프로필 이미지 -->
							<c:if test="${not empty c.member.profile}">
								<img src="/img/${c.member.profile}"
									style="width: 32px; height: 32px; border-radius: 50%; object-fit: cover;">
							</c:if>
							<c:if test="${empty c.member.profile}">
								<img src="/blog/image/default_profile.png"
									style="width: 32px; height: 32px; border-radius: 50%; object-fit: cover;">
							</c:if>
							<span style="font-weight: 700; color: #d6002f;">
								${c.member.username} </span> <span
								style="color: #888; font-size: 0.97em;"> ${c.regdate} </span>
						</div>
						<div style="color: #222; font-size: 1.08em; margin-top: 4px;">
							${c.replytext}</div>
					</div>
				</c:forEach>
			</div>

		</div>
	</div>

	<%@ include file="/footer.jsp"%>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

	<script>
		// 메뉴 버튼 토글 (클래스 기반, 여러개여도 동작)
		document
				.querySelectorAll('.menuBtn')
				.forEach(
						function(btn) {
							btn
									.addEventListener(
											'click',
											function(e) {
												e.stopPropagation();
												const dropdown = btn.parentElement
														.querySelector('.menuDropdown');
												if (dropdown) {
													dropdown.style.display = dropdown.style.display === 'block' ? 'none'
															: 'block';
												}
											});
						});
		document.addEventListener('click', function() {
			document.querySelectorAll('.menuDropdown').forEach(function(dd) {
				dd.style.display = 'none';
			});
		});
		document
				.querySelectorAll('.editBtn')
				.forEach(
						function(editBtn) {
							editBtn.onclick = function(e) {
								e.preventDefault();
								location.href = '${pageContext.request.contextPath}/bc/diaryupdate.do?bno=${view.bno}';
							};
						});
		document.querySelectorAll('.deleteBtn').forEach(function(deleteBtn) {
			deleteBtn.onclick = function(e) {
				e.preventDefault();
				deleteBtn.closest('form').submit();
			};
		});
		// 댓글 메뉴 토글 (여러개 지원)
		document
				.querySelectorAll('.commentMenuBtn')
				.forEach(
						function(btn) {
							btn
									.addEventListener(
											'click',
											function(e) {
												e.stopPropagation();
												const dropdown = btn.parentElement
														.querySelector('.commentMenuDropdown');
												if (dropdown) {
													dropdown.style.display = dropdown.style.display === 'block' ? 'none'
															: 'block';
												}
											});
						});
		document.addEventListener('click', function() {
			document.querySelectorAll('.commentMenuDropdown').forEach(
					function(dd) {
						dd.style.display = 'none';
					});
		});
		document.querySelectorAll('.commentDeleteBtn').forEach(
				function(deleteBtn) {
					deleteBtn.onclick = function(e) {
						e.preventDefault();
						if (confirm('コメントを 削除しますか?')) {
							deleteBtn.closest('form').submit();
						}
					};
				});
	</script>

</body>
</html>