<?php

ini_set('display_errors','on' );

require_once "lib/dbconnect.php";
require_once "lib/deck.php";
require_once "lib/game.php";
require_once "lib/users.php";


$method = $_SERVER['REQUEST_METHOD'];
$request = explode('/', trim($_SERVER['PATH_INFO'],'/'));
$input = json_decode(file_get_contents('php://input'),true);
if(isset($_SERVER['HTTP_X_TOKEN'])) {
	$input['token']=$_SERVER['HTTP_X_TOKEN'];
}

switch ($r=array_shift($request)) {
    case 'deck' : 
            switch ($b=array_shift($request)) {
                case '':
                case null: handle_deck($method,$input);
                            break;
                case 'card': handle_card($method, $request[0],$request[1],$input);
							break;
				case 'opencard': handleHit($method, $request[0],$request[1],$input);
                        	break;
                default: header("HTTP/1.1 404 Not Found");
                            break;
			}
			break;
    case 'status': 
			if(sizeof($request)==0) {show_status();}
			else {header("HTTP/1.1 404 Not Found");}
			break;
	case 'players': handle_player($method, $request,$input);
            break;
    default:  header("HTTP/1.1 404 Not Found");
                        exit;
}

function handle_card($method,$input) {
	if($method=='GET') {
        handleStand($input['token']);
    } else if ($method=='PUT') {
		handleHit($input['p_type'],$input['randomId'],$input['token']);
    }    
}

function handleHit($player_type,$id,$token)
	{
		global $mysqli;
		if($token=='' || $token==NULL)
		{
			header("HTTP/1.1 400 Bad Request");
			print json_encode(['errormesg'=>"token is not set."]);
			exit;
		}
		
		$player_type = current_player($token);
		if($player_type==NULL)
		{
			header("HTTP/1.1 400 Bad Request");
			print json_encode(['errormesg'=>"You are not a player of this game "]);
			exit;
		}
		$status=show_status();
		if($status['status']!='STARTED')
		{
			header("HTTP/1.1 400 Bad Request");
			print json_encode(['errormesg'=>"Game is not in action "]);
			exit;
		}
		if($status['turn'] != $player_type){
			header("HTTP/1.1 400 Bad Request");
			print json_encode(['errormesg'=>"It is not your turn "]);
			exit;	
		}		
		
		
		if($player_type=='P')
		{	$sql = 'update deck set player_hand=1, where id=? and player_hand!=1 and croupier_hand!=1';
			$st=$mysqli->prepare($sql);	
			$st->bind_param('ss',$id);
			$st->execute();	

			$sql = 'select img from deck where id=?';
			$st=$mysqli->prepare($sql);	
			$st->bind_param('ss',$id);
			$st->execute();	
			$res = $st->get_result();
			
			header('Content-type: application/json');
			print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
		}
		else if($player_type=='C')
		{
			$sql = 'update deck set croupier_hand=1, where id=?';
			$st=$mysqli->prepare($sql);	
			$st->execute();	
			$st->bind_param('ss',$id);
			$res = $st->get_result();
			
			$sql = 'select img from deck where id=?';
			$st=$mysqli->prepare($sql);	
			$st->bind_param('ss',$id);
			$st->execute();	
			$res = $st->get_result();
			header('Content-type: application/json');
			print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
		}
		else
		{	
			header("HTTP/1.1 400 Bad Request");
			header("['errormesg'=>You are neither the Player nor the Dealer.]");
			exit;
		}
		header("HTTP/1.1 200 OK");
		print json_encode($res, JSON_PRETTY_PRINT);		
	}


function handleStand($token) {
    global $mysqli;
    if($token=='' || $token==NULL)
		{
			header("HTTP/1.1 400 Bad Request");
			print json_encode(['errormesg'=>"token is not set."]);
			exit;
        }
       $player_type = current_player($token);
    if($player_type==NULL){
        header("HTTP/1.1 400 Bad Request");
			print json_encode(['errormesg'=>"You are not a player of this game "]);
			exit;
    }
    $status=show_status();
		if($status['status']!='STARTED')
		{
			header("HTTP/1.1 400 Bad Request");
			print json_encode(['errormesg'=>"Game is not in action "]);
			exit;
        }
        if($status['p_turn'] != $player_type){
			header("HTTP/1.1 400 Bad Request");
			print json_encode(['errormesg'=>"It's not your turn "]);
			exit;	
        }	
        if($status['p_turn']=='P')
		{
			$next_turn='C';
			$updatecommand="update game_status set turn= ? ";
			$st=$mysqli->prepare($updatecommand);
			$st->bind_param('s',$next_turn);
			$st->execute();
		}
		else if($status['turn']=='C')
		{
			calc_winner();
		}	
}



function calc_winner()
	{
        /* select SUM(points) fron deck where player_hand=1*/
        /* select SUM(points) fron deck where croupier_hand=1*/
		global $mysqli;	
		$st=$mysqli->prepare("select SUM(card_score
									from deck 
									where player_hand=1)");
		$st->execute();
		$res=$st->get_result();
		$rp=$res->fetch_assoc();

		$st=$mysqli->prepare("select SUM(card_score
									from deck 
									where croupier_hand=1)");
		$st->execute();
		$res=$st->get_result();
		$rc=$res->fetch_assoc();
		
		if($rc>=$rp && $rc<=21)
		{
			$st=$mysqli->query("update game_status set result='C' , p_turn=NULL , status='ended'");
		}
		else if ($rp>$rc && $rp<=21)
		{
			$st=$mysqli->query("update game_status set result='P' ,p_turn=NULL , status='ended'");				
		}
		else if ($rp<21 && $rc>21)
		{
			$st=$mysqli->query("update game_status set result='P' ,p_turn=NULL , status='ended'");		
		}
		else if ($rc<21 && $rp>21)
		{
			$st=$mysqli->query("update game_status set result='C' , p_turn=NULL , status='ended'");		
		}
		else
		{
			header("HTTP/1.1 400 Bad Request");
			exit;
		}	
		$sql="select result from game_status";
		$st=$mysqli->query($sql);		
		header('Content-type: application/json');
		print json_encode($res=$st->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);	
	}
	


 
function handle_player($method, $request,$input) {
	switch ($b=array_shift($request)) {
		case '':
		case null: if($method=='GET') {show_users($method);}
				   else {header("HTTP/1.1 400 Bad Request"); 
						 print json_encode(['errormesg'=>"Method $method not allowed here."]);}
                    break;
        case 'C': 
		case 'P': handle_user($method, $b,$input);
					break;		
		default: header("HTTP/1.1 404 Not Found");
				 print json_encode(['errormesg'=>"Player $b not found."]);
                 break;
	}
}

function handle_deck($method,$input) {
 
    if($method=='GET') {
            read_deck($input);
    } else if ($method=='POST') {
            reset_deck();
            read_deck($input);
    }
    
}

 ?>