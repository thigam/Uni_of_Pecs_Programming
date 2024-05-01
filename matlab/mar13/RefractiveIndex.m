function n=RefractiveIndex(Mat,L)
    switch Mat
        case "Argon"
            n=Argon(L);
        case "BK7"
            n=BK7(L);
        otherwise
            error("No such material is defined.");
    end
end

function n=Argon(L)
    n=L.^2; %ensuring we can handle an input of more than one lambda at a time
end

function n=BK7(L)
    n=sqrt(L);
end