#!/bin/perl
use Net::Ping;



print "Enter in the IP address to scan:\n";
my $host=<>;
my $p = Net::Ping->new( "tcp", 2 );
my $status =$p->ping($host);


if ($status) {
    print " $host  is alive  \n";
    
   for ($i=0 ; $i<0 ; $ $i++){
        $p->port_number($i);
        print " port $i is open"
   }
} 
else {
    print "$host unreachable  \n";

}
$p->close();
