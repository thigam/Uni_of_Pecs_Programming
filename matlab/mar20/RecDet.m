function D=RecDet(M)
D=0;
if size(M,1)~=size(M,2) %length(unique(size(M)))>1
    error('The matrix is not a square');
end
if size(M,1)~=1 %it1s not a pne by one
    for ii=1:size(M,1)
        D=D+(-1)^(ii-1)*M(ii,1)*RecDet(M((1:end)~=ii,2:end));
    end
else
    D=M(1,1);
end
    end

    %M(1:ii-1,2:end) ; M(ii+1,2:end)