fullpathadd = '10_13-7.txt';
position = [10,13,7];
pos_x=position(1);
pos_y=position(2);
pos_z=position(3);



figure;

plot3(-pos_x-30,-pos_y,-pos_z, 'marker','o','MarkerFaceColor',[1 0 0],'Markersize',5);
xlim([-70,10])
ylim([-60,10])
zlim([-60,10])

pbaspect([1 1 1]);
grid on
drawnow;

hold on;

size_x=-62.8;
size_y=-15;
size_z=-41.5;

p1 = [0 0 0];
p2 = [size_x 0 0];
p3 = [size_x 0 size_z];
p4 = [0 0 size_z]; 

x = [p1(1) p2(1) p3(1) p4(1)];
y = [p1(2) p2(2) p3(2) p4(2)];
z = [p1(3) p2(3) p3(3) p4(3)];

fill3(x, y, z, 1,'facealpha',0.01,'facecolor',[0 0 0]);

%back
p1 = [0 size_y 0];
p2 = [size_x size_y 0];
p3 = [size_x size_y size_z];
p4 = [0 size_y size_z]; 

x = [p1(1) p2(1) p3(1) p4(1)];
y = [p1(2) p2(2) p3(2) p4(2)];
z = [p1(3) p2(3) p3(3) p4(3)];

fill3(x, y, z, 1,'facealpha',0.01,'facecolor',[0 0 0]);

%top
p1 = [0 0 size_z];
p2 = [size_x 0 size_z];
p3 = [size_x size_y size_z];
p4 = [0 size_y size_z]; 

x = [p1(1) p2(1) p3(1) p4(1)];
y = [p1(2) p2(2) p3(2) p4(2)];
z = [p1(3) p2(3) p3(3) p4(3)];

fill3(x, y, z, 1,'facealpha',0.01,'facecolor',[0 0 0]);

%bottom
p1 = [0 0 0];
p2 = [size_x 0 0];
p3 = [size_x size_y 0];
p4 = [0 size_y 0]; 

x = [p1(1) p2(1) p3(1) p4(1)];
y = [p1(2) p2(2) p3(2) p4(2)];
z = [p1(3) p2(3) p3(3) p4(3)];

fill3(x, y, z, 1,'facealpha',0.01,'facecolor',[0 0 0]);

%left
p1 = [0 0 0];
p2 = [0 0 size_z];
p3 = [0 size_y size_z];
p4 = [0 size_y 0]; 

x = [p1(1) p2(1) p3(1) p4(1)];
y = [p1(2) p2(2) p3(2) p4(2)];
z = [p1(3) p2(3) p3(3) p4(3)];

fill3(x, y, z, 1,'facealpha',0.01,'facecolor',[0 0 0]);

%right
p1 = [size_x 0 0];
p2 = [size_x 0 size_z];
p3 = [size_x size_y size_z];
p4 = [size_x size_y 0]; 

x = [p1(1) p2(1) p3(1) p4(1)];
y = [p1(2) p2(2) p3(2) p4(2)];
z = [p1(3) p2(3) p3(3) p4(3)];

fill3(x, y, z, 1,'facealpha',0.01,'facecolor',[0 0 0]);


% sensor1 = [4*(sin (0/180*pi)),4*(cos (0/180*pi)),5];
% sensor2 = [4*(sin (120/180*pi)),4*(cos (120/180*pi)),5];
% sensor3 = [4*(sin (240/180*pi)),4*(cos (240/180*pi)),5];
% sensor4 = [0*(sin (120/180*pi)),0*(cos (120/180*pi)),5];
% sensor5 = [4*(sin (45/180*pi)),4*(cos (45/180*pi)),0];
% sensor6 = [4*(sin (165/180*pi)),4*(cos (165/180*pi)),0];
% sensor7 = [4*(sin (285/180*pi)),4*(cos (285/180*pi)),0];
% sensor8 = [0*(sin (120/180*pi)),0*(cos (120/180*pi)),0];
% 
% sensor1 = [5.0001,0.000008,5];
% sensor2 = [5.0002,0.00007,10];
% sensor3 = [5.0003,0.00001,15];
% sensor4 = [5.0004,0.00002,20];
% sensor5 = [10.0001,0.00003,5];
% sensor6 = [10.0002,0.00004,10];
% sensor7 = [10.0003,0.00005,15];
% sensor8 = [10.0004,0.00006,20];

