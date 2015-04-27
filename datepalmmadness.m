% simulated date palm madness
% Load Images
I18=imread('simulated_date_palms.png');
IGS=rgb2gray(I18);
I1D=im2double(IGS);

% verify size
[nRow,nCol] = size(I1D);
if 640 ~= nCol
    disp('number of columns for I1D is wrong');
end
if 400 ~= nRow
    disp('number of rows for I1D is wrong');
end

I28=imread('a_palm.png');
IGS=rgb2gray(I28);
I2D=im2double(IGS);

% verify size
[nRowPalm,nColPalm] = size(I2D);

% Denote the target block by BTarget
BTarget = I2D;

% Find the nRowPalmxnColPam block in I1 which is most similar
% to BTarget
abserror = 0.07;
MinError = abserror; % 0.04 finds most, 0.05 finds dupes
FoundX=1; % corresponds to upper left X of image
FoundY=1; % corresponds to upper left Y of image
FoundPalms=zeros(1000,3);
rowCounter=1;
localBestX=0;
localBestY=0;
for i = 1:nRow-nRowPalm
    for j = 1:nCol-nColPalm
        theError = MAE( BTarget, I1D(i:i+nRowPalm-1, j:j+nColPalm-1) );
        if theError <= MinError
            MinError = theError;
            FoundX = i;
            FoundY = j;
            localBestX=i;
            localBestY=j;
            
%            FoundPalms(rowCounter,:)=[FoundX,FoundY,theError];
%            rowCounter=rowCounter+1;
%            disp(['Found a candidate frame. MAE = ', num2str(theError)]);
        else
            if theError > abserror
                if localBestX ~= 0
                    %disp(['using local min. MAE = ', num2str(theError)]);
                    FoundPalms(rowCounter,:)=[localBestX,localBestY,MinError];
                    rowCounter=rowCounter+1;
                    localBestX=0;
                    localBestY=0;
                end
                MinError = abserror;                
            end
        end
    end
end



% How many do we have after pass 1?
foundImage=zeros(nRow,nCol);
numPalmsFound = 0;
for i= 1:1000
    theError=FoundPalms(i,3);
    if theError ~= 0
        x=FoundPalms(i,1);
        y=FoundPalms(i,2);
        foundImage(x:x+nRowPalm,y:y+nColPalm) = 1;
        numPalmsFound=numPalmsFound + 1;
    end
end





% Pass two - clear up dupes.
nextSearch=1;
counter=1;
FoundPalms2=zeros(1000,3);
nomoretofind=false;
while(true)
    for i=nextSearch:1000
        x=FoundPalms(i,1);
        y=FoundPalms(i,2);
        theError=FoundPalms(i,3);
        if theError == 0
            nomoretofind=true;
            break;
        end
%        theRows=find(FoundPalms(:,1)<(x+5) & FoundPalms(:,1)>(x-5) & FoundPalms(:,3) ~= 0 )
        theRows=find(FoundPalms(:,2)<(y+17) & FoundPalms(:,2)>(y-17) & FoundPalms(:,1)<(x+17) & FoundPalms(:,1)>(x-17) & FoundPalms(:,3) ~= 0 );
        theMin=min(FoundPalms(theRows,3));
        theLocalMin=find(FoundPalms(theRows,3)==theMin,1); % the index for local min
        FoundPalms2(counter,:) = FoundPalms(theLocalMin+theRows(1),:);
        counter=counter+1;
        nextSearch=nextSearch+length(theRows(:));
        break;
    end
    if nomoretofind == true
        break;
    end
end


foundImage2=zeros(nRow,nCol);
numPalmsFound = 0;
for i= 1:1000
    theError=FoundPalms2(i,3);
    if theError ~= 0
        x=FoundPalms2(i,1);
        y=FoundPalms2(i,2);
        foundImage2(x:x+nRowPalm,y:y+nColPalm) = 1;
        numPalmsFound=numPalmsFound + 1;
    end
end

disp(['Number of palm trees found ',num2str(numPalmsFound)]);

figure('Name','Frame 1');
imshow(I1D);
%figure('Name','BTarget');
%imshow(BTarget);
%figure('Name', 'Diff of Target Frame2 Portion and Found Portion in Frame1');
%imshowpair(BTarget, I1D(FoundX:FoundX+XBounds, FoundY:FoundY+YBounds), 'diff');
%figure('Name', 'Diff of Target Frame2 Portion and Found Portion in Frame1. Color');
%imshowpair(BTarget, I1D(FoundX:FoundX+XBounds, FoundY:FoundY+YBounds));

%imshowpair(BTarget, I1D(FoundX:FoundX+XBounds, FoundY:FoundY+YBounds),'diff');

%figure('Name','The Palms Found Pass 1');
%imshow(foundImage);
figure('Name','The Palms Found Pass 2');
imshow(foundImage2);
