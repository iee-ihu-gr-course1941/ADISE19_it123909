var me={token:null,player_type:null};
var game_status={};
var deck={};
var last_update=new Date().getTime();
var timer=null;
var data={};

$(function () {
	
	$('#buttons').hide();
	$('#loginButton').click( login);
	$('#hitButton').click( hit);
	$('#standButton').click( stand);
	$('#resetButton').click( reset);
	
});


function draw_empty_board() {
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


function fill_deck(){
	$.ajax({url: "blackjack.php/deck/", 
	headers: {"X-Token": me.token},
	success: fill_board_by_data });
}




var i=0;
var j=0;

function hit(){
	   		/*get random js number(id) that is not used by player or groupier with select then update the deck table */
			var randomId = Math.floor(Math.random() * 52) + 1;
			var p_type = $('#playerType').val();
	  
	   		$.ajax({url: "blackjack.php/deck/card/"+p_type+"/"+randomId, 
			method: 'PUT',
			dataType: "json",
			contentType: 'application/json',
			data: JSON.stringify( {player_type: p_type, id: randomId}),
			headers: {"X-Token": me.token},
			success: move_result,
			error: login_error});
	
			$.ajax({url: "blackjack.php/deck/opencard", 
			headers: {"X-Token": me.token},
			success: fill_board_by_data(data,p_type) });

			$('#croupier_table').hide;
			$('#player_table').hide;
			if(p_type=='P')
			{	
				var pl='<table id="player_table2">';	
				pl+= '<tr id="pl2">';		
				pl += '<td class="player_square2" > <p>P cards</p>  </td>'; 	
				pl += '<td class="player_square2" id="player_2'+i+'"> <img src=images/'+data[i]+'.gif "></td>'; 
				i++;
				pl+='</tr>';		
				pl+='</table>';				
				$('#playerCards').html(pl);

			
				
			}

			else if(p_type=='C')
			{
				var pl='<table id="croupier_table2">';	
				pl+= '<tr id="cr2">';		
				pl += '<td class="croupier_square2" > <p>C cards</p>  </td>'; 	
				pl += '<td class="croupier_square2" id="croupier_2'+i+'"> <img src=images/'+data[j]+'.gif "></td>'; 
				j++
				pl+='</tr>';		
				pl+='</table>';				
				$('#playerCards').html(pl);
			}

}

function stand(){
	var p_type = $('#playerType').val();


	$.ajax({url: "blackjack.php/deck/card/"+p_type, 
	method: 'GET',
	dataType: "json",
	contentType: 'application/json',
	data: JSON.stringify( {player_type: p_type}),
	headers: {"X-Token": me.token},
	success: move_result,
	error: login_error});


}

function reset(){
	alert("The game has beed reseted");
	$.ajax({url: "blackjack.php/deck/", headers: {"X-Token": me.token}, method: 'POST',  success: draw_empty_board() });
	
}




function login() {
	if($('#username').val()=='') {
		alert('You have to set a username');
		return;
	}

	var p_type = $('#playerType').val();
	$('.game_initializer').hide();
	draw_empty_board();

	
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
	alert();
}







