<?php

    class DbOperations
    {
        private $conn;
 
        //Constructor
        function __construct()
        {
            require_once dirname(__FILE__) . '/Config.php';
            require_once dirname(__FILE__) . '/DbConnect.php';
            // opening db connection
            $db = new DbConnect();
            $this->conn = $db->connect();
        }

        //check if patient information is in the database
        public function VerifyUser($email, $pass){
            $sql = "SELECT * 
                    FROM patient
                    WHERE email = :email
                    AND pass = :pass";
            $stmt = $this->$conn->prepare($sql);
            $stmt->bind_param("s",$email, $pass);
            $result = $stmt->execute();
            $stmt->close();

            if($result){
                return true;
            }else
            {
                return false;
            }
        }
     
        //function to view the patient's message
        public function SendNote($patient, $message, $date)
        {
           
        }
     
    }

?>