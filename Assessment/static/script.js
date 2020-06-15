function edit(user){
	document.getElementById("sectUser").removeAttribute("style");
	document.getElementById("sectUsers").style.display = "none";
	document.getElementById("userAvatar").setAttribute("src", source.users[user-1].pic);
	document.getElementById("btnSaveUser").setAttribute("onclick", ("up(" + user + ")"));
	document.getElementById("btnDeleteUser").setAttribute("onclick", ("del(" + user + ")"));
}

function del(user){
	delete source.users[user-1];
}

function clean(){
	document.getElementById("userEmail").removeAttribute("value");
	document.getElementById("userFirstName").removeAttribute("value");
	document.getElementById("userLastName").removeAttribute("value");
	document.getElementById("pic").removeAttribute("value");
}

function newUser(){
	document.getElementById("sectNewUser").removeAttribute("style");
	document.getElementById("sectUsers").style.display = "none";
}
var test;
function nU(){
	test = document.addd.name.value;
	source.users.push({id: test});
	//document.getElementById("sectNewUser").style.display = "none";
	//document.getElementById("sectUsers").removeAttribute("style");
}

function on() {
  document.getElementById("overlay").style.display = "block";
}

function off() {
  document.getElementById("overlay").style.display = "none";
}
var rawFile;
function readTextFile(file, callback) {
    rawFile = new XMLHttpRequest();
    rawFile.overrideMimeType("application/json");
    rawFile.open("GET", file, true);
    rawFile.onreadystatechange = function() {
        if (rawFile.readyState === 4 && rawFile.status == 200) {
            callback(rawFile.responseText);
        }
    }
    rawFile.send(null);
}

var source;

//usage:
readTextFile("users.json", function(text){
    var data = JSON.parse(text);
    console.log(data);
		source = data;
});


function uno(){
	var dataTest = source[0].user1.id;
	document.getElementById("one").innerHTML = dataTest;
}

function showTime(){
	document.getElementById("btnNewUser").removeAttribute("style");
	document.getElementById("divPageNumber").removeAttribute("style");
	document.getElementById("controls").removeAttribute("style");
	document.getElementById("tblUsers").removeAttribute("style");
	document.getElementById("showTime").remove();
	render();
}

function showTimeNew(){
	document.getElementById("sectNewUser").setAttribute("style", "display: none;");
	document.getElementById("sectUsers").removeAttribute("style");
	render();
}

function showTimeNew1(){
	document.getElementById("sectUser").setAttribute("style", "display: none;");
	document.getElementById("sectUsers").removeAttribute("style");
	render();
	next();
}

var i = 0;
var page = 1;
var max;
function render(){
	document.getElementById("pageNumber").innerHTML = page;
	var pages = (source.users.length)/3;
	if (Number.isInteger(pages)){
		document.getElementById("totalPages").innerHTML = pages;
	}else{
		document.getElementById("totalPages").innerHTML = Math.floor(pages)+1;
	}

	if(page == 1){
		max = 3;
	}else if(page == 2){
		max = 6;
	}else if(page == 3){
		max = 7;
	}else if(page == 4){
		max = 8;
	}

	for (; i < max; i++){
		var tr = document.createElement("TR");
		//Create the element where the data will be shown
		var td = document.createElement("TD");
		var td1 = document.createElement("TD");
		var td2 = document.createElement("TD");
		var td3 = document.createElement("TD");
		var td4 = document.createElement("TD");
		var td5 = document.createElement("TD");
		var img = document.createElement("IMG");
		var edit = document.createElement("BUTTON");

		if(source.users[i] == null){
			i++;
		}

		//Assign values for the data inside every cell of the table
		var info = document.createTextNode(source.users[i].id);
		var info1 = document.createTextNode(source.users[i].email);
		var info2 = document.createTextNode(source.users[i].fName);
		var info3 = document.createTextNode(source.users[i].lName);
		var info4 = source.users[i].pic;
		var info5 = document.createTextNode("Edit");

		td.setAttribute("style", "vertical-align: middle");
		td.setAttribute("id", ("id"+i));
		td1.setAttribute("style", "vertical-align: middle");
		td1.setAttribute("id", ("mail"+i));
		td2.setAttribute("style", "vertical-align: middle");
		td2.setAttribute("id", ("name"+i));
		td3.setAttribute("style", "vertical-align: middle");
		td3.setAttribute("id", ("apellido"+i));
		td4.setAttribute("style", "vertical-align: middle");
		td4.setAttribute("id", ("pic")+i);
		td5.setAttribute("style", "vertical-align: middle");
		td5.setAttribute("id", ("edit"+i));
		img.setAttribute("src", info4);
		img.setAttribute("class", "w3-card");
		edit.setAttribute("class", "w3-button w3-round-xlarge w3-orange");
		edit.setAttribute("onclick", ("edit(" + source.users[i].id + ")"));

		document.getElementById("start").appendChild(tr);

		tr.appendChild(td);
		td.appendChild(info);
		tr.appendChild(td1);
		td1.appendChild(info1);
		tr.appendChild(td2);
		td2.appendChild(info2);
		tr.appendChild(td3);
		td3.appendChild(info3);
		tr.appendChild(td4);
		td4.appendChild(img);
		tr.appendChild(td5);
		td5.appendChild(edit);
		edit.appendChild(info5);
	}
}
function next(){
	if(page < (source.users.length)/3){
		page++;
		max = max + 3;
		var nodes = document.querySelectorAll("td");
		for(var a = 0; a < nodes.length; a++){
			nodes[a].remove();
		}

		render();
	}else{
		return page;
	}
}
function previous(){
	if(page == 1){
		return page;
	}else{
		page--;
		var nodes = document.querySelectorAll("td");
		for(var a = 0; a < nodes.length; a++){
			nodes[a].remove();
		}
		i = i-6;
		render();
	}
}
function weird(){
	var data1 = document.addd.name.value;
	var data2 = document.addd.lname.value;
	var data3 = document.addd.email.value;
	var data4 = document.addd.pic.value;
	source.users.push({id: (source.users.length+1), fName: data1, lName: data2, email: data3, pic: data4});
}
function up(user){
	source.users[user-1].fName = document.ed.name1.value;
	source.users[user-1].lName = document.ed.lname1.value;
	source.users[user-1].email = document.ed.email1.value;
	source.users[user-1].pic = document.ed.pic1.value;
}
