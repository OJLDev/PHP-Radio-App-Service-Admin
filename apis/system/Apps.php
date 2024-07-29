<?php 
require "db.php";
class Apps extends db
{
   
	function __construct()
	{
		parent::__construct();
		
	}
	function Appdetail(){
	    $id = $_REQUEST['id'];
	    $query = $this->db->query("select * from applist where id = '$id' and status=1");
	    if($query->num_rows>0) :
		  while($row = $query->fetch_assoc()) :
		     $url =  dirname(siteUrl) ;
		    $coverimg = $url.'/'.$row['cover_image'];
		    $backgroundimg = $url.'/'.$row['background_image'];
		    $set['app'][] = array_merge($row,array('cover_image'=>$coverimg,'background_image'=>$backgroundimg));
		    $set['success']        =  1;
		    $set['status']         = 'success';
		  endwhile;
		 else : 
		    $set['app'][] = array("Message"=>"No app Found");
		    $set['success']        =  0;
		    $set['status']         = 'fail';
 		  endif;
		 
		 echo json_encode($set);
	}
	/******device token***********/
		function AddTokendetail(){
		if(isset($_POST['device_id']) && isset($_POST['device_token'])){    
	    $device_id = $_POST['device_id'];
	    $device_token = $_POST['device_token'];
		$query = $this->db->query("select * from device_token where device_id = '$device_id'");
		if($query->num_rows > 0) :
		    $update = $this->db->query("update device_token set device_token = '$device_token' where device_id ='$device_id'");
		  $row = $query->fetch_assoc(); 
		    if($update){
    		    $set['message']  =  "success";
    		    $set['status']  = 1;
		    }else{
		        $set['message']  =  "fail";
    		    $set['status']  = 0;
		    }
		 else : 
		     $insert = $this->db->query("insert into device_token (device_id,device_token)values('$device_id','$device_token')");
		    if($insert){
    		    $set['message']  =  "success";
    		    $set['status']  = 1;
		    }else{
		        $set['message']  =  "fail";
    		    $set['status']  = 0;
		    }
 		    endif;
		    }
    		else{
    			 $set['message']  =  "Invalid parameter or empty";
    		     $set['status']  = 0;
    		 }
			echo json_encode($set,JSON_HEX_TAG | JSON_HEX_APOS | JSON_HEX_QUOT | JSON_HEX_AMP | JSON_UNESCAPED_UNICODE);
		}   
    /***********************Last played************************/
    function LastPlayed(){
    $id = $_REQUEST['id']; 
    $siteUrl = dirname(siteUrl).'/'; 
    $query = $this->db->query("select * from applist where id = '$id' and status=1")->fetch_assoc();
    $setting = $this->db->query("select * from  tbl_setting")->fetch_assoc();
    $stream = $query['radio_stream'];
    $url = $stream.'/played.html?sid=1&type=json';
    // Initialize a CURL session.
    $ch = curl_init(); 
    // Return Page contents. 
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    //grab URL and pass it to the variable.
    curl_setopt($ch, CURLOPT_URL, $url);
     
    $result = curl_exec($ch);
    $data = array_slice(json_decode($result, true), 1);
    $array = array_slice(json_decode($result, true), 0, 1);
    foreach($array as $val){
        $title = $val['title'];
        $str = explode("-", $val['title']);
        $term = urlencode(trim($str[0]).'-'.trim($str[1]));
        $search = "https://itunes.apple.com/search?term=".$term."&media=music&limit=1c&entity=song";
        $imgval =  $this->getImg($search);
        if($imgval){
            $img = $imgval;
        }else{
            $img = $siteUrl.$setting['logo'];
        }
        $set['current_playing'][] = array('artist'=>trim($str[0]),'song_name'=>trim($str[1]),'image'=>$img,'playedat'=>$val['playedat']);
    }
    foreach($data as $val){
        $title = $val['title'];
        $str = explode("-", $val['title']);
        //$time = gmdate("H:i:A", $val['playedat']);
        $term = urlencode(trim($str[0]).'-'.trim($str[1]));
        $search = "https://itunes.apple.com/search?term=".$term."&media=music&limit=1c&entity=song";
        $imgval =  $this->getImg($search);
        if($imgval){
            $img = $imgval;
        }else{
            $img = $siteUrl.$setting['logo'];
        }
        $set['last_played'][] = array('artist'=>trim($str[0]),'song_name'=>trim($str[1]),'image'=>$img,'playedat'=>$val['playedat']);
    }
    if($set){
        echo json_encode($set,JSON_HEX_TAG | JSON_HEX_APOS | JSON_HEX_QUOT | JSON_HEX_AMP | JSON_UNESCAPED_UNICODE);
    }else{
        $set[] = array('msg'=>'Data not found','status'=>0);
        echo json_encode($set,JSON_HEX_TAG | JSON_HEX_APOS | JSON_HEX_QUOT | JSON_HEX_AMP | JSON_UNESCAPED_UNICODE);
    }
    
    }
	function getImg($imgval){
        $json =  file_get_contents($imgval);    
        $array = json_decode($json, true);
        foreach($array['results'] as $value)
        {
         $cover = str_replace('100x100', '340x340', $value['artworkUrl100']);
        }
        return $cover;
	}
	
	function WithoutImg(){
	    
	$id = $_REQUEST['id']; 
    $siteUrl = dirname(siteUrl).'/'; 
    $query = $this->db->query("select * from applist where id = '$id' and status=1")->fetch_assoc();
    $setting = $this->db->query("select * from  tbl_setting")->fetch_assoc();
    $stream = $query['radio_stream'];
    $url = $stream.'/played.html?sid=1&type=json';
    // Initialize a CURL session.
    $ch = curl_init(); 
    // Return Page contents. 
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    //grab URL and pass it to the variable.
    curl_setopt($ch, CURLOPT_URL, $url);
    $result = curl_exec($ch);
    $data = array_slice(json_decode($result, true), 1);
    $array = array_slice(json_decode($result, true), 0, 1);
    foreach($array as $val){
        $title = $val['title'];
        $str = explode("-", $val['title']);
        $set['current_playing'][] = array('artist'=>trim($str[0]),'song_name'=>trim($str[1]));
    }
    foreach($data as $val){
        $title = $val['title'];
        //$time = $this->get_time($val['playedat']);
        $str = explode("-", $val['title']);
        $set['last_played'][] = array('artist'=>trim($str[0]),'song_name'=>trim($str[1]),'playedat'=>$val['playedat']);
    }
    if($set){
        echo json_encode($set,JSON_HEX_TAG | JSON_HEX_APOS | JSON_HEX_QUOT | JSON_HEX_AMP | JSON_UNESCAPED_UNICODE);
    }else{
        $set[] = array('msg'=>'Data not found','status'=>0);
        echo json_encode($set,JSON_HEX_TAG | JSON_HEX_APOS | JSON_HEX_QUOT | JSON_HEX_AMP | JSON_UNESCAPED_UNICODE);
    }
	}
	function get_time($time) {
	    
	   date_default_timezone_set('asia/kolkata');
       return date("H:i", $time);
    }
}

?>