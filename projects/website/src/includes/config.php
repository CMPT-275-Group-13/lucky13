<?php
require_once("helper.php");

/**
 * CONSTANTS
 *
 * Please don't change this
 */
$HASH_PASSWORD_COST = 10;

/**
 * VARIABLES
 */

switch ($_SERVER["SCRIPT_NAME"]) {
	case "/about.php":
		$CURRENT_PAGE = "About"; 
		$PAGE_TITLE = "About Us";
		break;
	case "/profile.php":
		$CURRENT_PAGE = "Profile"; 
		$PAGE_TITLE = "My Profile";
		break;
	case "/search.php":
		$CURRENT_PAGE = "Search"; 
		$PAGE_TITLE = "Search";
		break;
	case "/register.php":
		$CURRENT_PAGE = "Register"; 
		$PAGE_TITLE = "Registration";
		break;
	case "/index.php":
		$CURRENT_PAGE = "Index"; 
		$PAGE_TITLE = "Paper Plane";
		break;
	case "/landing.php":
		$CURRENT_PAGE = "Landing"; 
		$PAGE_TITLE = "Paper Plane";
		break;
	case "/message.php":
		$CURRENT_PAGE = "Message"; 
		$PAGE_TITLE = "Paper Plane";
		break;
	case "/tests.php":
		$CURRENT_PAGE = "Tests"; 
		$PAGE_TITLE = "Tests";
		break;
	case "/brain-test-results.php":
		$CURRENT_PAGE = "Brain Test Results"; 
		$PAGE_TITLE = "Brain Test Results";
		break;
	case "/tremor-test-results.php":
		$CURRENT_PAGE = "Tremor Test Results"; 
		$PAGE_TITLE = "Tremor Test Results";
		break;
	default:
		$CURRENT_PAGE = "Default";
		$PAGE_TITLE = "Paper Plane";
}

/**
 * User must be logged in
 */
// if ($CURRENT_PAGE != "Login" && true) {
// 	header("Location: login.php");
// }

?>