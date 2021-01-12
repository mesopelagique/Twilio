
Class constructor($client : cs:C1710.Client)
	This:C1470.client:=$client
	
Function url()->$url : Text
	$url:=This:C1470.client.baseURL()+This:C1470.client.accountSid
	
Function buildQuery($params : Object)->$query : Text
	$query:=""
	For each ($key; $params)
		var $value : Variant
		$value:=$params[$key]
		
		Case of 
			: (Value type:C1509($value)=Is collection:K8:32)
				
				For each ($value2; $value)
					If (Length:C16($query)>0)
						$query:=$query+"&"  // todo opti : could move before for each but must test col lenght
					End if 
					
					$query:=$query+$key+"="+This:C1470.urlEncode(String:C10($value2))
					
				End for each 
				
			Else   // suppose convertible to string but could add more case here to exclude
				
				If (Length:C16($query)>0)
					$query:=$query+"&"
				End if 
				$query:=$query+$key+"="+This:C1470.urlEncode(String:C10($value))
				//$query:=$query+$key+"=\""+This.urlEncode(String($value))+"\"" // quote?
				
		End case 
		
		
	End for each 
	
	
Function urlEncode($url : Text)->$encoded : Text
	// From https://github.com/miyako/4d-tips-encode-uri
	
	C_LONGINT:C283($i)
	C_BOOLEAN:C305($shouldEncode)
	C_BLOB:C604($data)
	
	For ($i; 1; Length:C16($url))
		
		$char:=Substring:C12($url; $i; 1)
		$code:=Character code:C91($char)
		
		$shouldEncode:=False:C215
		
		Case of 
			: ($code=32)
				
			: ($code=45)
				// -
			: ($code=46)
				// .
			: ($code>47) & ($code<58)
				// 0 1 2 3 4 5 6 7 8 9
			: ($code>64) & ($code<91)
				// A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
			: ($code=95)
				// _
			: ($code>96) & ($code<123)
				// a b c d e f g h i j k l m n o p q r s t u v w x y z
			: ($code=126)
				// ~
			Else 
				$shouldEncode:=True:C214
		End case 
		
		If ($shouldEncode)
			CONVERT FROM TEXT:C1011($char; "utf-8"; $data)
			For ($j; 0; BLOB size:C605($data)-1)
				$hex:=String:C10($data{$j}; "&x")
				$encoded:=$encoded+"%"+Substring:C12($hex; Length:C16($hex)-1)
			End for 
		Else 
			If ($code=32)
				$encoded:=$encoded+"+"
			Else 
				$encoded:=$encoded+$char
			End if 
		End if 
		
	End for 