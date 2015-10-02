rawdata=xlsread('8sensors_virgin_Filtered.xlsx');
timeofevents = dlmread('time/08_18_virgin_time.txt', '\t', 1, 0);
temperaturesheet = xlsread('temperature/08_18_virgin_output.csv');

k=1;

v=0.33;

sensor=zeros(8,3);

sensor(1,:) = [3*(sin (0/180*pi)),3*(cos (0/180*pi)),0];
sensor(2,:) = [3*(sin (120/180*pi)),3*(cos (120/180*pi)),0];
sensor(3,:) = [3*(sin (240/180*pi)),3*(cos (240/180*pi)),0];
sensor(4,:) = [0,0,0];
sensor(5,:) = [3*(sin (45/180*pi)),3*(cos (45/180*pi)),4.8];
sensor(6,:) = [3*(sin (165/180*pi)),3*(cos (165/180*pi)),4.8];
sensor(7,:) = [3*(sin (285/180*pi)),3*(cos (285/180*pi)),4.8];
sensor(8,:) = [0,0,4.8];

% sensor(1,:) = [3,3,0];
% sensor(2,:) = [3,-3,0];
% sensor(3,:) = [-3,-3,0];
% sensor(4,:) = [-3,3,0];
% sensor(5,:) = [0,4.243,4.8];
% sensor(6,:) = [4.243,0,4.8];
% sensor(7,:) = [0,-4.243,4.8];
% sensor(8,:) = [-4.243,0,4.8];


num_rows = size(temperaturesheet,1);
num_clock = num_rows ./ 5;
tempresult = zeros(num_clock , 2);
time = zeros(num_clock , 1);
for j = 1:num_clock
   time = temperaturesheet((5*(j-1)+1),1);
   tempresult(j,1) = (time-1)*5;
   tempresult(j,2) = temperaturesheet((5*(j-1)+2),1);
end


rawdata_temp=rawdata;
totalnum=size(rawdata,1);
result=zeros(totalnum/2,4);
plot_result=zeros(totalnum/2,5);
result_count=1;
valid_count=0;

while k<=totalnum
    
    disp((k+1)/2)
    
    cur_time = timeofevents((k+1)/2,1);
    for m = 2: num_clock
        if (cur_time > tempresult(m-1,1) && cur_time <= tempresult(m,1))
            cur_temperature = tempresult(m-1,2)-(tempresult(m-1,2)-tempresult(m,2))/5 * abs(cur_time-tempresult(m-1,1));
            break;
        end
        if (cur_time == tempresult(m-1,1))
            cur_temperature = tempresult(m-1,2);
            break;
        end
        if (cur_time == tempresult(m,1))
            cur_temperature = tempresult(m,2);
            break;
        end
    end
    
    rawdata_temp(k+1,1)=cur_temperature;
    
    NN=[rawdata(k,2),rawdata(k,3),rawdata(k,4),rawdata(k,5),rawdata(k,6)]; %channel
    TT=[rawdata(k+1,2),rawdata(k+1,3),rawdata(k+1,4),rawdata(k+1,5),rawdata(k+1,6)]; %time
    
    oneside=0;
    otherside=0;
%     valid_sensors=8;
    for sensor_count=1:5
