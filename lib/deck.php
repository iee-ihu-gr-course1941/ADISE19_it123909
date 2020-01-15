<?php

/* select all from cards to show deck */
function show_card($x) {
	global $mysqli;
	/* show cards that used =1? */
	$sql = 'select * from deck where id=?';
	$st = $mysqli->prepare($sql);
	$st->bind_param('ii',$x);
	$st->execute();
	$res = $st->get_result();
	header('Content-type: application/json');
	print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
}


/* select clear deck */
function reset_deck() {
	global $mysqli;
	$sql = 'call clean_deck()';
	$mysqli->query($sql);
}
/* select all from deck to show deck */
function read_deck() {
	global $mysqli;
	$sql = 'select * from deck';
	$st = $mysqli->prepare($sql);
	$st->execute();
	$res = $st->get_result();
	return($res->fetch_all(MYSQLI_ASSOC));
}

?>
