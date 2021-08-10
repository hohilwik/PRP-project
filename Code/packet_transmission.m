% Parameter declaration 
K=11; % number of packets 
P=0.47; % probability of packet damage 
n=1000; % number of simulations 
% Main loop 
data = ones(1,n); % a place to store the results 
for k=1:n, 
transmissions=0; % transmission count 
packetsThrough=0; % number of packets that have made it across 
while packetsThrough < K, 
 r=rand; 
 transmissions = transmissions + 1; 
 while r < P, 
 r=rand; 
 transmissions = transmissions + 1; 
 end 
 packetsThrough = packetsThrough + 1; 
end 
data(k)=transmissions; 
end 
% show the results 
mean(data) 
hist(data) 
% Done
