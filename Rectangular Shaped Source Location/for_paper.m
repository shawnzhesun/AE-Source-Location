fullpathadd = '5-14_2-5.txt';
position = [5,14.2,5];
pos_x=position(1);
pos_y=position(2);
pos_z=position(3);

figure;
xlim([-70,10])
ylim([-50,30])
zlim([-70,10])

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
sensor1 = [5.0001,0.000008,5];
sensor2 = [5.0002,0.00007,10];
sensor3 = [5.0003,0.00001,15];
sensor4 = [5.0004,0.00002,20];
sensor5 = [10.0001,0.00003,5];
sensor6 = [10.0002,0.00004,10];
sensor7 = [10.0003,0.00005,15];
sensor8 = [10.0004,0.00006,20];

% sensor1 = [5,0,5];
% sensor2 = [10,0,10];
% sensor3 = [15,0,15];
% sensor4 = [20,0,20];
% sensor5 = [5,0,15];
% sensor6 = [10,0,20];
% sensor7 = [15,0,25];
% sensor8 = [20,0,30];



sensor(1,:)=sensor1;
sensor(2,:)=sensor2;
sensor(3,:)=sensor3;
sensor(4,:)=sensor4;
sensor(5,:)=sensor5;
sensor(6,:)=sensor6;
sensor(7,:)=sensor7;
sensor(8,:)=sensor8;

plot3(-5,0,-5, 'marker','o','MarkerFaceColor',[0 0.5 0.5],'Markersize',5);
plot3(-10,0,-10, 'marker','o','MarkerFaceColor',[0 0.5 0.5],'Markersize',5);
plot3(-15,0,-15, 'marker','o','MarkerFaceColor',[0 0.5 0.5],'Markersize',5);
plot3(-20,0,-20, 'marker','o','MarkerFaceColor',[0 0.5 0.5],'Markersize',5);
plot3(-5,0,-15, 'marker','o','MarkerFaceColor',[0 0.5 0.5],'Markersize',5);
plot3(-10,0,-20, 'marker','o','MarkerFaceColor',[0 0.5 0.5],'Markersize',5);
plot3(-15,0,-25, 'marker','o','MarkerFaceColor',[0 0.5 0.5],'Markersize',5);
plot3(-20,0,-30, 'marker','o','MarkerFaceColor',[0 0.5 0.5],'Markersize',5);

plot3(-pos_x,-pos_y,-pos_z, 'marker','o','MarkerFaceColor',[1 0 0],'Markersize',5);


maxrange=2048;
formatss = '%s %s %s %s %s %s %s %s';
fd = fopen(fullpathadd,'r','n','UTF-8');
M = textscan(fd,'%f %f %f %f',1,'Delimiter','\t');
max_event=M{2};

k=0; % k-----> event counter, count from zero to the number of events
validnum = 0; % record the number of events which are valid (produce valid results of locations)
jump = 0; 
threshold = 0.25; % calculate the time which the sensor sees the crack wave (using threshold crossing method)
filterthresh = 0.2; % this is to filter out the channels without any value exceeding the threshold values
v=0.32*(1+0.15);%0.2257 0.293 % set up speed of acoustic wave travelling inside the asphalt

