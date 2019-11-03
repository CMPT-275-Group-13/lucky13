<?php
/**
 * helper.php
 *
 * Functions that can be just called as needed
 *
 */

function sanitiseUserInput($userInput) {
	$result = trim($result);
	$result = stripslashes($result);
	$result = htmlspecialchars($result, ENT_NOQUOTES);
	$result = mysql_real_escape_string($result);
	return $result;
}

function redirect($url, $statusCode = 303) {
   header('Location: ' . $url, true, $statusCode);
   die();
}

?>