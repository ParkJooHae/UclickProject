<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<form method="post" action="login" class="form-signin">
	<h2 class="form-heading">Log in</h2>
	
	<div class="form-group">
		<input name="username" type="text" class="form-contorl" placeholder="Username" autofocus="true"/>
		<input name="password" type="password" class="form-contorl" placeholder="Password"/>
		<button classs="btn btn-lg btn-primary btn-block" type="submit">Log in</button>
	</div>
</form>