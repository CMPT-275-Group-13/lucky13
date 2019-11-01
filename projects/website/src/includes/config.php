<?php
switch ($_SERVER["SCRIPT_NAME"]) {
	case "/php-template/about.php":
		$CURRENT_PAGE = "Paper Plane | About"; 
		$PAGE_TITLE = "About Us";
		break;
	case "/php-template/contact.php":
		$CURRENT_PAGE = "Paper Plane | Contact"; 
		$PAGE_TITLE = "Contact Us";
		break;
	default:
		$CURRENT_PAGE = "Paper Plane";
		$PAGE_TITLE = "Welcome to my homepage!";
}

?>