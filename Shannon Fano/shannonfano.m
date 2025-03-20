clc
clear

p=[0.5,0.2,0.2,0.05,0.05];
%p=[.5 .25 .125 .0625 .03125 .015625 .0078125 .0078125]
sta=[];
ar=[];
coded=[];
other=[];

first=0;
final=length(p);
sta=[first final]

for f=1:length(p)              
    other=[];
    ar=[];
    for h=1:(length(sta)-1)
        first=sta(h)+1
        final=sta(h+1)
        if(first>=final)       
            other=[other; 2];
            continue;
        end
        asum=0;
        difmat=[]
        for i=first:final       
            asum=asum+p(i);
            resum=0;
            for j=i+1:final;    
                resum=resum+p(j);
            end
            dif=abs(asum-resum);
            difmat=[difmat dif]
        end
        small=min(difmat);
        k=1;
        for i=first:final       
            if(small==difmat(k))
                break;
            end
            k=k+1;
        end
        index=i
        ar=[ar index]          
        ind=(index+1)-first
        remind=final-index      
        other=[other; zeros(ind,1); ones(remind,1)]
    end
    sta=[ar sta]               
    sta=sort(sta)
    coded=[coded other]     
    if(length(sta)>length(p)) 
        break;
    end
end

clc
len=[];
for i=1:length(p)
    word=[];
    for(j=1:f)             
        if(coded(i,j)==2)    
            break;
        end
        word=[word coded(i,j)];
    end
    len=[len length(word)];
    fprintf('\nSymbol %d code ==> ',i);
    disp(word)
end

ent=0;
avginfo=0;
for i=1:length(p)
    ent=ent+(p(i)*log2(1/p(i)));
    avginfo=avginfo+len(i)*p(i);
end
eff=(ent/avginfo)*100;
fprintf('\nCODING EFFICIENCY = ');
disp(eff);