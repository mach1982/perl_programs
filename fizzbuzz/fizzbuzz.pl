#!/bin/perl


for ($i=0; $i<=100; $i++){
 print $i;

if ($i%5==0){

print "\nfizz\n";


}
elsif ($i%3==0){

print "\nbuzz\n";


}
elsif ($i%5!=0 || $i%3!=0){

print "\nfizzbuzz\n";


}


}
