numberoftemp=floor(max_temperature)-floor(min_temperature);
temp_stat = zeros(numberoftemp+5,6);
temp_stat(:,1)=floor(min_temperature)-3:(floor(max_temperature))+1;
temp_stat=sortrows(temp_stat,-1);

for k = 1:size(result,1)
    if k==1||floor(result(k,2))<floor(result(k-1,2))
       
       for m = 1:size(temp_stat,1)
            if floor((result(k,2)))+1==temp_stat(m,1)
                temp_stat(m,2)=result(k,1);
            end
       end
   end
    
end

for m=2:size(temp_stat,1)-1
    
   temp_stat(m,3)= temp_stat(m+1,2)-temp_stat(m,2);
   
   if temp_stat(m,3)<0
       temp_stat(m,3)=0;
   end
    
    
end





stat_1234 = zeros(40,6);
stat_1234(:,1)=-39:0;
stat_1234=sortrows(stat_1234,-1);

count_stat = 1;


for n = 1:size(stat_1234,1)
    for m = 1:size(temp_stat,1)
        if stat_1234(n,1)==temp_stat(m,1)
           stat_1234(n,4)=temp_stat(m,3);
        end
        
    end
end





for i = 1:count_1234
   if i==1||floor(channel_1234_sorted(i,1))~=floor(channel_1234_sorted(i-1,1))
      
       stat_1234(-floor(channel_1234_sorted(i,1)),2)=channel_1234_sorted(i,3);
       count_stat = 1;
       
   end
   if i~=1 && floor(channel_1234_sorted(i,1))~=floor(channel_1234_sorted(i-1,1))
      
       stat_1234(-floor(channel_1234_sorted(i-1,1)),3)=channel_1234_sorted(i-1,3);
%        stat_1234(-floor(channel_1234_sorted(i-1,1)),4)=abs(stat_1234(-floor(channel_1234_sorted(i-1,1)),2)-stat_1234(-floor(channel_1234_sorted(i-1,1)),3));
       
   end
   
   if i==count_1234
      
       stat_1234(-floor(channel_1234_sorted(i,1)),3)=channel_1234_sorted(i,3);
%        stat_1234(-floor(channel_1234_sorted(i,1)),4)=abs(stat_1234(-floor(channel_1234_sorted(i,1)),2)-stat_1234(-floor(channel_1234_sorted(i,1)),3));
       
   end
   
   stat_1234(-floor(channel_1234_sorted(i,1)),5)=count_stat;
   count_stat = count_stat+1;
    
end

for j = 1:40
   
    if stat_1234(j,4)~=0
    stat_1234(j,6)=stat_1234(j,5)/stat_1234(j,4);
    
    end
    
    
end



hFig = figure;
set(hFig, 'Position', [200 300 900 555])

plot(stat_1234(:,1),stat_1234(:,6),'color',[0.3 0.3 0.3],'linewidth',1.5)
set(gca,'XLim',[-36 0])
set(gca,'XTick',[-35:5:0])
set(gca,'yLim',[0 60])
set(gca,'yTick',[0:5:60])
set(gca,'XDIR','reverse') 
set(gca,'FontSize',25,'FontName','Arial')
xL = get(gca,'XLim');
line(xL,[5 5],'Color','r');
set(gca,'yticklabel',{0,5,10,[],20,[],30,[],40,[],50,[],60})



stat_5678 = zeros(40,6);
stat_5678(:,1)=-39:0;
stat_5678=sortrows(stat_5678,-1);

count_stat = 1;


for n = 1:size(stat_5678,1)
    for m = 1:size(temp_stat,1)
        if stat_5678(n,1)==temp_stat(m,1)
           stat_5678(n,4)=temp_stat(m,3);
        end
    end
end

for i = 1:count_5678
   if i==1||floor(channel_5678_sorted(i,1))~=floor(channel_5678_sorted(i-1,1))
      
       stat_5678(-floor(channel_5678_sorted(i,1)),2)=channel_5678_sorted(i,3);
       count_stat = 1;
       
   end
   if i~=1 && floor(channel_5678_sorted(i,1))~=floor(channel_5678_sorted(i-1,1))
      
       stat_5678(-floor(channel_5678_sorted(i-1,1)),3)=channel_5678_sorted(i-1,3);
%        stat_5678(-floor(channel_5678_sorted(i-1,1)),4)=abs(stat_5678(-floor(channel_5678_sorted(i-1,1)),2)-stat_5678(-floor(channel_5678_sorted(i-1,1)),3));
       
   end
   
   if i==count_5678
      
       stat_5678(-floor(channel_5678_sorted(i,1)),3)=channel_5678_sorted(i,3);
%        stat_5678(-floor(channel_5678_sorted(i,1)),4)=abs(stat_5678(-floor(channel_5678_sorted(i,1)),2)-stat_5678(-floor(channel_5678_sorted(i,1)),3));
       
   end
   
   stat_5678(-floor(channel_5678_sorted(i,1)),5)=count_stat;
   count_stat = count_stat+1;
    
end

for j = 1:40
   
    if stat_5678(j,4)~=0
    stat_5678(j,6)=stat_5678(j,5)/stat_5678(j,4);
    
    end
    
    
end



hFig = figure;
set(hFig, 'Position', [200 300 900 555])

plot(stat_5678(:,1),stat_5678(:,6),'color',[0.3 0.3 0.3],'linewidth',1.5)
set(gca,'XLim',[-36 0])
set(gca,'XTick',[-35:5:0])
set(gca,'yLim',[0 60])
set(gca,'yTick',[0:5:60])
set(gca,'XDIR','reverse') 
set(gca,'FontSize',25,'FontName','Arial')
xL = get(gca,'XLim');
line(xL,[5 5],'Color','r');
set(gca,'yticklabel',{0,5,10,[],20,[],30,[],40,[],50,[],60})
