#this script will download individual information for the directory
#using an Invoke-WebRequest and a lower bound
#the amount of pages to download is set below

#control variable
$i = 0
#starting index for downloading pages
$low_bound = 1340210057
#variable for amount of pages to downlpad
$num_pages = 5
#Time between server request
$wait_period = 200
#clear cache of errors
$error.Clear();

#control loop for downloading pages
while($i -le $num_pages){
	$my_url = [string]::Concat("https://directory.uchicago.edu/individuals/",$low_bound);
	$hsg = Invoke-WebRequest -Uri $my_url;
	#if there was no error, create a new file, direct content, increment variable
	if($error.count -eq 0)
		{
			$file_name = [string]::Concat("index",$low_bound,".html");
			$hsg.Content > $file_name;
			$i = $i+1;
		}
	#if the page did not exist clear the cache and do noting
	else
		$error.Clear();
	
	$low_bound = $low_bound + 1;
	#increases time between page request in millisecons
	Start-Sleep -m $wait_period;

}

$i = 0;