%        if NN(sensor_count)==0
%           valid_sensors=sensor_count-1;
%           break; 
%        end
       if NN(sensor_count)~=0&&NN(sensor_count)<=4
           oneside=oneside+1;
       end
       if NN(sensor_count)>=5
           otherside=otherside+1;
       end
    end
    if oneside==4||otherside==4
       k=k+2;
       continue;
    end
    
    x0=2;
    y0=-2;
    z0=0;
    t0=0;
    deltax=[100 100 100 100]';
    loop_count=0;
    first_flag=0;
    
    while mean(deltax)>0.05
        loop_count=loop_count+1;
        
        R1=sqrt((sensor(NN(2),1)-x0)^2+(sensor(NN(2),2)-y0)^2+(sensor(NN(2),3)-z0)^2);
        R2=sqrt((sensor(NN(3),1)-x0)^2+(sensor(NN(3),2)-y0)^2+(sensor(NN(3),3)-z0)^2);
        R3=sqrt((sensor(NN(4),1)-x0)^2+(sensor(NN(4),2)-y0)^2+(sensor(NN(4),3)-z0)^2);
        R4=sqrt((sensor(NN(5),1)-x0)^2+(sensor(NN(5),2)-y0)^2+(sensor(NN(5),3)-z0)^2);

        gamma=[TT(2)-(t0+(1/v)*R1),TT(3)-(t0+(1/v)*R2),TT(4)-(t0+(1/v)*R3),TT(5)-(t0+(1/v)*R4)]';

        A=[-((sensor(NN(2),1)-x0)/(v*R1)),-((sensor(NN(2),2)-y0)/(v*R1)),-((sensor(NN(2),3)-z0)/(v*R1)),1;-((sensor(NN(3),1)-x0)/(v*R2)),-((sensor(NN(3),2)-y0)/(v*R2)),-((sensor(NN(3),3)-z0)/(v*R2)),1;-((sensor(NN(4),1)-x0)/(v*R3)),-((sensor(NN(4),2)-y0)/(v*R3)),-((sensor(NN(4),3)-z0)/(v*R3)),1;-((sensor(NN(5),1)-x0)/(v*R4)),-((sensor(NN(5),2)-y0)/(v*R4)),-((sensor(NN(5),3)-z0)/(v*R4)),1;];

        deltax=inv(A'*A)*A'*gamma;
        
        if (deltax==[100 100 100 100]')
            break;
        end
        
        x0=x0+deltax(1);
        y0=y0+deltax(2);
        z0=z0+deltax(3);
        t0=t0+deltax(4);
        
        if (loop_count>=3)&&(mean(deltax)>1000)
            break;
        end
                
    end
    
    if (deltax==[100 100 100 100]')
            k=k+2;
            continue;
    end
    if (loop_count>=3)&&(mean(deltax)>1000)
            k=k+2;
            continue;
    end
    
    if (z0<5 && z0>0 && abs(x0)<7.5 && abs(y0)<7.5)
        x2=x0;y2=y0;z2=z0;t2=t0;
        first_flag=1;
    end
    
    if (z0>6 || z0<-1 || abs(x0)>9 || abs(y0)>9)
        x0=(sensor(NN(5),1));
        y0=(sensor(NN(5),2));
        z0=(sensor(NN(5),3));
        t0=0;
    end
    
    
    
    
    deltax=[100 100 100 100]';
    loop_count=0;
    while mean(deltax)>0.05
        loop_count=loop_count+1;
        
        R1=sqrt((sensor(NN(1),1)-x0)^2+(sensor(NN(1),2)-y0)^2+(sensor(NN(1),3)-z0)^2);
        R2=sqrt((sensor(NN(2),1)-x0)^2+(sensor(NN(2),2)-y0)^2+(sensor(NN(2),3)-z0)^2);
        R3=sqrt((sensor(NN(3),1)-x0)^2+(sensor(NN(3),2)-y0)^2+(sensor(NN(3),3)-z0)^2);
        R4=sqrt((sensor(NN(4),1)-x0)^2+(sensor(NN(4),2)-y0)^2+(sensor(NN(4),3)-z0)^2);

        gamma=[TT(1)-(t0+(1/v)*R1),TT(2)-(t0+(1/v)*R2),TT(3)-(t0+(1/v)*R3),TT(4)-(t0+(1/v)*R4)]';

        A=[-((sensor(NN(1),1)-x0)/(v*R1)),-((sensor(NN(1),2)-y0)/(v*R1)),-((sensor(NN(1),3)-z0)/(v*R1)),1;-((sensor(NN(2),1)-x0)/(v*R2)),-((sensor(NN(2),2)-y0)/(v*R2)),-((sensor(NN(2),3)-z0)/(v*R2)),1;-((sensor(NN(3),1)-x0)/(v*R3)),-((sensor(NN(3),2)-y0)/(v*R3)),-((sensor(NN(3),3)-z0)/(v*R3)),1;-((sensor(NN(4),1)-x0)/(v*R4)),-((sensor(NN(4),2)-y0)/(v*R4)),-((sensor(NN(4),3)-z0)/(v*R4)),1;];

        deltax=inv(A'*A)*A'*gamma;
        
        if (deltax==[100 100 100 100]')
            break;
        end
        
        x0=x0+deltax(1);
        y0=y0+deltax(2);
        z0=z0+deltax(3);
        t0=t0+deltax(4);
        
        if (loop_count>=3)&&(mean(deltax)>1000)
            break;
        end
                
    end
    
    if (loop_count>=3)&&(mean(deltax)>1000)
            k=k+2;
            continue;
    end
    
    if (z0>5 || z0<0 || abs(x0)>7.5 || abs(y0)>7.5)&&first_flag==1
        x0=x2;
        y0=y2;
        z0=z2;
        t0=t2;
    end
    
    if (z0<5 && z0>0 && abs(x0)<7.5 && abs(y0)<7.5 && t0<TT(1))
       valid_count=valid_count+1; 
       plot_result(valid_count,1)=rawdata_temp(k,1);
       plot_result(valid_count,2)=x0;
       plot_result(valid_count,3)=y0;
       plot_result(valid_count,4)=z0;
       plot_result(valid_count,5)=cur_temperature;
        
    
    end
    
    
    
    
    
    
    
    k=k+2;
end

plot_result(valid_count:size(plot_result,1),:)=[];


hFig = figure;
set(hFig, 'Position', [200 300 900 555])
plot(plot_result(:,5),plot_result(:,4),'o')
set(gca,'XLim',[-36 0])
set(gca,'XTick',[-36:2:0])
set(gca,'yLim',[0 5])
set(gca,'yTick',[0:1:5])

% filename = 'C:\Users\zhesun3\Box Sync\Source Location Cooling\New\Result_table\36hours.xlsx';
% xlswrite(filename,plot_result);

