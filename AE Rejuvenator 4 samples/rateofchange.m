

energy_channel = dlmread('98214EnergyvsChannel.txt','\t',1,1);
max_event = size(energy_channel,1);
eventsoftemperature = zeros(max_event , 2);% record the temperature at which each event happens
  
mySheet = xlsread('08_11_temperature_output.csv');

num_rows = size(mySheet,1);
num_clock = num_rows ./ 5;
disp(num_clock);
result = zeros(num_clock , 2);
time = zeros(num_clock , 1);

for j = 1:num_clock
   time = mySheet((5*(j-1)+1),1);
   result(j,1) = (time-1)*5;
   result(j,2) = mySheet((5*(j-1)+2),1)-2.5;
end

rowsofresult = size(result,1);
max_temperature = result(1,2);
min_temperature = result(rowsofresult,2);


timeofevents = dlmread('08_11EventVsTime.txt', '\t', 1, 0);

results = zeros(max_event,10);
average = zeros(max_event,14);

threshold_energy = 4;

% axis manual

for k = 1:size(energy_channel,1) 
    cur_time = timeofevents(k,1);
    disp(k);
    for m = 2: num_clock
        if (cur_time > result(m-1,1) && cur_time <= result(m,1))
            cur_temperature = result(m-1,2)-(result(m-1,2)-result(m,2))/5 * abs(cur_time-result(m-1,1));
            break;
        end
        if (cur_time == result(m-1,1))
            cur_temperature = result(m-1,2);
            break;
        end
        if (cur_time == result(m,1))
            cur_temperature = result(m,2);
            break;
        end
    end
    
    results(k,:)=[k,cur_temperature,energy_channel(k,1),energy_channel(k,2),energy_channel(k,3),energy_channel(k,4),energy_channel(k,5),energy_channel(k,6),energy_channel(k,7),energy_channel(k,8)];
    check_en = zeros(8);
    for en_counter=1:8
       if energy_channel(k,en_counter)<threshold_energy
           check_en(en_counter)=0;
       else
           check_en(en_counter)=energy_channel(k,en_counter);
       end
    end
    
    av_count_1234 = 0;
    av_sum_1234 = 0;
    av_count_5678 = 0;
    av_sum_5678 = 0;
    
    for av_i_1234=1:4
        if(check_en(av_i_1234)~=0)
           av_count_1234 = av_count_1234+1;
           av_sum_1234 = av_sum_1234+check_en(av_i_1234);
        end
    end
    
    for av_i_5678=5:8
        if(check_en(av_i_5678)~=0)
           av_count_5678 = av_count_5678+1;
           av_sum_5678 = av_sum_5678+check_en(av_i_5678);
        end
    end
    
    if av_count_1234 >= 2
        av_1234 = av_sum_1234/av_count_1234;
    else
        av_1234 = 0;
    end 
    
    if av_count_5678 >= 2
        av_5678 = av_sum_5678/av_count_5678;
    else
        av_5678 = 0;
    end
        
%     if k~=1
%         if timeofevents(k,1)-timeofevents(k-1,1)==0
%             rate = 100;
%         else
%     rate = 1/(timeofevents(k,1)-timeofevents(k-1,1));
%         end
%     else
%     rate=0;
%     end

    minute = round(timeofevents(k,1)/60);
    
    
    
    average(k,:)=[k,cur_temperature, check_en(1),check_en(2),check_en(3),check_en(4),check_en(5),check_en(6),check_en(7),check_en(8),av_1234,av_5678,timeofevents(k,1),minute];   
    
    
    
    
    
    
end

count_1234 = 0;
count_5678 = 0;

timeminute=zeros(100,3);
timeminute(:,1)=1:100;



for j=1:max_event
    if average(j,11)~=0
        count_1234 = count_1234+1;
    end
    if average(j,12)~=0
        count_5678 = count_5678+1;
    end
    
    
  
    timeminute(average(j,14),2)=timeminute(average(j,14),2)+1;
        
    
    
    
end

channel_1234 = zeros(count_1234,4);
channel_5678 = zeros(count_5678,4);

c_1234 = 1;
c_5678 = 1;

 for m=1:max_event
   if average(m,11)~=0
       channel_1234(c_1234,1) = average(m,2);
       channel_1234(c_1234,2) = average(m,11);
       channel_1234(c_1234,3) = average(m,13);
