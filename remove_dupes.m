%% removes duplicate rows in a Matrix A based upon window size and mode.
%
%% The mode determines how we reduce the rows.
%
%% Mode     Description
% first     picks the first duplicate row
% last      picks the last duplicate row
% min       picks the row with minimum third column
% max       picks the row with maximum third column
% avg       uses the average of the columns
%
%
% A=[1,2;1,2;1,2;1,2]
% Window=[1,1]
% Mode = 'first'
% result = [1,2];

%% remove_dupes
function result = remove_dupes(A,Window,mode)
    result = [];
    [nRow,nCol] = size(A)
    xadj = Window(1);
    yadj=Window(2);
    
    while nRow ~= 0
%        disp(['i= ',num2str(i)]);
        row = A(1,:);
        x=row(1);
        y=row(2);
        theRows=find( ...
            A(:,1)<(x+xadj) & ...
            A(:,1)>(x-xadj) & ...
            A(:,2)<(y+yadj) & ...
            A(:,2)>(y-yadj));
        if strcmp(mode,'first')
            result = [result; A(theRows(1),:)];
        elseif strcmp(mode,'last')
            result = [result; A(theRows(end),:)];
        elseif strcmp(mode,'avg')
            if nCol == 3
                if 1 == theRows
                    the_row_result = A(theRows,:);
                else
                    the_row_result = min(A(theRows,:));
                end
                result = [result; the_row_result];
            else
                error('Error, this mode requires 3 columns');
            end
        elseif strcmp(mode,'min')
            if nCol == 3
                if 1 == theRows
                    the_row_result = A(theRows,:);
                else
                    the_row_result = min(A(theRows,:));
                end
                result = [result; the_row_result];
            else
                error('Error, this mode requires 3 columns');
            end
        elseif strcmp(mode,'max')
            if nCol == 3
                if 1 == theRows
                    the_row_result = A(theRows,:);
                else
                    the_row_result = max(A(theRows,:));
                end
                result = [result; the_row_result];
            else
                error('Error, this mode requires 3 columns');
            end
        else
            error('Error, unspecified mode');
        end
        A(theRows,:)=[];
        [nRow,nCol] = size(A);
    end
    
end



