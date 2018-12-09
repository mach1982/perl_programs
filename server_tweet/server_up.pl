use Net::Twitter;
use Net::Ping;

my $host='192.168.1.7';
my $p = Net::Ping->new( "tcp", 2 );
my $status =$p->ping($host);

my $tweet = 'YOUR MESSAGE';

my $twitterconsumer = '';
my $twitterconsumersecret = '';
my $twitteraccesstoken = '';
my $twitteraccesstokensecret = '';

my $nt = Net::Twitter->new(
	traits   => [qw/API::RESTv1_1/],
	consumer_key    => $twitterconsumer,
	consumer_secret => $twitterconsumersecret,
	ssl => 1, #adds ssl auth 
	);
			
	if ($twitteraccesstoken && $twitteraccesstokensecret) {
	     $nt->access_token($twitteraccesstoken);
	     $nt->access_token_secret($twitteraccesstokensecret);
					}
					
	      unless ( $nt->authorized ) {
	      print "Authorize this app at ", $nt->get_authorization_url, " and enter the PIN#\n";
							
								
										
	 my($access_token, $access_token_secret, $user_id, $screen_name) = $nt->request_access_token(verifier => $pin);
	 print 'Access token: '.$access_token."\r\n".'Access Token Secret: '.$access_token_secret."\r\n";
												
	exit();
													
	}


if ($status) {													
    $nt->update({ status => $tweet });
}
