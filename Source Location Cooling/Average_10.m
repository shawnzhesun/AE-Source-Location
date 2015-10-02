raw=xlsread('8weeks.xlsx');

num_points=size(raw,1);

points_interest=20;

par_result=zeros(50,points_interest+2);
par_result(:,1)=1:50;
par_count=zeros(50,2);
par_count(:,1)=1:50;



for i=1:num_points
    height=raw(i,4);
    height_partition=round(height*10);
    if height_partition==0
        continue;
    end
    par_count(height_partition,2)= par_count(height_partition,2)+1;
    
    if par_count(height_partition,2)<=points_interest
        par_result(height_partition,par_count(height_partition,2)+1)=raw(i,5);
    end
    
end

for i=1:size(par_result,1)
    par_result(i,points_interest+2)= sum(par_result(i,2:(points_interest+1)))/nnz(par_result(i,2:(points_interest+1)));
end

avg_result=zeros(10,5);
avg_result(:,1)=2.5:5:50;
for m=1:10
   avg_result(m,2)=mean(par_result(5*(m-1)+1:5*(m-1)+5,points_interest+2));
   avg_result(m,3)=max(par_result(5*(m-1)+1:5*(m-1)+5,points_interest+2));
   avg_result(m,4)=min(par_result(5*(m-1)+1:5*(m-1)+5,points_interest+2));
   avg_result(m,5)=2*std(par_result(5*(m-1)+1:5*(m-1)+5,points_interest+2));
end


% figure
% plot(par_result(:,points_interest+2),par_result(:,1)./10);
% %  plot(raw(:,5),raw(:,4),'o')
% set(gca,'XLim',[-36 0])
% set(gca,'XTick',[-36:2:0])
% set(gca,'yLim',[0 5])
% set(gca,'yTick',[0:1:5])
% ylabel('Height of Specimen (cm)')
% xlabel('Temperature (Degree C)')

avg_TEB=mean(par_result(:,points_interest+2));

close all
hFig = figure(1);
hold on
set(hFig, 'Position', [400 400 300 240])
x=avg_result(:,2);
y=avg_result(:,1)./10;
e=std(x)*ones(size(y));
plot(x,y,'LineWidth',2);% plot Temb curve
SP=avg_TEB; %your point goes here 

line([SP SP],[0 5],'Color',[1 0 0],'LineStyle',':','LineWidth',2)
for n =1:10 %max and min
   plot([avg_result(n,3) avg_result(n,4)],[avg_result(n,1)/10 avg_result(n,1)/10],'-b'); 
   plot([avg_result(n,3) avg_result(n,3)],[avg_result(n,1)/10+0.1 avg_result(n,1)/10-0.1],'-b'); 
   plot([avg_result(n,4) avg_result(n,4)],[avg_result(n,1)/10+0.1 avg_result(n,1)/10-0.1],'-b'); 
end

% for n =1:10 %2 std
%    plot([avg_result(n,2)+avg_result(n,5) avg_result(n,2)-avg_result(n,5)],[avg_result(n,1)/10 avg_result(n,1)/10],'-b'); 
%    plot([avg_result(n,2)+avg_result(n,5) avg_result(n,2)+avg_result(n,5)],[avg_result(n,1)/10+0.1 avg_result(n,1)/10-0.1],'-b'); 
%    plot([avg_result(n,2)-avg_result(n,5) avg_result(n,2)-avg_result(n,5)],[avg_result(n,1)/10+0.1 avg_result(n,1)/10-0.1],'-b'); 
% end

s = sprintf('Temperature (%cC)', char(176));
%  plot(raw(:,5),raw(:,4),'o')
set(gca,'XLim',[-36 -8])
set(gca,'XTick',[-36:4:-8])
set(gca,'yLim',[0 5])
set(gca,'yTick',[0:1:5])
ylabel('Height of Specimen (cm)')
xlabel(s)


set(gca,'FontName', 'Arial','FontSize',10)
set(findall(gcf,'type','text'),'FontSize',10,'FontName', 'Arial');
str1 ='Eight Weeks'; text(-20,4.2,str1,'FontSize',12,'FontName', 'Arial','FontWeight','bold');
% str1 ='Specimen'; text(-35,3.8,str1,'FontSize',11,'FontName', 'Arial','FontWeight','bold');
box on
% legend({'Embrittlement Temperature','Average Embrittlement Temperature'},'FontSize',14,'Location','southoutside')
hold off

