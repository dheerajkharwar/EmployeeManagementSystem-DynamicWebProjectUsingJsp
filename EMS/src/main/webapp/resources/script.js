function validateEmp() {
	let emp_id = document.getElementById("emp_id");
	let name = document.getElementById("name");
	let address = document.getElementById("address");
	let salary = document.getElementById("salary");
	
	if (!emp_id.value.match(/^\d{1,10}$/)) {
        alert("Employee ID should be an Integer! max length = 10");
        emp_id.focus();
        return false;
    }
    else if (!name.value.match(/^[a-zA-Z][a-zA-Z\s]{0,24}$/)) {
        alert("Name should contain only alphabets(a-zA-Z)! max length = 25");
        name.focus();
        return false;
    }
    else if (!address.value.match(/^.{3,150}$/)) {
        alert("Address can have minimum 3 and maximum 150 characters!");
        address.focus();
        return false;
    }
    else if (!salary.value.match(/^[0-9]{1,5}$/)) {
        alert("Only numbers allowed! max length = 5 and min length = 1");
        salary.focus();
        return false;
    }
}