array1 = [];
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
    
    
    sensor_flag = [0,0,0,0,0,0,0,0];
    
    for xx = 1:5
        
        sensor_flag(NN(xx)) = 1;
        
    end

    
        
    sensor_temp=zeros([5,3]);
    recv_time_temp = [0,0,0,0,0];
    ccccc=1;
    for i = 1:8
        if sensor_flag(i)==1 
            sensor_temp(ccccc,:)=sensor(i,:);
            recv_time_temp(ccccc) = recvt(i);
            ccccc = ccccc+1;
        end
    end

    a1 = sensor_temp(1,1);
    b1 = sensor_temp(1,2);
    c1 = sensor_temp(1,3);
    a2 = sensor_temp(2,1);
    b2 = sensor_temp(2,2);
    c2 = sensor_temp(2,3);
    a3 = sensor_temp(3,1);
    b3 = sensor_temp(3,2);
    c3 = sensor_temp(3,3);
    a4 = sensor_temp(4,1);
    b4 = sensor_temp(4,2);
    c4 = sensor_temp(4,3);
    a5 = sensor_temp(5,1);
    b5 = sensor_temp(5,2);
    c5 = sensor_temp(5,3);
    
    t1 = recv_time_temp(1);
    t2 = recv_time_temp(2);
    t3 = recv_time_temp(3);
    t4 = recv_time_temp(4);
    t5 = recv_time_temp(5);
 
        A = zeros([4,3]);
        B = zeros([4,1]);

        A(1,1)=2*a1-2*a2;
       
        A(1,2)=2*c1-2*c2;
        A(1,3)=2*v^2*t2-2*v^2*t1;

        A(2,1)=2*a1-2*a3;
    
        A(2,2)=2*c1-2*c3;
        A(2,3)=2*v^2*t3-2*v^2*t1;

        A(3,1)=2*a1-2*a4;
        
        A(3,2)=2*c1-2*c4;
        A(3,3)=2*v^2*t4-2*v^2*t1;

        A(4,1)=2*a1-2*a5;
    
        A(4,2)=2*c1-2*c5;
        A(4,3)=2*v^2*t5-2*v^2*t1;

        B(1,1)=(a1)^2-(a2)^2+(b1)^2-(b2)^2+(c1)^2-(c2)^2+v^2*(t2)^2-v^2*(t1)^2;
        B(2,1)=(a1)^2-(a3)^2+(b1)^2-(b3)^2+(c1)^2-(c3)^2+v^2*(t3)^2-v^2*(t1)^2;
        B(3,1)=(a1)^2-(a4)^2+(b1)^2-(b4)^2+(c1)^2-(c4)^2+v^2*(t4)^2-v^2*(t1)^2;
        B(4,1)=(a1)^2-(a5)^2+(b1)^2-(b5)^2+(c1)^2-(c5)^2+v^2*(t5)^2-v^2*(t1)^2;
        
        disp('matrix');
        disp(A);
        disp(B);
        
        A_T=transpose(A);

        solution = (A_T*A)\(A_T*B); 

        X1 = solution(1);
        Z1 = solution(2);
        
        syms Y
        S = solve(((X1-a1)^2+Y^2+(Z1-c1)^2)^0.5-((X1-a2)^2+Y^2+(Z1-c2)^2)^0.5==v*(t1-t2));

        if isempty(S)==1
            continue
        end
        
        disp('y=');
        actual_y = abs(S(1));
        solution(3) = actual_y;
        
        disp('solution');
        disp(solution);
        
        disp('error:');
        error = ((solution(1)-position(1))^2+(solution(2)-position(3))^2)^0.5+((solution(3)-position(2))^2)^0.5;
        disp(error);
 
        distance = zeros([5,1]);

    array1 = [array1;k,solution(1),solution(2),solution(3),error];
    array_count = array_count+1;
    
    if error<10
        plot3(-solution(1), -solution(3), -solution(2), 'marker','+','MarkerFaceColor',[1 0 1]);
    end
end

disp(array1);

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 





fullpathadd = '11-04-15-13_8-19.txt';
position = [15,13.8,19];
pos_x=position(1);
pos_y=position(2);
pos_z=position(3);

plot3(-pos_x,-pos_y,-pos_z, 'marker','o','MarkerFaceColor',[1 0 0],'Markersize',5);

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

maxrange=2048;
formatss = '%s %s %s %s %s %s %s %s';
fd = fopen(fullpathadd,'r','n','UTF-8');
M = textscan(fd,'%f %f %f %f',1,'Delimiter','\t');
max_event=M{2};

k=0; % k-----> event counter, count from zero to the number of events
validnum = 0; % record the number of events which are valid (produce valid results of locations)
jump = 0; 
threshold = 0.25; % calculate the time which the sensor sees the crack wave (using threshold crossing method)
filterthresh = 0.2; % this is to filter out the channels without any value exceeding the threshold values
v=0.3*(1+0.15);%0.2257 0.293 % set up speed of acoustic wave travelling inside the asphalt