sensor1 = [5,0,5];
sensor2 = [10,0,10];
sensor3 = [15,0,15];
sensor4 = [20,0,20];
sensor5 = [5,0,15];
sensor6 = [10,0,20];
sensor7 = [15,0,25];
sensor8 = [20,0,30];



sensor(1,:)=sensor1;
sensor(2,:)=sensor2;
sensor(3,:)=sensor3;
sensor(4,:)=sensor4;
sensor(5,:)=sensor5;
sensor(6,:)=sensor6;
sensor(7,:)=sensor7;
sensor(8,:)=sensor8;

% plot3(-5-30,0,-5, 'marker','o','MarkerFaceColor',[0 0.5 0.5],'Markersize',5);
% plot3(-10-30,0,-10, 'marker','o','MarkerFaceColor',[0 0.5 0.5],'Markersize',5);
% plot3(-15-30,0,-15, 'marker','o','MarkerFaceColor',[0 0.5 0.5],'Markersize',5);
% plot3(-20-30,0,-20, 'marker','o','MarkerFaceColor',[0 0.5 0.5],'Markersize',5);
% plot3(-5-30,0,-15, 'marker','o','MarkerFaceColor',[0 0.5 0.5],'Markersize',5);
% plot3(-10-30,0,-20, 'marker','o','MarkerFaceColor',[0 0.5 0.5],'Markersize',5);
% plot3(-15-30,0,-25, 'marker','o','MarkerFaceColor',[0 0.5 0.5],'Markersize',5);
% plot3(-20-30,0,-30, 'marker','o','MarkerFaceColor',[0 0.5 0.5],'Markersize',5);



maxrange=2048;
formatss = '%s %s %s %s %s %s %s %s';
fd = fopen(fullpathadd,'r','n','UTF-8');
M = textscan(fd,'%f %f %f %f',1,'Delimiter','\t');
max_event=M{2};

k=0; % k-----> event counter, count from zero to the number of events
validnum = 0; % record the number of events which are valid (produce valid results of locations)
jump = 0; 
threshold = 0.15; % calculate the time which the sensor sees the crack wave (using threshold crossing method)
filterthresh = 0.1; % this is to filter out the channels without any value exceeding the threshold values
v=0.304;%0.2257 0.293 % set up speed of acoustic wave travelling inside the asphalt

array = [];
array_count = 1;
while k<max_event

    C = textscan(fd,formatss,maxrange,'Delimiter','\t');
    k=k+1;
    disp(k);
    
    %-----------  initialize the data matrices  ------------
    max=[0,0,0,0,0,0,0,0]; % record the maximum value of each channel
    recvt=[0,0,0,0,0,0,0,0]; % received time of each channel
    pass=[0,0,0,0,0,0,0,0]; % filter the channel
    
    count = 0;
    
    for i=1:8
            for j=1:maxrange
                temp = abs(str2double(C{i}(j)));
                
                if temp>max(i)
                    max(i) = temp;
                end
                
                if temp>threshold && recvt(i)==0
                    recvt(i)=(j-1); % j-1 will be consistent to the waveform reading
                end   
                
                if temp>filterthresh && pass(i)==0
                    pass(i)=1;
                    count = count+1;
                end 

            end
    end
    
    if count <= 4
        continue;
    end

    
    
    TT=[0,0,0,0,0];
    NN=[0,0,0,0,0];
    
    sortedrecvt= sort(recvt,'ascend');
    
    n=1;
    for zz=1:8
        
        if n==6
            break;
        end
      
        for w=1:8
            if recvt(w)==sortedrecvt(zz)&& w~=NN(1)&& w~=NN(2)&& w~=NN(3)&& w~=NN(4)
                TT(n)=recvt(w);
                NN(n)=w;
                n=n+1;
                break;
            end
        end
     
    end        
    
    disp(['NN: ' mat2str(NN)]) ;
    disp(['TT: ' mat2str(TT)]) ;
    
    x0=9;
    y0=9;
    z0=9;
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
            k=k+1;
            continue;
    end
    if (loop_count>=3)&&(mean(deltax)>1000)
            k=k+1;
            continue;
    end
    
    
    
      
    array = [array;k,x0,y0,z0];
    array_count = array_count+1;
    
    
   plot3(-x0-30, -y0, -z0, 'marker','+');
    
end

disp(array);