%        if c_1234~=1
%         if channel_1234(c_1234,3)-channel_1234(c_1234-1,3)==0
%             rate = 100;
%         else
%             rate = 1/(channel_1234(c_1234,3)-channel_1234(c_1234-1,3));
%         end
%        else
%         rate=0;
%        end
        channel_1234(c_1234,4) = average(m,14);
       c_1234 = c_1234+1;
   end
   
   if average(m,12)~=0
       channel_5678(c_5678,1) = average(m,2);
       channel_5678(c_5678,2) = average(m,12);
       channel_5678(c_5678,3) = average(m,13);
%        if c_5678~=1
%             if channel_5678(c_5678,3)-channel_5678(c_5678-1,3)==0
%                 rate = 100;
%             else
%                 rate = 1/(channel_5678(c_5678,3)-channel_5678(c_5678-1,3));
%             end
%       else
%         rate=0;
%       end
        channel_5678(c_5678,4) = average(m,14);
       c_5678 = c_5678+1;
   end
   
 end
   
channel_1234_sorted = sortrows(channel_1234,-1);
channel_5678_sorted = sortrows(channel_5678,-1);




figure

plot(channel_1234_sorted(:,1),channel_1234_sorted(:,4))
xlim([-35,0])

figure

plot(channel_5678_sorted(:,1),channel_5678_sorted(:,4))
xlim([-35,0])



 
% figure (7)
% hFig = figure(7);
% set(hFig, 'Position', [200 300 900 555])
% 
% event_count1234 = 1:count_1234;
% event_temperature1234 = channel_1234_sorted(event_count1234,1);
% event_energy1234 = channel_1234_sorted(event_count1234,2);
% [ax,h1,h2]=plotyy(event_temperature1234,event_energy1234,event_temperature1234,event_count1234/10000);
% % title('Sample 1 Without Rejuvenator','FontSize',15,'FontName','Times New Roman','Color','black');
% % xlabel('Temperture (°C)','FontSize',22,'FontName','Times New Roman','Color','black');
% set(gca,'box','off')
% set(ax(1),'YLim',[0 400])
% set(ax(1),'YTick',[0:100:400])
% set(ax(2),'YLim',[0 8])
% set(ax(2),'YTick',[0:1:8])
% 
% set(ax,{'ycolor'},{'black';'black'})
% set(ax,'XLim',[-35 0])
% set(ax,'XTick',[-35:5:0])
% set(ax(1),'XDIR','reverse')
% set(ax(2),'XDIR','reverse')
% set(h1,'marker','.','color',[0.6 0.6 0.6],'MarkerSize',5)
% set(h2,'marker','.','color','red','MarkerSize',5)
% % ylabel(ax(1),'Energy Level (V^2-us)','FontSize',22,'FontName','Times New Roman','Color','black');
% % ylabel(ax(2),'AE event counts (x10^4)','FontSize',22,'FontName','Times New Roman','Color','black'); 
% set(ax(1),'FontSize',25,'FontName','Times New Roman')
% set(ax(2),'FontSize',25,'FontName','Times New Roman')
% 
% 
% figure (8)
% hFig = figure(8);
% set(hFig, 'Position', [200 300 900 555])
% 
% event_count5678 = 1:count_5678;
% event_temperature5678 = channel_5678_sorted(event_count5678,1);
% event_energy5678 = channel_5678_sorted(event_count5678,2);
% [ax,h1,h2]=plotyy(event_temperature5678,event_energy5678,event_temperature5678,event_count5678/10000);
% % title('Sample 1 With Rejuvenator','FontSize',15,'FontName','Times New Roman');
% % xlabel('Temperture (°C)','FontSize',22,'FontName','Times New Roman');
% set(gca,'box','off')
% set(ax(1),'YLim',[0 400])
% set(ax(1),'YTick',[0:100:400])
% set(ax(2),'YLim',[0 8])
% set(ax(2),'YTick',[0:1:8])
% set(ax,{'ycolor'},{'black';'black'})
% set(ax,'XLim',[-35 0])
% set(ax,'XTick',[-35:5:0])
% set(ax(1),'XDIR','reverse')
% set(ax(2),'XDIR','reverse')
% set(h1,'marker','.','color',[0.6 0.6 0.6],'MarkerSize',5)
% set(h2,'marker','.','color','blue','MarkerSize',5)
% % ylabel(ax(1),'Energy Level (V^2-us)','FontSize',22,'FontName','Times New Roman','Color','black');
% % ylabel(ax(2),'AE event counts (x10^4)','FontSize',22,'FontName','Times New Roman','Color','black'); 
% set(ax(1),'FontSize',25,'FontName','Times New Roman')
% set(ax(2),'FontSize',25,'FontName','Times New Roman')
   
   



