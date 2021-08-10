function y = channel(c,n,p)
y=zeros(1,n);
for m=1:n
  tmp=rand(1);
  if (tmp<=p)
      y(1,m) = 1-c(1,m);
  else
      y(1,m) = c(1,m);
  end
end
end 