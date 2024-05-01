function varargout=RootFinder(varargin)
    switch nargin %number of arguments in
        case 0
            helpdlg("This function works as follows: ...");
        case 1
            locations=-100:100;
            temp=zeros(size(locations));
            for ii=locations % you cannot use a column vector in a for loop
                temp(locations==ii)=fzero(varargin{1},ii);
            end
            varargout{1}=uniquetol(temp,1E-6);
        case 2
            for ii=1:numel(varargin{2})
                varargout{1}(ii)=fzero(varargin{1},varargin{2}(ii));
            end
        otherwise
            error("Too many arguments");
    end
end