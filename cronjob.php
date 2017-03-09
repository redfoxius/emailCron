<?php
// Database connection settings
$db_host = "host";
$db_name = "database";
$db_user = 'user';
$db_pass = "password";
// Database connection
try {
    $db = new PDO('mysql:host='.$db_host.';dbname='.$db_name, $db_user, $db_pass);
} catch (PDOException $e) {
    print "Error!: " . $e->getMessage() . "<br/>";
    die();
}

function sendNotification($client, $id, $title, $link, $n) {
	$days = $n.($n == 1 ? ' day' : ' days');
	$subject = 'Your advert "'.$title.'" will expire in '.$days;
	$msg = 'Dear customer!<br/>';
	$msg .= 'We want to inform you that your advert "'.$title.'" (#'.$id.', link: <a href="'.$link.'">'.$link.'</a> will expire in '.$days.'.<br/>';
    $from = 'notifier@eboards.com';
    $headers  = 'MIME-Version: 1.0' . '\r\n';
    $headers .= 'Content-type: text/html; charset=iso-8859-1' . '\r\n';
    $headers .= 'From: '.$from.'\r\n';
    $result = mail($client, $subject, $msg, $headers);
}

function updateAd($db, $id, $status, $today) {
	if ($status == 2) {
		$input = $db->prepare("UPDATE items SET last_checked = :today WHERE id = :id");
		$result = $input->execute(array('id' => $id, 'today' => $today->format('Y-m-d').' 00:00:00'));
	} else if ($status == 3) {
		$input = $db->prepare("UPDATE items SET status = :status, last_checked = :today, publicated_to = :end WHERE id = :id");
		$result = $input->execute(array('id' => $id, 'today' => $today->format('Y-m-d').' 00:00:00', 'end' => $today->format('Y-m-d H:i:s'), 'status' => $status));
	}
}

/* Update this array for setup number of days you need to notify */
$periods = array(1, 2, 5);

$now = new DateTime();
$input = $db->prepare("SELECT i.id, i.link, i.title, u.email AS client, i.publicated_to AS end 
	FROM items AS i
	LEFT JOIN users AS u
	ON i.user_id = u.id
	WHERE i.status = 2
	AND i.last_checked < :today
	LIMIT 100");
$input->execute(array('today' => $now->format('Y-m-d').' 00:00:00'));
$ads = $input->fetchAll();
foreach ($ads as $ad) {
	/* get number of days left for ad */
	$end = new DateTime($ad['end']);
	$left = $end->diff($now);
	$days = $left->days + round($left->hours/24);
	/* if we meet requirements for notification */
	if (in_array($days, $periods)) {
	    sendNotification($ad['client'], $ad['id'], $ad['title'], $ad['link'], $days);
	}
	/* check if we need to update ad status */
	if ($left->format('%R') === '+') {
		$status = 3;
	} else {
		$status = 2;
	}
	updateAd($db, $ad['id'], $status, $now);
}