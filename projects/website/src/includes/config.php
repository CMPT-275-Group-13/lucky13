<?php
require_once("helper.php");

switch ($_SERVER["SCRIPT_NAME"]) {
	case "/about.php":
		$CURRENT_PAGE = "About"; 
		$PAGE_TITLE = "About Us";
		redirect("https://github.com/CMPT-275-Group-13/lucky13/wiki");
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