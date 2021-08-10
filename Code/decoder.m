function c1 = decoder(p,y,C,n,k)
c1=zeros(1,n);
X = y-C; %Finding difference between the flipped vector y and codewords of code C
pmax=0; %Defining minimum distance=n
for z=1:size(C,1)
    nzero=0;
    for x=1:n
        if(X(z,x)==0)
            nzero=nzero+1; %Finding no. of zeroes in difference
        end
    end
    % (n-nzero) is the no. of positions where the vector y and
    % codewords of code are different which is equal to minimum distance
    cond_prob=(p^(n-nzero))*((1-p)^nzero);      %This is the conditional probability of y, given received sequence
    if(pmax<cond_prob)
        pmax=cond_prob;                         %Storing the max probability of getting y given the received sequence
        c1 = C(z,:); %Storing codeword of C in c1 if dmin is the minimum distance.
    end
end
end