array2 = [];
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
    
    
    sensor_flag = [0,0,0,0,0,0,0,0];
    
    for xx = 1:5
        
        sensor_flag(NN(xx)) = 1;
        
    end

    
        
    sensor_temp=zeros([5,3]);
    recv_time_temp = [0,0,0,0,0];
    ccccc=1;
    for i = 1:8
        if sensor_flag(i)==1 
            sensor_temp(ccccc,:)=sensor(i,:);
            recv_time_temp(ccccc) = recvt(i);
            ccccc = ccccc+1;
        end
    end

    a1 = sensor_temp(1,1);
    b1 = sensor_temp(1,2);
    c1 = sensor_temp(1,3);
    a2 = sensor_temp(2,1);
    b2 = sensor_temp(2,2);
    c2 = sensor_temp(2,3);
    a3 = sensor_temp(3,1);
    b3 = sensor_temp(3,2);
    c3 = sensor_temp(3,3);
    a4 = sensor_temp(4,1);
    b4 = sensor_temp(4,2);
    c4 = sensor_temp(4,3);
    a5 = sensor_temp(5,1);
    b5 = sensor_temp(5,2);
    c5 = sensor_temp(5,3);
    
    t1 = recv_time_temp(1);
    t2 = recv_time_temp(2);
    t3 = recv_time_temp(3);
    t4 = recv_time_temp(4);
    t5 = recv_time_temp(5);
 
        A = zeros([4,3]);
        B = zeros([4,1]);

        A(1,1)=2*a1-2*a2;
       
        A(1,2)=2*c1-2*c2;
        A(1,3)=2*v^2*t2-2*v^2*t1;

        A(2,1)=2*a1-2*a3;
    
        A(2,2)=2*c1-2*c3;
        A(2,3)=2*v^2*t3-2*v^2*t1;

        A(3,1)=2*a1-2*a4;
        
        A(3,2)=2*c1-2*c4;
        A(3,3)=2*v^2*t4-2*v^2*t1;

        A(4,1)=2*a1-2*a5;
    
        A(4,2)=2*c1-2*c5;
        A(4,3)=2*v^2*t5-2*v^2*t1;

        B(1,1)=(a1)^2-(a2)^2+(b1)^2-(b2)^2+(c1)^2-(c2)^2+v^2*(t2)^2-v^2*(t1)^2;
        B(2,1)=(a1)^2-(a3)^2+(b1)^2-(b3)^2+(c1)^2-(c3)^2+v^2*(t3)^2-v^2*(t1)^2;
        B(3,1)=(a1)^2-(a4)^2+(b1)^2-(b4)^2+(c1)^2-(c4)^2+v^2*(t4)^2-v^2*(t1)^2;
        B(4,1)=(a1)^2-(a5)^2+(b1)^2-(b5)^2+(c1)^2-(c5)^2+v^2*(t5)^2-v^2*(t1)^2;
        
        disp('matrix');
        disp(A);
        disp(B);
        
        A_T=transpose(A);

        solution = (A_T*A)\(A_T*B); 

        X1 = solution(1);
        Z1 = solution(2);
        
        syms Y
        if t1~=t2 
        S = solve(((X1-a1)^2+Y^2+(Z1-c1)^2)^0.5-((X1-a2)^2+Y^2+(Z1-c2)^2)^0.5==v*(t1-t2));
        end
        if isempty(S)==1
            continue
        end
        
        disp('y=');
        actual_y = abs(S(1));
        solution(3) = actual_y;
        
        disp('solution');
        disp(solution);
        
        disp('error:');
        error = ((solution(1)-position(1))^2+(solution(2)-position(3))^2)^0.5+((solution(3)-position(2))^2)^0.5;
        disp(error);
 
        distance = zeros([5,1]);

    array2 = [array2;k,solution(1),solution(2),solution(3),error];
    array_count = array_count+1;
    
    if error<5
        plot3(-solution(1), -solution(3), -solution(2), 'marker','+');
    end
