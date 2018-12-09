my $tweet = `fortune -n short`;



#ouath token information 

my $twitterconsumer = '';
my $twitterconsumersecret = '';
my $twitteraccesstoken = '';
my $twitteraccesstokensecret = '';


#Connecting to twitter
my $nt = Net::Twitter->new(
	traits   => [qw/API::RESTv1_1/],
	consumer_key    => $twitterconsumer,
	consumer_secret => $twitterconsumersecret,
	ssl => 1,
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

#Tweeting the meessage .
												
    $nt->update($tweet);
    print $tweet;

