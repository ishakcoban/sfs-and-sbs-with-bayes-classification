function pdf = compGaussDensVal(m,S,x)
for i=1:size(S,1)
    sum=0;
    for j=1:size(S,2)
        sum=sum+S(i,j);
    end
    if sum==0
        pdf=0;
        return
    end
end
l=size(m,1);
pdf=(1/((2*pi)^(l/2)*det(S)^0.5))*exp(-0.5*(x-m)'*inv(S)*(x-m));

end
