<?php

class HashControl {

	var $algorithm;
	
	function __construct($algorithm){
		switch($algorithm) {
			case 'scrypt':
				break;
			default:
				# usar scrypt
			break;
		}
	}

}

?> 
