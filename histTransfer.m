function TransIm = histTransfer(I1,I2)

HistEdges = -0.5:1:255.5; % 256 bins of width 1
Counts1 = histcounts(I1,HistEdges);
PDF1 = Counts1/sum(Counts1);
Counts2 = histcounts(I2,HistEdges);
PDF2 = Counts2/sum(Counts2);
CDF1 = zeros(1,length(PDF1)+1);
CDF2 = zeros(1,length(PDF2)+1);
for k = 1:length(PDF1)
    CDF1(k+1) = CDF1(k) + PDF1(k);
    CDF2(k+1) = CDF2(k) + PDF2(k);
end
CDF1 = floor(CDF1(2:end)*(255));
CDF2 = floor(CDF2(2:end)*(255));
MatchInt = zeros(size(CDF1));

% Transfer histogram of image 1 to image 2
for i = 1:length(CDF1)
    ind = sum((CDF1 - CDF2(i) < 0)*1); % To find the index until the count is less than target.
    MatchInt(i) = ind+1-1;  % +1 for finding next index and -1 since intensity starts from 0
end

[height,width] = size(I2);
TransIm = zeros(size(I2));
for i = 1:height
    for j = 1:width
        intensity = I2(i,j);
        TransIm(i,j) = MatchInt(intensity+1); % +1 since intensity starts from 0
    end
end

TransIm = uint8(TransIm);
end

