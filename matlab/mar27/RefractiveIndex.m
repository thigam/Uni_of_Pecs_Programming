function n=RefractiveIndex(L,M) %L for wavelenght and M for material
    arguments
        L (:,1) double {mustBeNonempty,mustBeFloat,mustBeVector,mustBeInRange(L,0.1,1)}
        M (1,1) string {mustBeTextScalar,mustBeMember(M,["Argon","BK7"])} = "Argon" %default value, if you ...
        % define a default variable for one argument, all the following ones must also have a default value
    end
    switch M
        case "Argon"
            n=1.5*L;
        case "BK7"
            n=1.7*L;
        otherwise
            error("Incorrect input for material.") %no need for this branch due to the validaiton code
    end
end