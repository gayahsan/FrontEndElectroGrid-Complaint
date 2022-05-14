<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>ComplaintForm</title>

<script src="assets/js/croppie.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.js"></script>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light"> <a
		class="navbar-brand" href="#">ElectroGrid</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="#">Home
					<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> Dropdown </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="#">Action</a> <a
						class="dropdown-item" href="#">Another action</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">Something else here</a>
				</div></li>
			<li class="nav-item"><a class="nav-link disabled" href="#">Disabled</a>
			</li>
		</ul>
		<form class="form-inline my-2 my-lg-0">
			<input class="form-control mr-sm-2" type="search"
				placeholder="Search" aria-label="Search">
			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
		</form>
	</div>
	</nav>
	<div class="container">
		<h2> <center>Complaint Form</center></h2></br>
		<div class="container">
			<form class="form-group" id="complaintForm">
				<div class="row">
					<div class="col-md-4 mb-3">
						<label>Account Number</label>
						<div>
							<input type="text" id="account_number" class="form-control"
								name="account_number">
						</div>
					</div>
					<div class="col-md-4 mb-3">
						<label>Name</label>
						<div>
							<input type="text" id="name" class="form-control" name="name">
						</div>
					</div>
					<div class="col-md-4 mb-3">
						<label>Phone</label>
						<div>
							<input type="number" id="phone" class="form-control" name="phone">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4 mb-3">
						<label>Email</label>
						<div>
							<input type="email" id="email" class="form-control" name="email">
						</div>
					</div>

					<div class="col-md-4 mb-3">
						<label>Complaint Type</label>
						<div>
							<input type="text" id="complaintType" class="form-control"
								name="complaintType">
						</div>
					</div>
					<div class="col-md-4 mb-3">
						<label>Subject</label>
						<div>
							<input type="text" id="subject" class="form-control"
								name="subject">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4 mb-3">
						<label>Massage</label>
						<div class="form-group shadow-textarea">
						  <textarea class="form-control z-depth-1" id="massage" name="massage" rows="3" placeholder="Write massage here..."></textarea>
						</div>
					</div>
					</br>
				</div>
				<div>
					<button type="submit" class="btn btn-success">Submit</button>
					 <a href="Complaint-view-edit-delete.jsp" class="btn btn-success">View Complaint List</a>
				</div>
			</form></br>
		</div>
	</div>
</body>
</html>

<script>
$(document).ready(function () {

    $("#complaintForm").validate({
        rules: {
        	account_number: "required",
        	name: "required",
        	phone: "required",
        	email: {
                email: true,
                required: true
            },
            complaintType: "required",
            subject: "required",
            massage: "required",
        },
        messages: {
        	account_number: "Account No Required!",
        	name: "Name Required!",
        	phone: "Phone No Required!",
        	email: {
                email: "Not in valid format",
                required: "Email required!"
            },
            complaintType: "Complait Required!",
            subject: "Subject Required!",
            massage: "Massage Required!"
        },
        submitHandler: function () {
        	var fromData = JSON.stringify({
                "account_number" : $('#account_number').val(),
                "name" : $('#name').val(),
                "phone" : $('#phone').val(),
                "email" : $('#email').val(),
                "complaintType" : $('#complaintType').val(),
                "subject" : $('#subject').val(),
                "massage" : $('#massage').val()
            });
        	
        	console.log(fromData);

            $.ajax({
                type: "POST",
                url: 'rest_api/complaint',
                dataType : 'json',
				contentType : 'application/json',
				data: fromData,
                success: function(data){
                	console.log(data);
                	if(data['success']=="1"){
                		alert("Added Successfull!");
                        $("#complaintForm")[0].reset();
					}else{
						alert("Unsuccessfull!");
					}
                },
                failure: function(errMsg) {
                	alert("Connection Error!");
                }
            });
        }
    });

    $("#complaintForm").submit(function(e) {
        e.preventDefault();
    });

});

</script>