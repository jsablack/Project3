$.ajax({
	url: '/home',
	type: "GET",
	dataType: "JSON",
	success: function(data){
		console.log(data)

		var ul = $('<ul>')

		for (var location in data){
			ul.append("<li>" + data[location].username + "</li>")
		}
		$('body').append(ul)

	},
	error: function(err){
		console.log(err)
	}
})

// $.ajax({
// 	url: 'http://localhost:9393/burrito/json',
// 	type: 'GET',
// 	datatype: 'json',
// 	success: function(response){
// 		$('body').append('<ul></ul>');
// 		for (i = 0; i < response.length; i++){
// 		$('ul').append('<li>' + response[i].name + '</li>');
// 		}
// 	}
// })