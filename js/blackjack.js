var me={token:null,player_type:null};
var game_status={};
var board={};
var last_update=new Date().getTime();
var timer=null;

$(function () {
	
	$('#buttons').hide();
	$('#loginButton').click( login);
	$('#startButton').click( update_board(p));
	$('#hitButton').click( );
	$('#standButton').click( );
	$('#resetButton').click( );
	
});


function draw_empty_board(p) {
	var cr='<table id="croupier_table">';
	var pl='<table id="player_table">';
	cr+= '<tr id="cr">';
	pl+= '<tr id="pl">';
	cr += '<td class="croupier_square" > <p>C cards</p> </td>'; 
	pl += '<td class="player_square" > <p>P cards</p>  </td>'; 
	
	for(var i=0;i<2;i++){
		cr += '<td class="croupier_square" id="croupier_'+i+'"> <img src=images/back.gif "></td>'; 
		pl += '<td class="player_square" id="player_'+i+'"> <img src=images/back.gif "></td>'; 
		
	}
	cr+='</tr>';
	pl+='</tr>';
	
	cr+='</table>';
	pl+='</table>';
	$('#croupierCards').html(cr);
	$('#playerCards').html(pl);
	
	$('#buttons').show(1000);
	
	
}


function update_board(p) {
	
}


function login() {
	if($('#username').val()=='') {
		alert('You have to set a username');
		return;
	}
	var p_type = $('#playerType').val();
	draw_empty_board(p_type);

	
	$.ajax({url: "blackjack.php/players/"+p_type, 
			method: 'PUT',
			dataType: "json",
			headers: {"X-Token": me.token},
			contentType: 'application/json',
			data: JSON.stringify( {username: $('#username').val(), player_type: p_type}),
			success: login_result,
			error: login_error});
}

function login_result(data) {
	me = data[0];
	$('#game_initializer').hide();
	update_info();
	game_status_update();
}

function login_error(data,y,z,c) {
	var x = data.responseJSON;
	alert(x.errormesg);
}



