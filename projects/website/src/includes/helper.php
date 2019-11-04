<?php
/**
 * helper.php
 *
 * Functions that can be just called as needed
 *
 */

function hashPassword($password, $salt = 'helloworld') {
	$cost = 12;
	if (isset($HASH_PASSWORD_COST)) {
		$cost = $HASH_PASSWORD_COST;
	}

	$options = [
    'cost' => $cost,
  ];
	return password_hash($password, PASSWORD_BCRYPT, $options);
}

function hashPasswordFindCost() {
	/**
	 * See https://www.php.net/manual/en/function.password-hash.php
	 */
	/**
	 * This code will benchmark your server to determine how high of a cost you can
	 * afford. You want to set the highest cost that you can without slowing down
	 * you server too much. 8-10 is a good baseline, and more is good if your servers
	 * are fast enough. The code below aims for ≤ 50 milliseconds stretching time,
	 * which is a good baseline for systems handling interactive logins.
	 */
	$timeTarget = 0.05; // 50 milliseconds 

	$cost = 8;
	do {
		$cost++;
		$start = microtime(true);
    password_hash("test", PASSWORD_BCRYPT, ["cost" => $cost]);
    $end = microtime(true);
  } while (($end - $start) < $timeTarget);
  echo "Appropriate Cost Found: " . $cost;
}

function sanitiseUserInput($userInput) {
	$result = trim($userInput);
	$result = stripslashes($result);
	$result = htmlspecialchars($result, ENT_NOQUOTES);
	// $result = mysql_real_escape_string($result);
	return $result;
}

function redirect($url, $statusCode = 303) {
   header('Location: ' . $url, true, $statusCode);
   die();
}

?>