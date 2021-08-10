clc;
%%
%This program models a communication system. Here we are doing source
%coding on the text file, then channel coding, then sending it through a
%binary symmetric channel and then decoding back to get the transmitted
%text file

%% Source Coding
fileId1=fopen('File2_Words.txt','r');
f1=fscanf(fileId1,'%c');
f1=uint8(f1)+1;

[fu1,fr1]=freqArr(f1);

fclose(fileId1);

N1=size(f1,2)*log2(size(fu1,2));
fileOut=fopen('text_transmitted.txt','w');
%% Channel coding
% The coding represented here is random, and might give an ineffient code
% with low probability, but here we are only demonstrating the use of
% probability in communication network

sz=size(fu1,2);
k=ceil(log2(sz));
n=4*k;
% Change this p to change bit flip probability in BSC channel, set it to 0
% to get 0 error
p=0.15; 
E=0; %counter E which counts the number of decoding errors that occur

X = randi([0 2^n-1],1,2^k); %selecting random numbers from 1 to 2^n-1
C1=barray(X,k,n); % making a random code of 2^k vectors from vector space {0,1}^n
C1=C1(1:sz,:);     %Selecting only required number of unique code words
index1=1:sz;
index2=1:sz;
Cs=toString(C1);
M2=containers.Map(Cs,fu1);
M1=containers.Map(fu1,Cs);


for l=1:size(f1,2)
I=0; % defining indicator random variable

% c = C1(rndmi,:); %Picking a random codeword from code C
ctmp=M1(f1(l));
c=strtoBin(ctmp);

y =channel(c,n,p); % Making a vector y by flipping each position of codeword c with probability p

c1=decoder(p,y,C1,n,k); %The recieved vector y runs through the Maximum likelihood decoder and gives the estimate codeword c1

if(c1==c) %If codeword is same as estimate
    I=0; %Decoder doesn't make error and indicator value is 0
else
    I=1; %If not equal, decoder makes an error and indicator value is 1
end
E=E+I; %Computing E which is no. of errors made by decoder in N iterations

ch=M2(toString(c1));

fprintf(fileOut,'%s',char(ch-1)); 

end
P1 = E/size(f1,2); %Calculates the probability of error
fclose (fileOut);

disp("Decoding Error[Prob(decoded sequence not equal to transmitted sequence)]:");
disp(P1);

