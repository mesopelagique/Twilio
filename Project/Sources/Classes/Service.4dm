
Class constructor($client : cs:C1710.Client)
	This:C1470.client:=$client
	
Function url()->$url : Text
	$url:=$client.baseURL()+This:C1470.client.accountSid
	
Function buildQuery($params : Object)->$query : Text
	$query:=""
	For each ($key; $params)
		var $value : Variant
		$value:=$params[$key]
		
		Case of 
			: (Value type:C1509($value)=Is collection:K8:32)
				
				For each ($value2; $value)
					If (Length:C16($query>0))
						$query:=$query+"&"  // todo opti : could move before for each but must test col lenght
					End if 
					
					$query:=$query+$key+"="+This:C1470.urlencode(String:C10($value2))
					
				End for each 
				
			Else   // suppose convertible to string but could add more case here to exclude
				
				If (Length:C16($query>0))
					$query:=$query+"&"
				End if 
				$query:=$query+$key+"="+This:C1470.urlencode(String:C10($value))
				
		End case 
		
		
	End for each 
	
	
Function urlEncode($input : Text)->$output : Text
	// TODO url encodes
	$output:=$input