% count_1 = 0;
% count_2 = 0;
% count_3 = 0;
% count_4 = 0;
% count_5 = 0;
% count_6 = 0;
% count_7 = 0;
% count_8 = 0;
% 
% for j=1:max_event
%     if energy_channel(j,1)>threshold_energy
%         count_1 = count_1+1;
%     end
%     if energy_channel(j,2)>threshold_energy
%         count_2 = count_2+1;
%     end
%     if energy_channel(j,3)>threshold_energy
%         count_3 = count_3+1;
%     end
%     if energy_channel(j,4)>threshold_energy
%         count_4 = count_4+1;
%     end
%     if energy_channel(j,5)>threshold_energy
%         count_5 = count_5+1;
%     end
%     if energy_channel(j,6)>threshold_energy
%         count_6 = count_6+1;
%     end
%     if energy_channel(j,7)>threshold_energy
%         count_7 = count_7+1;
%     end
%     if energy_channel(j,8)>threshold_energy
%         count_8 = count_8+1;
%     end
% end
% 
% channel_1 = zeros(count_1,2);
% channel_2 = zeros(count_2,2);
% channel_3 = zeros(count_3,2);
% channel_4 = zeros(count_4,2);
% channel_5 = zeros(count_5,2);
% channel_6 = zeros(count_6,2);
% channel_7 = zeros(count_7,2);
% channel_8 = zeros(count_8,2);
% 
% c_1 = 1;
% c_2 = 1;
% c_3 = 1;
% c_4 = 1;
% c_5 = 1;
% c_6 = 1;
% c_7 = 1;
% c_8 = 1;
% 
% for m=1:max_event
%    if results(m,3)>threshold_energy
%        channel_1(c_1,1) = results(m,2);
%        channel_1(c_1,2) = results(m,3);
%        c_1 = c_1+1;
%    end
%    if results(m,4)>threshold_energy
%        channel_2(c_2,1) = results(m,2);
%        channel_2(c_2,2) = results(m,4);
%        c_2 = c_2+1;
%    end
%    if results(m,5)>threshold_energy
%        channel_3(c_3,1) = results(m,2);
%        channel_3(c_3,2) = results(m,5);
%        c_3 = c_3+1;
%    end
%    if results(m,6)>threshold_energy
%        channel_4(c_4,1) = results(m,2);
%        channel_4(c_4,2) = results(m,6);
%        c_4 = c_4+1;
%    end
%      if results(m,7)>threshold_energy
%        channel_5(c_5,1) = results(m,2);
%        channel_5(c_5,2) = results(m,7);
%        c_5 = c_5+1;
%      end
%    if results(m,8)>threshold_energy
%        channel_6(c_6,1) = results(m,2);
%        channel_6(c_6,2) = results(m,8);
%        c_6 = c_6+1;
%    end
%    if results(m,9)>threshold_energy
%        channel_7(c_7,1) = results(m,2);
%        channel_7(c_7,2) = results(m,9);
%        c_7 = c_7+1;
%    end
%    if results(m,10)>threshold_energy
%        channel_8(c_8,1) = results(m,2);
%        channel_8(c_8,2) = results(m,10);
%        c_8 = c_8+1;
%    end
% end
% 
% 
% 
% figure
% 
% event_count1 = 1:count_1;
% event_temperature1 = channel_1(event_count1,1);
% event_energy1 = channel_1(event_count1,2);
% [ax,h1,h2]=plotyy(event_temperature1,event_energy1,event_temperature1,event_count1);
% title('Energy Distribution channel 1');
% xlabel('Temperture');
% set(ax(1),'YLim',[0 800])
% set(ax(1),'YTick',[0:50:800])
% set(ax(2),'YLim',[0 100000])
% set(ax(2),'YTick',[0:10000:100000])
% set(ax,'XLim',[-40 0])
% set(ax,'XTick',[-40:5:0])
% set(h1,'marker','.','color','red','MarkerSize',5)
% set(h2,'marker','.','color','yellow','MarkerSize',1)
% ylabel(ax(1),'Energy_Level');
% ylabel(ax(2),'Event count');
% hold(ax(1))
% hold(ax(2))
% 
% event_count2 = 1:count_2;
% event_temperature2 = channel_2(event_count2,1);
% event_energy2 = channel_2(event_count2,2);
% [ax2,h21,h22]=plotyy(event_temperature2,event_energy2,event_temperature2,event_count2);
% set(h21,'marker','.','color','red','MarkerSize',5)
% set(h22,'marker','.','color','yellow','MarkerSize',1)
% set(ax2(1),'YLim',[0 800])
% set(ax2(1),'YTick',[0:50:800])
% set(ax2(2),'YLim',[0 100000])
% set(ax2(2),'YTick',[0:10000:100000])
% set(ax2,'XLim',[-40 0])
% set(ax2,'XTick',[-40:5:0])
% 
% event_count3 = 1:count_3;
% event_temperature3 = channel_3(event_count3,1);
% event_energy3 = channel_3(event_count3,2);
% [ax3,h31,h32]=plotyy(event_temperature3,event_energy3,event_temperature3,event_count3);
% set(h31,'marker','.','color','red','MarkerSize',5)
% set(h32,'marker','.','color','yellow','MarkerSize',1)
% set(ax3(1),'YLim',[0 800])
% set(ax3(1),'YTick',[0:50:800])
% set(ax3(2),'YLim',[0 100000])
% set(ax3(2),'YTick',[0:10000:100000])
% set(ax3,'XLim',[-40 0])
% set(ax3,'XTick',[-40:5:0])
% 
% 
% event_count4 = 1:count_4;
% event_temperature4 = channel_4(event_count4,1);
% event_energy4 = channel_4(event_count4,2);
% [ax4,h41,h42]=plotyy(event_temperature4,event_energy4,event_temperature4,event_count4);
% set(h41,'marker','.','color','red','MarkerSize',5)
% set(h42,'marker','.','color','yellow','MarkerSize',1)
% set(ax4(1),'YLim',[0 800])
% set(ax4(1),'YTick',[0:50:800])
% set(ax4(2),'YLim',[0 100000])
% set(ax4(2),'YTick',[0:10000:100000])
% set(ax4,'XLim',[-40 0])
% set(ax4,'XTick',[-40:5:0])
% 
% event_count5 = 1:count_5;
% event_temperature5 = channel_5(event_count5,1);
% event_energy5 = channel_5(event_count5,2);
% [ax5,h51,h52]=plotyy(event_temperature5,event_energy5,event_temperature5,event_count5);
% set(h51,'marker','.','color','cyan','MarkerSize',5)
% set(h52,'marker','.','color','black','MarkerSize',1)
% set(ax5(1),'YLim',[0 800])
% set(ax5(1),'YTick',[0:50:800])
% set(ax5(2),'YLim',[0 100000])
% set(ax5(2),'YTick',[0:10000:100000])
% set(ax5,'XLim',[-40 0])
% set(ax5,'XTick',[-40:5:0])
% 
% 
% event_count6 = 1:count_6;
% event_temperature6 = channel_6(event_count6,1);
% event_energy6 = channel_6(event_count6,2);
% [ax6,h61,h62]=plotyy(event_temperature6,event_energy6,event_temperature6,event_count6);
% set(h61,'marker','.','color','cyan','MarkerSize',5)
% set(h62,'marker','.','color','black','MarkerSize',1)
% set(ax6(1),'YLim',[0 800])
% set(ax6(1),'YTick',[0:50:800])
% set(ax6(2),'YLim',[0 100000])
% set(ax6(2),'YTick',[0:10000:100000])
% set(ax6,'XLim',[-40 0])
% set(ax6,'XTick',[-40:5:0])
% 
% event_count7 = 1:count_7;
% event_temperature7 = channel_7(event_count7,1);
% event_energy7 = channel_7(event_count7,2);
% [ax7,h71,h72]=plotyy(event_temperature7,event_energy7,event_temperature7,event_count7);
% set(h71,'marker','.','color','cyan','MarkerSize',5)
% set(h72,'marker','.','color','black','MarkerSize',1)
% set(ax7(1),'YLim',[0 800])
% set(ax7(1),'YTick',[0:50:800])
% set(ax7(2),'YLim',[0 100000])
% set(ax7(2),'YTick',[0:10000:100000])
% set(ax7,'XLim',[-40 0])
% set(ax7,'XTick',[-40:5:0])
% 
% 
% event_count8 = 1:count_8;
% event_temperature8 = channel_8(event_count8,1);
% event_energy8 = channel_8(event_count8,2);
% [ax8,h81,h82]=plotyy(event_temperature8,event_energy8,event_temperature8,event_count8);
% set(h81,'marker','.','color','cyan','MarkerSize',5)
% set(h82,'marker','.','color','black','MarkerSize',1)
% set(ax8(1),'YLim',[0 800])
% set(ax8(1),'YTick',[0:50:800])
% set(ax8(2),'YLim',[0 100000])
% set(ax8(2),'YTick',[0:10000:100000])
% set(ax8,'XLim',[-40 0])
% set(ax8,'XTick',[-40:5:0])
% 




 
% figure (7)
% hFig = figure(7);
% set(hFig, 'Position', [200 300 900 555])
% 
% event_count1234 = 1:count_1234;
% event_temperature1234 = channel_1234_sorted(event_count1234,1);
% event_energy1234 = channel_1234_sorted(event_count1234,2);
% [ax,h1,h2]=plotyy(event_temperature1234,event_energy1234,event_temperature1234,event_count1234/10000);
% % title('Sample 1 Without Rejuvenator','FontSize',15,'FontName','Times New Roman','Color','black');
% % xlabel('Temperture (°C)','FontSize',22,'FontName','Times New Roman','Color','black');
% set(gca,'box','off')
% set(ax(1),'YLim',[0 400])
% set(ax(1),'YTick',[0:100:400])
% set(ax(2),'YLim',[0 8])
% set(ax(2),'YTick',[0:1:8])
% 
% set(ax,{'ycolor'},{'black';'black'})
% set(ax,'XLim',[-35 0])
% set(ax,'XTick',[-35:5:0])
% set(ax(1),'XDIR','reverse')
% set(ax(2),'XDIR','reverse')
% set(h1,'marker','.','color',[0.6 0.6 0.6],'MarkerSize',5)
% set(h2,'marker','.','color','red','MarkerSize',5)
% % ylabel(ax(1),'Energy Level (V^2-us)','FontSize',22,'FontName','Times New Roman','Color','black');
% % ylabel(ax(2),'AE event counts (x10^4)','FontSize',22,'FontName','Times New Roman','Color','black'); 
% set(ax(1),'FontSize',25,'FontName','Times New Roman')
% set(ax(2),'FontSize',25,'FontName','Times New Roman')
% 
% 
% figure (8)
% hFig = figure(8);
% set(hFig, 'Position', [200 300 900 555])
% 
% event_count5678 = 1:count_5678;
% event_temperature5678 = channel_5678_sorted(event_count5678,1);
% event_energy5678 = channel_5678_sorted(event_count5678,2);
% [ax,h1,h2]=plotyy(event_temperature5678,event_energy5678,event_temperature5678,event_count5678/10000);
% % title('Sample 1 With Rejuvenator','FontSize',15,'FontName','Times New Roman');
% % xlabel('Temperture (°C)','FontSize',22,'FontName','Times New Roman');
% set(gca,'box','off')
% set(ax(1),'YLim',[0 400])
% set(ax(1),'YTick',[0:100:400])
% set(ax(2),'YLim',[0 8])
% set(ax(2),'YTick',[0:1:8])
% set(ax,{'ycolor'},{'black';'black'})
% set(ax,'XLim',[-35 0])
% set(ax,'XTick',[-35:5:0])
% set(ax(1),'XDIR','reverse')
% set(ax(2),'XDIR','reverse')
% set(h1,'marker','.','color',[0.6 0.6 0.6],'MarkerSize',5)
% set(h2,'marker','.','color','blue','MarkerSize',5)
% % ylabel(ax(1),'Energy Level (V^2-us)','FontSize',22,'FontName','Times New Roman','Color','black');
% % ylabel(ax(2),'AE event counts (x10^4)','FontSize',22,'FontName','Times New Roman','Color','black'); 
% set(ax(1),'FontSize',25,'FontName','Times New Roman')
% set(ax(2),'FontSize',25,'FontName','Times New Roman')
   
   



