function [RSB trapzRS simpsonRSB] = RSB(Og,Filtered,Fe)
    mfilter = mean(Filtered);
    mog = mean(Og);
    for id = 1:length(Filtered)
        normS2(id) = Og(id) - mog;
        normFilter(id) = Filtered(id) - mfilter;
    end
    
    maxOg = max(normS2);
    maxFilter = max(normFilter);

    normS2 = normS2/maxOg;
    normFilter = normFilter/maxFilter;
    
%     figure
%     plot(normS2);
%     title('norms2');
%     figure
%     plot(normFilter);
%     title('normFilter');
    
    [corr,lag] = xcorr(normFilter,normS2); 
    [~,I] = max(abs(corr));
    lagDiff = lag(I);
    normFilter = normFilter(lagDiff+1:end);
    t1 = (0:length(normFilter)-1)/Fe;

    b1 = find(t1==0.8);
    b2 = find(t1==3);
    normFilter = normFilter(b1:b2);
    bruit = normS2(b1:b2) - normFilter;

    num = 0;
    denum =0;
    for id = 1:length(bruit)
        num = num + normS2((id+b1-1)).^2;
        denum = denum + bruit(id).^2;
    end

    RSB = 10.*log10(num/denum);
    
    trapzRS = trapz(bruit);
    
    h = 1;
    sumodd=0;
    sumeven=0;
    for id = 2:2:length(bruit)-1;
       sumeven = sumeven + bruit(id);
    end
    for id = 3:2:length(bruit)-1;
       sumeven = sumeven + bruit(id);
    end
    
    simpsonRSB = (h/3).*(bruit(1) + bruit(end) + 4.*sumodd + 2.*sumeven)