<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Transaction</title>
</head>
<body>
	<h2>Add Transaction</h2>
	<form action="addTransaction" method="post">
		Donor ID: <input type="text" name="donorId" required><br>
		<br> Campaign ID: <input type="text" name="campaignId" required><br>
		<br> Amount: <input type="number" name="amount" required><br>
		<br> Date: <input type="date" name="date" required><br>
		<br> <input type="submit" value="Save Transaction">
	</form>
</body>
</html>