end

disp(array2);

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 






fullpathadd = '10_13-7.txt';
position = [10,13,7];
pos_x=position(1);
pos_y=position(2);
pos_z=position(3);

plot3(-pos_x-30,-pos_y,-pos_z, 'marker','o','MarkerFaceColor',[1 0 0],'Markersize',5);

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
v=0.32*(1+0.15);%0.2257 0.293 % set up speed of acoustic wave travelling inside the asphalt

array3 = [];
array_count = 1;


plot3(-5-30,0,-5, 'marker','o','MarkerFaceColor',[1 0.5 0.5],'Markersize',5);
plot3(-10-30,0,-10, 'marker','o','MarkerFaceColor',[1 0.5 0.5],'Markersize',5);
plot3(-15-30,0,-15, 'marker','o','MarkerFaceColor',[1 0.5 0.5],'Markersize',5);
plot3(-20-30,0,-20, 'marker','o','MarkerFaceColor',[1 0.5 0.5],'Markersize',5);
plot3(-5-30,0,-15, 'marker','o','MarkerFaceColor',[1 0.5 0.5],'Markersize',5);
plot3(-10-30,0,-20, 'marker','o','MarkerFaceColor',[1 0.5 0.5],'Markersize',5);
plot3(-15-30,0,-25, 'marker','o','MarkerFaceColor',[1 0.5 0.5],'Markersize',5);
plot3(-20-30,0,-30, 'marker','o','MarkerFaceColor',[1 0.5 0.5],'Markersize',5);



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
    
    
    sensor_flag = [0,0,0,0,0,0,0,0];
    
    for xx = 1:5
        
        sensor_flag(NN(xx)) = 1;
        
    end

    
        
    sensor_temp=zeros([5,3]);
    recv_time_temp = [0,0,0,0,0];
    ccccc=1;
    for i = 1:8
        if sensor_flag(i)==1 
            sensor_temp(ccccc,:)=sensor(i,:);
            recv_time_temp(ccccc) = recvt(i);
            ccccc = ccccc+1;
        end
    end

    a1 = sensor_temp(1,1);
    b1 = sensor_temp(1,2);
    c1 = sensor_temp(1,3);
    a2 = sensor_temp(2,1);
    b2 = sensor_temp(2,2);
    c2 = sensor_temp(2,3);
    a3 = sensor_temp(3,1);
    b3 = sensor_temp(3,2);
    c3 = sensor_temp(3,3);
    a4 = sensor_temp(4,1);
    b4 = sensor_temp(4,2);
    c4 = sensor_temp(4,3);
    a5 = sensor_temp(5,1);
    b5 = sensor_temp(5,2);
    c5 = sensor_temp(5,3);
    
    t1 = recv_time_temp(1);
    t2 = recv_time_temp(2);
    t3 = recv_time_temp(3);
    t4 = recv_time_temp(4);
    t5 = recv_time_temp(5);
   
%     iteration_distance = 99999;
%     old_solution = [0,0,0];
%     iteration_counter = 0;
%     while iteration_distance>0.3 && iteration_counter<10
        A = zeros([4,3]);
        B = zeros([4,1]);

        A(1,1)=2*a1-2*a2;
       
        A(1,2)=2*c1-2*c2;
        A(1,3)=2*v^2*t2-2*v^2*t1;

        A(2,1)=2*a1-2*a3;
    
        A(2,2)=2*c1-2*c3;
        A(2,3)=2*v^2*t3-2*v^2*t1;

        A(3,1)=2*a1-2*a4;
        
        A(3,2)=2*c1-2*c4;
        A(3,3)=2*v^2*t4-2*v^2*t1;

        A(4,1)=2*a1-2*a5;
    
        A(4,2)=2*c1-2*c5;
        A(4,3)=2*v^2*t5-2*v^2*t1;

        B(1,1)=(a1)^2-(a2)^2+(b1)^2-(b2)^2+(c1)^2-(c2)^2+v^2*(t2)^2-v^2*(t1)^2;
        B(2,1)=(a1)^2-(a3)^2+(b1)^2-(b3)^2+(c1)^2-(c3)^2+v^2*(t3)^2-v^2*(t1)^2;
        B(3,1)=(a1)^2-(a4)^2+(b1)^2-(b4)^2+(c1)^2-(c4)^2+v^2*(t4)^2-v^2*(t1)^2;
        B(4,1)=(a1)^2-(a5)^2+(b1)^2-(b5)^2+(c1)^2-(c5)^2+v^2*(t5)^2-v^2*(t1)^2;