% count_1 = 0;
% count_2 = 0;
% count_3 = 0;
% count_4 = 0;
% count_5 = 0;
% count_6 = 0;
% count_7 = 0;
% count_8 = 0;
% 
% for j=1:max_event
%     if energy_channel(j,1)>threshold_energy
%         count_1 = count_1+1;
%     end
%     if energy_channel(j,2)>threshold_energy
%         count_2 = count_2+1;
%     end
%     if energy_channel(j,3)>threshold_energy
%         count_3 = count_3+1;
%     end
%     if energy_channel(j,4)>threshold_energy
%         count_4 = count_4+1;
%     end
%     if energy_channel(j,5)>threshold_energy
%         count_5 = count_5+1;
%     end
%     if energy_channel(j,6)>threshold_energy
%         count_6 = count_6+1;
%     end
%     if energy_channel(j,7)>threshold_energy
%         count_7 = count_7+1;
%     end
%     if energy_channel(j,8)>threshold_energy
%         count_8 = count_8+1;
%     end
% end
% 
% channel_1 = zeros(count_1,2);
% channel_2 = zeros(count_2,2);
% channel_3 = zeros(count_3,2);
% channel_4 = zeros(count_4,2);
% channel_5 = zeros(count_5,2);
% channel_6 = zeros(count_6,2);
% channel_7 = zeros(count_7,2);
% channel_8 = zeros(count_8,2);
% 
% c_1 = 1;
% c_2 = 1;
% c_3 = 1;
% c_4 = 1;
% c_5 = 1;
% c_6 = 1;
% c_7 = 1;
% c_8 = 1;
% 
% for m=1:max_event
%    if results(m,3)>threshold_energy
%        channel_1(c_1,1) = results(m,2);
%        channel_1(c_1,2) = results(m,3);
%        c_1 = c_1+1;
%    end
%    if results(m,4)>threshold_energy
%        channel_2(c_2,1) = results(m,2);
%        channel_2(c_2,2) = results(m,4);
%        c_2 = c_2+1;
%    end
%    if results(m,5)>threshold_energy
%        channel_3(c_3,1) = results(m,2);
%        channel_3(c_3,2) = results(m,5);
%        c_3 = c_3+1;
%    end
%    if results(m,6)>threshold_energy
%        channel_4(c_4,1) = results(m,2);
%        channel_4(c_4,2) = results(m,6);
%        c_4 = c_4+1;
%    end
%      if results(m,7)>threshold_energy
%        channel_5(c_5,1) = results(m,2);
%        channel_5(c_5,2) = results(m,7);
%        c_5 = c_5+1;
%      end
%    if results(m,8)>threshold_energy
%        channel_6(c_6,1) = results(m,2);
%        channel_6(c_6,2) = results(m,8);
%        c_6 = c_6+1;
%    end
%    if results(m,9)>threshold_energy
%        channel_7(c_7,1) = results(m,2);
%        channel_7(c_7,2) = results(m,9);
%        c_7 = c_7+1;
%    end
%    if results(m,10)>threshold_energy
%        channel_8(c_8,1) = results(m,2);
%        channel_8(c_8,2) = results(m,10);
%        c_8 = c_8+1;
%    end
% end
% 
% 
% 
% figure
% 
% event_count1 = 1:count_1;
% event_temperature1 = channel_1(event_count1,1);
% event_energy1 = channel_1(event_count1,2);
% [ax,h1,h2]=plotyy(event_temperature1,event_energy1,event_temperature1,event_count1);
% title('Energy Distribution channel 1');
% xlabel('Temperture');
% set(ax(1),'YLim',[0 800])
% set(ax(1),'YTick',[0:50:800])
% set(ax(2),'YLim',[0 100000])
% set(ax(2),'YTick',[0:10000:100000])
% set(ax,'XLim',[-40 0])
% set(ax,'XTick',[-40:5:0])
% set(h1,'marker','.','color','red','MarkerSize',5)
% set(h2,'marker','.','color','yellow','MarkerSize',1)
% ylabel(ax(1),'Energy_Level');
% ylabel(ax(2),'Event count');
% hold(ax(1))
% hold(ax(2))
% 
% event_count2 = 1:count_2;
% event_temperature2 = channel_2(event_count2,1);
% event_energy2 = channel_2(event_count2,2);
% [ax2,h21,h22]=plotyy(event_temperature2,event_energy2,event_temperature2,event_count2);
% set(h21,'marker','.','color','red','MarkerSize',5)
% set(h22,'marker','.','color','yellow','MarkerSize',1)
% set(ax2(1),'YLim',[0 800])
% set(ax2(1),'YTick',[0:50:800])
% set(ax2(2),'YLim',[0 100000])
% set(ax2(2),'YTick',[0:10000:100000])
% set(ax2,'XLim',[-40 0])
% set(ax2,'XTick',[-40:5:0])
% 
% event_count3 = 1:count_3;
% event_temperature3 = channel_3(event_count3,1);
% event_energy3 = channel_3(event_count3,2);
% [ax3,h31,h32]=plotyy(event_temperature3,event_energy3,event_temperature3,event_count3);
% set(h31,'marker','.','color','red','MarkerSize',5)
% set(h32,'marker','.','color','yellow','MarkerSize',1)
% set(ax3(1),'YLim',[0 800])
% set(ax3(1),'YTick',[0:50:800])
% set(ax3(2),'YLim',[0 100000])
% set(ax3(2),'YTick',[0:10000:100000])
% set(ax3,'XLim',[-40 0])
% set(ax3,'XTick',[-40:5:0])
% 
% 
% event_count4 = 1:count_4;
% event_temperature4 = channel_4(event_count4,1);
% event_energy4 = channel_4(event_count4,2);
% [ax4,h41,h42]=plotyy(event_temperature4,event_energy4,event_temperature4,event_count4);
% set(h41,'marker','.','color','red','MarkerSize',5)
% set(h42,'marker','.','color','yellow','MarkerSize',1)
% set(ax4(1),'YLim',[0 800])
% set(ax4(1),'YTick',[0:50:800])
% set(ax4(2),'YLim',[0 100000])
% set(ax4(2),'YTick',[0:10000:100000])
% set(ax4,'XLim',[-40 0])
% set(ax4,'XTick',[-40:5:0])
% 
% event_count5 = 1:count_5;
% event_temperature5 = channel_5(event_count5,1);
% event_energy5 = channel_5(event_count5,2);
% [ax5,h51,h52]=plotyy(event_temperature5,event_energy5,event_temperature5,event_count5);
% set(h51,'marker','.','color','cyan','MarkerSize',5)
% set(h52,'marker','.','color','black','MarkerSize',1)
% set(ax5(1),'YLim',[0 800])
% set(ax5(1),'YTick',[0:50:800])
% set(ax5(2),'YLim',[0 100000])
% set(ax5(2),'YTick',[0:10000:100000])
% set(ax5,'XLim',[-40 0])
% set(ax5,'XTick',[-40:5:0])
% 
% 
% event_count6 = 1:count_6;
% event_temperature6 = channel_6(event_count6,1);
% event_energy6 = channel_6(event_count6,2);
% [ax6,h61,h62]=plotyy(event_temperature6,event_energy6,event_temperature6,event_count6);
% set(h61,'marker','.','color','cyan','MarkerSize',5)
% set(h62,'marker','.','color','black','MarkerSize',1)
% set(ax6(1),'YLim',[0 800])
% set(ax6(1),'YTick',[0:50:800])
% set(ax6(2),'YLim',[0 100000])
% set(ax6(2),'YTick',[0:10000:100000])
% set(ax6,'XLim',[-40 0])
% set(ax6,'XTick',[-40:5:0])
% 
% event_count7 = 1:count_7;
% event_temperature7 = channel_7(event_count7,1);
% event_energy7 = channel_7(event_count7,2);
% [ax7,h71,h72]=plotyy(event_temperature7,event_energy7,event_temperature7,event_count7);
% set(h71,'marker','.','color','cyan','MarkerSize',5)
% set(h72,'marker','.','color','black','MarkerSize',1)
% set(ax7(1),'YLim',[0 800])
% set(ax7(1),'YTick',[0:50:800])
% set(ax7(2),'YLim',[0 100000])
% set(ax7(2),'YTick',[0:10000:100000])
% set(ax7,'XLim',[-40 0])
% set(ax7,'XTick',[-40:5:0])
% 
% 
% event_count8 = 1:count_8;
% event_temperature8 = channel_8(event_count8,1);
% event_energy8 = channel_8(event_count8,2);
% [ax8,h81,h82]=plotyy(event_temperature8,event_energy8,event_temperature8,event_count8);
% set(h81,'marker','.','color','cyan','MarkerSize',5)
% set(h82,'marker','.','color','black','MarkerSize',1)
% set(ax8(1),'YLim',[0 800])
% set(ax8(1),'YTick',[0:50:800])
% set(ax8(2),'YLim',[0 100000])
% set(ax8(2),'YTick',[0:10000:100000])
% set(ax8,'XLim',[-40 0])
% set(ax8,'XTick',[-40:5:0])
% 

