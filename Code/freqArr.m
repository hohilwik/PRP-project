function [fu,freq] = freqArr(f)

% This function returns the probability of all unique characters and the
% array of unique characters (fu)
f1=sort(f);
fu1=[];
c=1;
freq=[];
N=size(f1,2);
for k=1:size(f1,2)
    if(k<N&&f1(k)==f1(k+1))
        c=c+1;
    else
       fu1=[fu1 f1(k)];
       freq=[freq c/N];
       c=1;
    end
end
fu=fu1;
end