% 
        disp('matrix');
%         disp(A);
%         disp(B);
        
        A_T=transpose(A);
       
        solution = (A_T*A)\(A_T*B); 

        
% 
%         disp('old solution');
%         disp(old_solution);
%         
        X1 = solution(1);
        Z1 = solution(2);
        S=zeros(5,1);
        
        
        syms Y
        if t1~=t2 
        S1 = solve(((X1-a1)^2+Y^2+(Z1-c1)^2)^0.5-((X1-a2)^2+Y^2+(Z1-c2)^2)^0.5==v*(t1-t2));
        if isempty(S1)==0
        S(1)=(abs(double(S1(1))));
        end
        end
%         if isempty(S)==1
        if t1~=t3  
        S2 = solve(((X1-a1)^2+Y^2+(Z1-c1)^2)^0.5-((X1-a3)^2+Y^2+(Z1-c3)^2)^0.5==v*(t1-t3));
        if isempty(S2)==0
        S(2)=(abs(double(S2(1))));
        end
        end
%         end
        
%         if isempty(S)==1
            if t2~=t3 
            S3 = solve(((X1-a2)^2+Y^2+(Z1-c2)^2)^0.5-((X1-a3)^2+Y^2+(Z1-c3)^2)^0.5==v*(t2-t3));
            if isempty(S3)==0
            S(3)=(abs(double(S3(1))));
            end
            end
%         end
        
%        if isempty(S)==1
%             continue
%          end
            if t2~=t4 
            S4 = solve(((X1-a2)^2+Y^2+(Z1-c2)^2)^0.5-((X1-a4)^2+Y^2+(Z1-c4)^2)^0.5==v*(t2-t4));
            if isempty(S4)==0
            S(4)=(abs(double(S4(1))));
            end
            end
            if t1~=t4 
            S5 = solve(((X1-a1)^2+Y^2+(Z1-c1)^2)^0.5-((X1-a4)^2+Y^2+(Z1-c4)^2)^0.5==v*(t1-t4));
            if isempty(S5)==0
            S(5)=(abs(double(S5(1))));
            end
            end
            
        
            
            
        
        
        
        
        
       
        disp('old s')
        disp(S)
        
        actual_y_1 = (sum(S(S~=0))./sum(S~=0));
        actual_y = actual_y_1(1);
        
        BBB=S-actual_y;
        
        S(abs(BBB)>std(S))=0
        
        actual_y_1 = (sum(S(S~=0))./sum(S~=0));
        actual_y = actual_y_1(1);
        
        
        disp('y=');
        disp(actual_y);
        
        solution(3) = actual_y;
        
        disp('solution');
        disp(solution);
        
        disp('error:');
        error = ((solution(1)-position(1))^2+(solution(2)-position(3))^2)^0.5+((solution(3)-position(2))^2)^0.5;
        disp(error);
        
%         disp('iternation difference');
%         iteration_distance = ((solution(1)-old_solution(1))^2+(solution(2)-old_solution(2))^2+(solution(3)-old_solution(3))^2)^0.5;
%         disp(iteration_distance);
        
        %calculate new distance and calculated position
        distance = zeros([5,1]);

    array3 = [array3;k,solution(1),solution(2),solution(3),error];
    array_count = array_count+1;
    
    if error<10
        plot3(-solution(1)-30, -solution(3), -solution(2), 'marker','+');
    end
end

disp(array3);












