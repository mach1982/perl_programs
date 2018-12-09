#!/bin/perl

use LEGO::NXT;
use LEGO::NXT::BlueComm;
use LEGO::NXT::Constants qw(:DEFAULT);
use Data::Dumper;
use Net::Bluetooth;
use Net::Identica;

#use Net::Twitter;
my $user='USER ID '; #user id
my $passwd='PASSWORD '; #password 




#enter in  you own devie's buletooh id
my $nxt = LEGO::NXT->new( new LEGO::NXT::BlueComm('00:16:53:02:77:E0',2));
#stay alive  
$nxt->keep_alive($NXT_NORET);
 
 
my $id =Net::Identica->new(username => $user, password => $passwd);




$Status="Danger Intruder";
$dis= '60';

#initialize ultrasound sensor 
$nxt->initialize_ultrasound_port($NXT_SENSOR_4);
$res = $nxt->get_ultrasound_measurement_byte($NXT_SENSOR_4,0);

#my $us = $res->{data};

if( $res->{data} <= $dis){

#send tweet 
$id->update($Status);
print ("test");

}
