function s = toString(C)

for k=1:size(C,1)
    str="";
    for l=1:size(C,2)
        str=str+C(k,l); 
    end
    s(k)=str;
end
end

