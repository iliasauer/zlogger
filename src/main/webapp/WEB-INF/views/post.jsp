<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:genericpage>
    <jsp:attribute name="header">
		<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.26/angular.js"></script>
		<script src="/js/ng/app.js"></script>
		<script>
               app.value("loadUrl", "${postModel.urlLoadCommentary}");
		</script>
		<script src="/js/ng/controllers.js"></script>
    </jsp:attribute>
    <jsp:attribute name="footer">

    </jsp:attribute>
    <jsp:body>



		<div class="row" ng-app="myApp">
			
			<div class="col-sm-8 blog-main">

				<div class="blog-post">
					<h2 class="blog-post-title">${postModel.post.title}</h2>
					<p class="blog-post-meta">${postModel.post.creationDate} by <a href="#">${postModel.post.creator.username}</a></p>
					<p>${postModel.post.message}</p>
				</div>

			<hr>

			<div ng-controller="postCommentsCtrl" >
				<div class = "blog-post" ng-repeat="commentary in commentaries">
					<p class="blog-post-meta">{{commentary.creationDate}} by <a href="#">{{commentary.creator.username}}</a></p>
					<p>{{commentary.message}}</p>
				</div>
			</div>


			<c:if test="${postModel.canAddCommentary}">
				<form id="form" method="post" action="${postModel.urlAddCommentary}" >

				  	<input cssClass="input-block-level"  placeholder="" autocomplete="off" name="title" />
					<textarea name="message"></textarea>

				  	<button type="submit" class="btn">Submit</button>

				</form>
			</c:if>
			</div>
		</div>


    </jsp:body>
</t:genericpage>
