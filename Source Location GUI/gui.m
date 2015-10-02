function varargout = gui(varargin)
% GUI MATLAB code for gui.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui

% Last Modified by GUIDE v2.5 17-Apr-2014 14:15:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before gui is made visible.
function gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui (see VARARGIN)

% Choose default command line output for gui
handles.output = hObject;
set(handles.colume1, 'enable', 'on');
set(handles.colume11, 'enable', 'off');
set(handles.colume2, 'enable', 'on');
set(handles.colume21, 'enable', 'off');
set(handles.colume3, 'enable', 'on');
set(handles.colume31, 'enable', 'off');
set(handles.colume_s1, 'enable', 'on');
set(handles.colume_s11, 'enable', 'off');
set(handles.colume_s2, 'enable', 'on');
set(handles.colume_s21, 'enable', 'off');
set(handles.colume_s3, 'enable', 'on');
set(handles.colume_s31, 'enable', 'off');

handles.mode=1;%1 is cylinder,2 is rectangule
handles.state=1;
cla(handles.axes1,'reset');
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in runbt.
function runbt_Callback(hObject, eventdata, handles)
% hObject    handle to runbt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global fullpath
global tempfullpath
global evtfullpath

%----------- set up the axes in GUI ------------
AxesH = handles.axes1;


%-----------  define the path name for waveform.txt, temperature.csv and events vs time.txt  ------------
tempfullpathadd=tempfullpath;
evtfullpathadd = evtfullpath;
fullpathadd=get(handles.waddr, 'String');



%-----------  obtain the info inputted by the user, radius, height, height unit, locations of sensors  ------------
ssh1=str2double(get(handles.sh1, 'String')); % ssh ----> sensor height
ssh2=str2double(get(handles.sh2, 'String'));
ssh3=str2double(get(handles.sh3, 'String'));
ssh4=str2double(get(handles.sh4, 'String'));

sdd1=str2double(get(handles.sd1, 'String')); %sdd ----> sensor degree
sdd2=str2double(get(handles.sd2, 'String'));
sdd3=str2double(get(handles.sd3, 'String'));
sdd4=str2double(get(handles.sd4, 'String'));

sdd5=str2double(get(handles.sd5, 'String'));
ssh5=str2double(get(handles.sh5, 'String'));
sdd6=str2double(get(handles.sd6, 'String'));
ssh6=str2double(get(handles.sh6, 'String'));
sdd7=str2double(get(handles.sd7, 'String'));
ssh7=str2double(get(handles.sh7, 'String'));
sdd8=str2double(get(handles.sd8, 'String'));
ssh8=str2double(get(handles.sh8, 'String'));

radius=str2double(get(handles.size1, 'String')); %radius of the aspahlt cylinder

ssr1=str2double(get(handles.sr1, 'String')); % ssr ----> sensor radius
ssr2=str2double(get(handles.sr2, 'String'));
ssr3=str2double(get(handles.sr3, 'String'));
ssr4=str2double(get(handles.sr4, 'String'));

ssr5=str2double(get(handles.sr5, 'String'));
ssr6=str2double(get(handles.sr6, 'String'));
ssr7=str2double(get(handles.sr7, 'String'));
ssr8=str2double(get(handles.sr8, 'String'));




% size1=str2double(get(handles.size1, 'String'));
% size2=str2double(get(handles.size2, 'String'));
% size3=str2double(get(handles.size3, 'String'));

%reset the plot
cla(handles.axes1,'reset');
guidata(hObject, handles);

%initialize the plot
axes(handles.axes1);


%newplot = ece445equations(ssh1,sdd1,ssh2,sdd2,ssh3,sdd3,ssh4,sdd4,ssh5,sdd5,fullpathadd);
% figure;
%handles.mode 
if handles.mode==1 %handle mode 1 is for cylindrical model of asphalt sample
    
     
     size1=str2double(get(handles.size1, 'String'));  %size 1 is the radius of the cylinder
     size2=str2double(get(handles.size2, 'String'));  %size 2 is the height unit
     size3=str2double(get(handles.size3, 'String'));  %size 3 is the height of the cylinder
     
    %-----------  Set the axes properties  ------------
    set(gca,'DataAspectRatio',[1 1 1],...
         'PlotBoxAspectRatio',[1 1 1],...
        'XLim',[-size1 size1],...
        'YLim',[-size1 size1],...
        'ZLim',[0 size3]);
    

    %-----------  Draw the cylinder  ------------
    hold on
    cyr=size1;
    [X,Y,Z] = cylinder(cyr,12);
    Z(2, :) = size3;
    h=mesh(X,Y,Z,'facecolor',[0 1 0],'FaceAlpha',0.2,'edgealpha',0.2);
    drawnow;
    view(40,35);
    
    hold on
    % hu ----> height unit, the height of the sensors are in terms of the height unit
    hu = size2;
    %-----------  redefine the height, degree and radius of the sensors  ------------
    sh1= ssh1*hu;
    sa1=sdd1;
    sh2= ssh2*hu;
    sa2=sdd2;
    sh3= ssh3*hu;
    sa3=sdd3;
    sh4= ssh4*hu;
    sa4=sdd4;
    sh5= ssh5*hu;
    sa5=sdd5;
    sh6= ssh6*hu;
    sa6=sdd6;
    sh7= ssh7*hu;
    sa7=sdd7;
    sh8= ssh8*hu;
    sa8=sdd8;

    %-----------  Define the location of sensors in x,y,z coordinates  ------------
    %-----------  location of sensors are stored in matrix called CO  ------------
    CO=[0,0,0;0,0,0;0,0,0;0,0,0;0,0,0;0,0,0;0,0,0;0,0,0];

    CO(1,:)=[ssr1*(sin (sa1/180*pi)),ssr1*(cos (sa1/180*pi)),sh1];
    CO(2,:)=[ssr2*(sin (sa2/180*pi)),ssr2*(cos (sa2/180*pi)),sh2];
    CO(3,:)=[ssr3*(sin (sa3/180*pi)),ssr3*(cos (sa3/180*pi)),sh3];
    CO(4,:)=[ssr4*(sin (sa4/180*pi)),ssr4*(cos (sa4/180*pi)),sh4];
    CO(5,:)=[ssr5*(sin (sa5/180*pi)),ssr5*(cos (sa5/180*pi)),sh5];
    CO(6,:)=[ssr6*(sin (sa6/180*pi)),ssr6*(cos (sa6/180*pi)),sh6];
    CO(7,:)=[ssr7*(sin (sa7/180*pi)),ssr7*(cos (sa7/180*pi)),sh7];
    CO(8,:)=[ssr8*(sin (sa8/180*pi)),ssr8*(cos (sa8/180*pi)),sh8]; 
    disp(CO);

    %-----------  Display the sensors on the graph together with the cylinder  ------------
    hold on
    
    if ssr1 ~= -1
        plot3(CO(1,1), CO(1,2), CO(1,3), 'marker','+')
        drawnow;
    end
    if ssr2  ~= -1
    plot3(CO(2,1), CO(2,2), CO(2,3), 'marker','+')
        drawnow;
    end
    if ssr3  ~= -1
    plot3(CO(3,1), CO(3,2), CO(3,3), 'marker','+')
        drawnow;
    end
     if ssr4 ~= -1
    plot3(CO(4,1), CO(4,2), CO(4,3), 'marker','+')
        drawnow;
     end
  if ssr5 ~= -1
    plot3(CO(5,1), CO(5,2), CO(5,3), 'marker','+')
        drawnow;
  end
  if ssr6  ~= -1
    plot3(CO(6,1), CO(6,2), CO(6,3), 'marker','+')
        drawnow;
  end
  if ssr7  ~= -1
    plot3(CO(7,1), CO(7,2), CO(7,3), 'marker','+')
        drawnow;
  end
  if ssr8 ~= -1
    plot3(CO(8,1), CO(8,2), CO(8,3), 'marker','+')
        drawnow;
  end


  %-----------  display the color bar  ------------
    hold on
    colormap default

    high=str2double(get(handles.highest, 'String'));
    low=str2double(get(handles.lowest, 'String'));
    caxis([low high])
    colorbar('location','EastOutside')   
    drawnow
    camp = colormap;


%     hold on
%     
%     plot3(CO(1,1), CO(1,2), CO(1,3), 'marker','+');
%     plot3(CO(2,1), CO(2,2), CO(2,3), 'marker','+');
%     plot3(CO(3,1), CO(3,2), CO(3,3), 'marker','+');
%     plot3(CO(4,1), CO(4,2), CO(4,3), 'marker','+');
%     
%     hold on
%     plot3(CO(5,1), CO(5,2), CO(5,3), 'marker','+');
%     plot3(CO(7,1), CO(7,2), CO(7,3), 'marker','+');
    
%     initialize the variable
%-----------  read the temperature file using xlsread  ------------
    mySheet = xlsread(tempfullpathadd);

    num_rows = size(mySheet,1);
    num_clock = num_rows ./ 5;
    disp(num_clock);
    result = zeros(num_clock , 2);
    time = zeros(num_clock , 1);

     for j = 1:num_clock
         time = mySheet((5*(j-1)+1),1);
        result(j,1) = (time-1)*5;
        result(j,2) = mySheet((5*(j-1)+2),1);
     end

    rowsofresult = size(result,1);
    max_temperature = result(1,2);
    min_temperature = result(rowsofresult,2);

    %-----------  read the events vs time file using dlmread  ------------
    timeofevents = dlmread(evtfullpathadd, '\t', 1, 0);

    %-----------  read the waveform txt using text scan, scan the first line to obtain total number of events  ------------
    maxrange=2048;
    formatss = '%s %s %s %s %s %s %s %s';
    fd = fopen(fullpathadd,'r','n','UTF-8');
    M = textscan(fd,'%f %f %f %f',1,'Delimiter','\t');
    max_event=M{2};

    %-----------  initialize the matrix to store the testing results  ------------
    eventsoftemperature = zeros(max_event , 2);   % record the temperature at which each event happens
    height_temperature = zeros(ceil(size3/0.2),1);  % record the height at which each event happens
    ave_height_temperature = zeros(ceil(size3/0.2),2); % calculate average temperature of each level of height in the cylinder
    energy_profile = zeros(ceil(size3/0.2),10); % record the energy related information of each event

    %-----------  set up the filtering variables  ------------
    k=0; % k-----> event counter, count from zero to the number of events
    validnum = 0; % record the number of events which are valid (produce valid results of locations)
    jump = 0; 
    threshold = 0.07; % calculate the time which the sensor sees the crack wave (using threshold crossing method)
    filterthresh = 0.15; % this is to filter out the channels without any value exceeding the threshold values
    v=0.29;%0.2257 0.293 % set up speed of acoustic wave travelling inside the asphalt
    plotnum=0; 

    disp(threshold);
       

    
    %-----------  The outter loop, loop through all the events  ------------
   
    while k<max_event
        %-----------  scan the waveform text file  ------------
        C = textscan(fd,formatss,maxrange,'Delimiter','\t');
%         guidata(hObject, handles);
        k=k+1;
        % increment the event counter
        disp(k);

        %-----------  initialize the data matrices  ------------
        max=[0,0,0,0,0,0,0,0]; % record the maximum value of each channel
        recvt=[0,0,0,0,0,0,0,0]; % received time of each channel
        starttime=[0,0,0,0,0,0,0,0]; % starting time of the signal
        maxtime=[0,0,0,0,0,0,0,0]; % time which the signal has the maximum amplitude
        lasttime=[0,0,0,0,0,0,0,0]; % ending time of the signal

        %-----------  inner loop, loop through the 8 channels, and 2048 sampled datas to fill in the above matrices  ------------
        for i=1:8
            for j=1:2048
                temp = abs(str2double(C{i}(j)));
                if temp>max(i)
                    max(i) = temp;
                    maxtime(i)=j;
                end
                if temp>threshold && recvt(i)==0
                    recvt(i)=j;
                end   
                if temp>filterthresh && starttime(i)==0
                    starttime(i)=j;
                end 
                if temp>filterthresh
                    lasttime(i)=j;
                end 
            end
        end

        count = 0;

        filteredmax=[0,0,0,0,0,0,0,0];
        filteredrecvt=[0,0,0,0,0,0,0,0];


        %-----------  Filtering algorithm, different filtering mechanism depends on the requirements of the tests  ------------
        % first is duration time, second is rising time
        for l=1:8
%             if lasttime(l)-starttime(l)<150 && max(l)<0.2
%                 filteredmax(l)=max(l);
%                 filteredrecvt(l)=recvt(l);
%                 count = count+1;
%             elseif lasttime(l)-starttime(l)<233 && max(l)<0.3
%                 filteredmax(l)=max(l);
%                 filteredrecvt(l)=recvt(l);
%                 count = count+1;  
%             elseif lasttime(l)-starttime(l)<305 && max(l)<0.4
%                 filteredmax(l)=max(l);
%                 filteredrecvt(l)=recvt(l);
%                 count = count+1;  
%             elseif lasttime(l)-starttime(l)<320 && lasttime(l)-starttime(l)>60 && max(l)<0.5
%                 filteredmax(l)=max(l);
%                 filteredrecvt(l)=recvt(l);
%                 count = count+1;  
%             elseif lasttime(l)-starttime(l)<335 && lasttime(l)-starttime(l)>60 && max(l)<0.6
%                 filteredmax(l)=max(l);
%                 filteredrecvt(l)=recvt(l);
%                 count = count+1;   
%             elseif lasttime(l)-starttime(l)<350 && lasttime(l)-starttime(l)>90 && max(l)<0.7
%                 filteredmax(l)=max(l);
%                 filteredrecvt(l)=recvt(l);
%                 count = count+1;   
%             elseif lasttime(l)-starttime(l)<350 && lasttime(l)-starttime(l)>90 && max(l)<0.8
%                 filteredmax(l)=max(l);
%                 filteredrecvt(l)=recvt(l);
%                 count = count+1; 
%             elseif lasttime(l)-starttime(l)<500 && lasttime(l)-starttime(l)>100 && max(l)<0.9
%                 filteredmax(l)=max(l);
%                 filteredrecvt(l)=recvt(l);
%                 count = count+1;                 
%             elseif lasttime(l)-starttime(l)<1800 && lasttime(l)-starttime(l)>100 && max(l)<1
%                 filteredmax(l)=max(l);
%                 filteredrecvt(l)=recvt(l);
%                 count = count+1;      
%             elseif lasttime(l)-starttime(l)<1800 && lasttime(l)-starttime(l)>100 && max(l)==1
%                 filteredmax(l)=max(l);
%                 filteredrecvt(l)=recvt(l);
%                 count = count+1;     
%             else
%                 continue;            
%             end
                filteredmax(l)=max(l);
                filteredrecvt(l)=recvt(l);
                count = count+1;     
         end

%-----------  if only less than 4 sensors meet the filtering requirements, we disgard this set of data, continue to the next event  ------------
        if count <= 3
            continue;
        end

%-----------  TT is the time which the sensor receives the crack singals, NN is the number of sensor which sees the crack signal  ------------
        TT=[0,0,0,0];
        NN=[0,0,0,0];
%-----------  position in the TT matrix matches with position in the NN matrix  ------------
%-----------  i.e. TT = [12, 10, 8, 22], NN = [1 3 5 6], means sensor 1 receives the signal at 12 us  ------------
%-----------  sensor 3 receives signal at 10 us, sensor 5 receives signal at 8 us, sensor 6 receives at 22 us  ------------


%-----------  sort the previous results, store the sorted results into TT and NN  ------------        
        sortedmax= sort(filteredmax,'descend');
   
        n=1;
        for zz=1:8
           if n==5
            break;
           end
            for w=1:8
                if filteredmax(w)==sortedmax(zz)&& w~=NN(1)&& w~=NN(2)&& w~=NN(3)&& w~=NN(4) && filteredmax(w)~= 0
                    TT(n)=filteredrecvt(w);
                    NN(n)=w;
                    n=n+1;
                    break;
                end
             end
        end

                 
        if TT(1)==0 || TT(2)==0||TT(3)==0||TT(4)==0
            continue;
        end
        
        if TT(1)==TT(2) && TT(2)==TT(3) && TT(3)==TT(4)
            TT(2)=TT(1)+1;
            TT(3)=TT(1)+2;
            TT(4)=TT(1)+3;
        end
        

        
    disp('TT:');
    disp(TT);
    disp('NN :');
    disp(NN);    
    
    %disp('NN and TT done');



    %-----------  solve the system of equations, obtain the results we want using triangulation  ------------
        syms x y z t0
        [solutions_t0, solutions_x, solutions_y, solutions_z] = solve(...
                        (x-CO(NN(1),1))^2+(y-CO(NN(1),2))^2+(z-CO(NN(1),3))^2 == v^2*(TT(1)-t0)^2,... 
                        (x-CO(NN(2),1))^2+(y-CO(NN(2),2))^2+(z-CO(NN(2),3))^2 == v^2*(TT(2)-t0)^2,... 
                        (x-CO(NN(3),1))^2+(y-CO(NN(3),2))^2+(z-CO(NN(3),3))^2 == v^2*(TT(3)-t0)^2,...
                        (x-CO(NN(4),1))^2+(y-CO(NN(4),2))^2+(z-CO(NN(4),3))^2 == v^2*(TT(4)-t0)^2);

       solutions = [solutions_x, solutions_y, solutions_z, solutions_t0];

       sizesolu = size(solutions_t0);
       if sizesolu == 0
           continue;
       end

      %-----------  the equation set has two sets of solutions, we store them in solution 1, 2  ------------
       
       % the 4 elements in each solution is:  x,y,z,time when the crack happens
       solution1 = [0,0,0,0];
       solution2 = [0,0,0,0];
       solution1(1)=double(solutions(1,1));
       solution1(2)=double(solutions(1,2));
       solution1(3)=double(solutions(1,3));
       solution1(4)=double(solutions(1,4));

       solution2(1)=double(solutions(2,1));
       solution2(2)=double(solutions(2,2));
       solution2(3)=double(solutions(2,3));
       solution2(3)=double(solutions(2,4));

       
       disp(solution1);
       disp(solution2);

       %-----------  evaluate the solutions we obtained  ------------
       realsolu = 0;

       for realy=1:4
           real1=isreal(solution1(realy));
           if real1 == 0
               realsolu =1;
               break;
           end
       end

         % disp(realsolu);
       if realsolu == 1
           continue;
       end
         % disp(realsolu);
       for realx=1:4
           real2=isreal(solution2(realx));
           if real2 == 0
               realsolu =1;
               break;
           end
       end
       %disp(realsolu);
       if realsolu == 1
           continue;
       end

       
       if solution1(1)^2+solution1(2)^2>radius^2 && solution1(1)^2+solution1(2)^2<=(radius+0.5)^2
               temp_ratio = radius/((solution1(1)^2+solution1(2)^2)^0.5);
               new_x = solution1(1)*temp_ratio;
               new_y = solution1(2)*temp_ratio;
               solution1(1)=new_x;
               solution1(2)=new_y;
               disp('changed1: ');
               disp(solution1);
       end
       
       if solution2(1)^2+solution2(2)^2>radius^2 && solution2(1)^2+solution2(2)^2<=(radius+0.5)^2
               temp_ratio2 = radius/((solution2(1)^2+solution2(2)^2)^0.5);
               new_x2 = solution2(1)*temp_ratio2;
               new_y2 = solution2(2)*temp_ratio2;
               solution2(1)=new_x2;
               solution2(2)=new_y2;
               disp('changed2: ');
               disp(solution2);
       end       
       
       
       %-----------  check which of the solution is more valid to be used in source location  ------------
       
       valid1=0;
       valid2=0;
       plotvalid = 0;

       %-----------  criteria is the calculated location of crack must be within the range of ashphalt  ------------
       %-----------  the time at which crack happens cannot be late than the sensors' receiving time  ------------
       if (((solution1(1))^2+(solution1(2))^2)<=radius^2 && solution1(3)<=size3+0.2 && solution1(3)>=-0.2 && solution1(4)<TT(1) && solution1(4)<TT(2)&&solution1(4)<TT(3)&&solution1(4)<TT(4))
            valid1=1;
        end
        if (((solution2(1))^2+(solution2(2))^2)<=radius^2 && solution2(3)<=size3+0.2 && solution2(3)>=-0.2 && solution2(4)<TT(1) && solution2(4)<TT(2) && solution2(4)<TT(3)&&solution2(4)<TT(4))
            valid2=1;
        end  

        if solution1(3)>size3
            solution1(3)=size3;
        end
        
        if solution2(3)>size3
            solution2(3)=size3;
        end
        
        if solution1(3)<0
            solution1(3)=0.1;
        end
        
        if solution2(3)<0
            solution2(3)=0.1;
        end        
        
        
        %-----------  if both solutions are valid, we use the one with larger cracking time  ------------
        %-----------  larger cracking time means the distance of the crack to the sensor are shorter, hence more reliable  ------------
        if (valid1 ==1 && valid2 ==1)
            if solution1(4)>solution2(4)
                plotvalid = 1;
            else
                plotvalid = 2;
            end
        end

        if (valid1 ==1 && valid2 ~=1)
            plotvalid = 1;
        end

        if (valid1 ~=1 && valid2 ==1)
            plotvalid = 2;
        end

        disp('plotvalid is');
        disp(plotvalid);
        if plotvalid == 1
            hold on
            
         %-----------  calculate which color we are going to use to plot the crack locations  ------------   
             cur_time = timeofevents(k,1);

            for m = 2: num_clock
                if (cur_time > result(m-1,1) && cur_time <= result(m,1))
                   % cur_temperature = result(m,2);
                    cur_temperature = result(m-1,2)-(result(m-1,2)-result(m,2))/5 * abs(cur_time-result(m-1,1));
                    eventsoftemperature(k,1) = k;
                    eventsoftemperature(k,2) = cur_temperature;
                    break;
                end
                if (cur_time == result(m-1,1))
                    cur_temperature = result(m-1,2);
                    eventsoftemperature(k,1) = k;
                    eventsoftemperature(k,2) = cur_temperature;
                    break;
                end
                if (cur_time == result(m,1))
                    cur_temperature = result(m,2);
                    eventsoftemperature(k,1) = k;
                    eventsoftemperature(k,2) = cur_temperature;
                    break;
                end
            end
            slope = (64-1)./(max_temperature-min_temperature);
            b = 64 - max_temperature*slope;

            color_temp = round(slope*cur_temperature+b);

            %-----------  plot the location of cracks, if you only are interested in the energy data etc, comment the plot commant will accelerate the processing time by a lot  ------------
           scatter3(solution1(1),solution1(2),solution1(3),20,[camp(color_temp,1) camp(color_temp,2) camp(color_temp,3)],'o','fill');
%           plot3(solution1(1), solution1(2), solution1(3), 'marker','o');

            drawnow;  


            %-----------  save the energy related information into energy profile  ------------
            
            if height_temperature(ceil(solution1(3)/0.2)) == 0
                   height_temperature(ceil(solution1(3)/0.2)) = cur_temperature;
                   energy_profile(ceil(solution1(3)/0.2),1) = solution1(1);
                   energy_profile(ceil(solution1(3)/0.2),2) = solution1(2);
                   energy_profile(ceil(solution1(3)/0.2),3) = solution1(3);
                   energy_profile(ceil(solution1(3)/0.2),4) = NN(1);
                   energy_profile(ceil(solution1(3)/0.2),5) = NN(2);
                   energy_profile(ceil(solution1(3)/0.2),6) = NN(3);
                   energy_profile(ceil(solution1(3)/0.2),7) = NN(4);
                   energy_profile(ceil(solution1(3)/0.2),8) = k;
                   energy_profile(ceil(solution1(3)/0.2),9) = cur_temperature;
                   energy_profile(ceil(solution1(3)/0.2),10) = ceil(solution1(3)/0.2)*0.2;
            elseif cur_temperature > height_temperature(ceil(solution1(3)/0.2))
                   height_temperature(ceil(solution1(3)/0.2)) = cur_temperature;
                   energy_profile(ceil(solution1(3)/0.2),1) = solution1(1);
                   energy_profile(ceil(solution1(3)/0.2),2) = solution1(2);
                   energy_profile(ceil(solution1(3)/0.2),3) = solution1(3);
                   energy_profile(ceil(solution1(3)/0.2),4) = NN(1);
                   energy_profile(ceil(solution1(3)/0.2),5) = NN(2);
                   energy_profile(ceil(solution1(3)/0.2),6) = NN(3);
                   energy_profile(ceil(solution1(3)/0.2),7) = NN(4);
                   energy_profile(ceil(solution1(3)/0.2),8) = k;
                   energy_profile(ceil(solution1(3)/0.2),9) = cur_temperature;
                   energy_profile(ceil(solution1(3)/0.2),10) = ceil(solution1(3)/0.2)*0.2;                
            end
            
            %-----------  calculate average embrittlement temperature at each level of height  ------------
            old_avg=ave_height_temperature(ceil(solution1(3)/0.2),1);
            denom=ave_height_temperature(ceil(solution1(3)/0.2),2);
            if ave_height_temperature(ceil(solution1(3)/0.2),2)==0
                ave_height_temperature(ceil(solution1(3)/0.2),2)=1;
                ave_height_temperature(ceil(solution1(3)/0.2),1)=cur_temperature;
            else
                ave_height_temperature(ceil(solution1(3)/0.2),1)=(old_avg*denom+cur_temperature)/(denom+1);
                ave_height_temperature(ceil(solution1(3)/0.2),2)=ave_height_temperature(ceil(solution1(3)/0.2),2)+1;
            end
            
            
           % plotnum=plotnum+1;
            disp('finish plot');
        end
        if plotvalid == 2
            hold on
             cur_time = timeofevents(k,1);
            % disp(cur_time);

            for m = 2: num_clock
             %   disp(m);
              %  disp(result(m,1));
               % disp(result(m-1,1));
                if (cur_time > result(m-1,1) && cur_time < result(m,1))
                    %cur_temperature = result(m,2);
                    cur_temperature = result(m-1,2)-(result(m-1,2)-result(m,2))/5 * abs(cur_time-result(m-1,1));
                    eventsoftemperature(k,1) = k;
                    eventsoftemperature(k,2) = cur_temperature;
                    break;
                end
                if (cur_time == result(m-1,1))
                    cur_temperature = result(m-1,2);
                    eventsoftemperature(k,1) = k;
                    eventsoftemperature(k,2) = cur_temperature;
                    break;
                end
                if (cur_time == result(m,1))
                    cur_temperature = result(m,2);
                    eventsoftemperature(k,1) = k;
                    eventsoftemperature(k,2) = cur_temperature;
                    break;
                end
            end
            slope = (64-1)./(max_temperature-min_temperature);
            b = 64 - max_temperature*slope;

            color_temp = round(slope*cur_temperature+b);

            scatter3(solution2(1),solution2(2),solution2(3),20,[camp(color_temp,1) camp(color_temp,2) camp(color_temp,3)],'o','fill');
%                 plot3(solution2(1), solution2(2), solution2(3), 'marker','o');             
            drawnow;       
             
            if height_temperature(ceil(solution2(3)/0.2)) == 0
                   height_temperature(ceil(solution2(3)/0.2)) = cur_temperature;
                   energy_profile(ceil(solution2(3)/0.2),1) = solution2(1);
                   energy_profile(ceil(solution2(3)/0.2),2) = solution2(2);
                   energy_profile(ceil(solution2(3)/0.2),3) = solution2(3);
                   energy_profile(ceil(solution2(3)/0.2),4) = NN(1);
                   energy_profile(ceil(solution2(3)/0.2),5) = NN(2);
                   energy_profile(ceil(solution2(3)/0.2),6) = NN(3);
                   energy_profile(ceil(solution2(3)/0.2),7) = NN(4);
                   energy_profile(ceil(solution2(3)/0.2),8) = k;
                   energy_profile(ceil(solution2(3)/0.2),9) = cur_temperature;
                   energy_profile(ceil(solution2(3)/0.2),10) = ceil(solution2(3)/0.2)*0.2;
            elseif cur_temperature > height_temperature(ceil(solution2(3)/0.2))
                   height_temperature(ceil(solution2(3)/0.2)) = cur_temperature;
                   energy_profile(ceil(solution2(3)/0.2),1) = solution2(1);
                   energy_profile(ceil(solution2(3)/0.2),2) = solution2(2);
                   energy_profile(ceil(solution2(3)/0.2),3) = solution2(3);
                   energy_profile(ceil(solution2(3)/0.2),4) = NN(1);
                   energy_profile(ceil(solution2(3)/0.2),5) = NN(2);
                   energy_profile(ceil(solution2(3)/0.2),6) = NN(3);
                   energy_profile(ceil(solution2(3)/0.2),7) = NN(4);
                   energy_profile(ceil(solution2(3)/0.2),8) = k;
                   energy_profile(ceil(solution2(3)/0.2),9) = cur_temperature;
                   energy_profile(ceil(solution2(3)/0.2),10) = ceil(solution2(3)/0.2)*0.2;
            end
          
            old_avg=ave_height_temperature(ceil(solution2(3)/0.2),1);
            denom=ave_height_temperature(ceil(solution2(3)/0.2),2);
            if ave_height_temperature(ceil(solution2(3)/0.2),2)==0
                ave_height_temperature(ceil(solution2(3)/0.2),2)=1;
                ave_height_temperature(ceil(solution2(3)/0.2),1)=cur_temperature;
            else
                ave_height_temperature(ceil(solution2(3)/0.2),1)=(old_avg*denom+cur_temperature)/(denom+1);
                ave_height_temperature(ceil(solution2(3)/0.2),2)=ave_height_temperature(ceil(solution1(3)/0.2),2)+1;
            end
            
            disp('finish plot');
        end

    end


%-----------  figures displaying the test results  ------------
    fig1 = figure;

    
    figure(fig1);
    xlabel('temperature');
    ylabel('height');
    title('First EmbrittlementTemperature');
    hold on
    
    for i=1:size3/0.2
        if height_temperature(i) == 0
            continue;
        end
        plot(height_temperature(i),i*0.2,'.r');
    end

    fig2 = figure;
    figure(fig2);
    xlabel('temperature');
    ylabel('height');
    title('Average Embrittlement Temperature');    
    hold on

    for i=1:size3/0.2
        if ave_height_temperature(i,1) == 0
            continue;
        end
        plot(ave_height_temperature(i,1),i*0.2,'.r');       
      
    end
    
    disp('x  y  z  sensor1 sensor2 sensor3 sensor4 num_of_event temperature  height');
    
    disp(energy_profile)
    dlmwrite('energy_profile.txt',energy_profile);
   
        



%-----------   Rectangular Sample, Mode 2  ------------    
else

    set(gca,'DataAspectRatio',[1 1 1],...
         'PlotBoxAspectRatio',[1 1 1],...
        'XLim',[0 12],...
        'YLim',[0 5],...
        'ZLim',[0 6]);
    
    CO=[0,0,0;0,0,0;0,0,0;0,0,0;0,0,0;0,0,0;0,0,0;0,0,0];
% sr1 sh1 sd1
    CO(1,1)=str2double(get(handles.sr1, 'String'));
 CO(1,3)=str2double(get(handles.sh1, 'String'));
 CO(1,2)=str2double(get(handles.sd1, 'String'));
  CO(2,1)=str2double(get(handles.sr2, 'String'));
 CO(2,3)=str2double(get(handles.sh2, 'String'));
 CO(2,2)=str2double(get(handles.sd2, 'String'));
  CO(3,1)=str2double(get(handles.sr3, 'String'));
 CO(3,3)=str2double(get(handles.sh3, 'String'));
 CO(3,2)=str2double(get(handles.sd3, 'String'));
  CO(4,1)=str2double(get(handles.sr4, 'String'));
 CO(4,3)=str2double(get(handles.sh4, 'String'));
 CO(4,2)=str2double(get(handles.sd4, 'String'));
  CO(5,1)=str2double(get(handles.sr5, 'String'));
 CO(5,3)=str2double(get(handles.sh5, 'String'));
 CO(5,2)=str2double(get(handles.sd5, 'String'));
  CO(6,1)=str2double(get(handles.sr6, 'String'));
 CO(6,3)=str2double(get(handles.sh6, 'String'));
 CO(6,2)=str2double(get(handles.sd6, 'String'));
  CO(7,1)=str2double(get(handles.sr7, 'String'));
 CO(7,3)=str2double(get(handles.sh7, 'String'));
 CO(7,2)=str2double(get(handles.sd7, 'String'));
  CO(8,1)=str2double(get(handles.sr8, 'String'));
 CO(8,3)=str2double(get(handles.sh8, 'String'));
 CO(8,2)=str2double(get(handles.sd8, 'String'));
 
 
%  
%     CO(1,:)=[4,0,3];
%     CO(2,:)=[8,0,3];
%     CO(3,:)=[4,5,3];
%     CO(4,:)=[8,5,3];
%     CO(5,:)=[6,2,6];
%     CO(6,:)=[6,3,0];
%     CO(7,:)=[0,2,3];  
    hold on
 
    plot3(CO(1,1), CO(1,2), CO(1,3), 'marker','+');
    plot3(CO(2,1), CO(2,2), CO(2,3), 'marker','+');
    plot3(CO(3,1), CO(3,2), CO(3,3), 'marker','+');
    plot3(CO(4,1), CO(4,2), CO(4,3), 'marker','+');
    plot3(CO(5,1), CO(5,2), CO(5,3), 'marker','+');
    plot3(CO(6,1), CO(6,2), CO(6,3), 'marker','+');
    plot3(CO(7,1), CO(7,2), CO(7,3), 'marker','+');
    plot3(CO(8,1), CO(8,2), CO(8,3), 'marker','+');
    drawnow;
    hold on
    %front
    size_x=str2double(get(handles.size1, 'String'));
    size_y=str2double(get(handles.size2, 'String'));
    size_z=str2double(get(handles.size3, 'String'));
  	p1 = [0 0 0];
    p2 = [size_x 0 0];
    p3 = [size_x 0 size_z];
    p4 = [0 0 size_z]; 

    x = [p1(1) p2(1) p3(1) p4(1)];
    y = [p1(2) p2(2) p3(2) p4(2)];
    z = [p1(3) p2(3) p3(3) p4(3)];

    fill3(x, y, z, 1,'facealpha',0.1,'facecolor',[1 1 0]);

    %back
    p1 = [0 size_y 0];
    p2 = [size_x size_y 0];
    p3 = [size_x size_y size_z];
    p4 = [0 size_y size_z]; 

    x = [p1(1) p2(1) p3(1) p4(1)];
    y = [p1(2) p2(2) p3(2) p4(2)];
    z = [p1(3) p2(3) p3(3) p4(3)];

    fill3(x, y, z, 1,'facealpha',0.1,'facecolor',[1 1 0]);

    %top
    p1 = [0 0 size_z];
    p2 = [size_x 0 size_z];
    p3 = [size_x size_y size_z];
    p4 = [0 size_y size_z]; 

    x = [p1(1) p2(1) p3(1) p4(1)];
    y = [p1(2) p2(2) p3(2) p4(2)];
    z = [p1(3) p2(3) p3(3) p4(3)];

    fill3(x, y, z, 1,'facealpha',0.1,'facecolor',[1 1 0]);

    %bottom
    p1 = [0 0 0];
    p2 = [size_x 0 0];
    p3 = [size_x size_y 0];
    p4 = [0 size_y 0]; 

    x = [p1(1) p2(1) p3(1) p4(1)];
    y = [p1(2) p2(2) p3(2) p4(2)];
    z = [p1(3) p2(3) p3(3) p4(3)];

    fill3(x, y, z, 1,'facealpha',0.1,'facecolor',[1 1 0]);

    %left
    p1 = [0 0 0];
    p2 = [0 0 size_z];
    p3 = [0 size_y size_z];
    p4 = [0 size_y 0]; 

    x = [p1(1) p2(1) p3(1) p4(1)];
    y = [p1(2) p2(2) p3(2) p4(2)];
    z = [p1(3) p2(3) p3(3) p4(3)];

    fill3(x, y, z, 1,'facealpha',0.1,'facecolor',[1 1 0]);

    %right
    p1 = [size_x 0 0];
    p2 = [size_x 0 size_z];
    p3 = [size_x size_y size_z];
    p4 = [size_x size_y 0]; 

    x = [p1(1) p2(1) p3(1) p4(1)];
    y = [p1(2) p2(2) p3(2) p4(2)];
    z = [p1(3) p2(3) p3(3) p4(3)];

    fill3(x, y, z, 1,'facealpha',0.1,'facecolor',[1 1 0]);

    maxrange=2048;
    formatss = '%s %s %s %s %s %s %s %s';
    fd = fopen(fullpathadd,'r','n','UTF-8');
    M = textscan(fd,'%f %f %f %f',1,'Delimiter','\t');
%     disp(M);
    max_event=M{2};
%     disp(max_event);
    disp(class(max_event));
    k=0;
    validnum = 0;
    jump = 0;
    threshold = 0.3;
    filterthresh = 0.3;
    v=0.35;
    plotnum=0;
    
    while k<max_event
 
        C = textscan(fd,formatss,maxrange,'Delimiter','\t');

        k=k+1;
        %keep track
        disp(k);

        max=[0,0,0,0,0,0,0,0];
        recvt=[0,0,0,0,0,0,0,0];
        starttime=[0,0,0,0,0,0,0,0];
        maxtime=[0,0,0,0,0,0,0,0];
        lasttime=[0,0,0,0,0,0,0,0];
        
        
        count = 0;
        for i=1:8
            for j=1:2048
                temp = abs(str2double(C{i}(j)));
                if temp>max(i)
                    max(i) = temp;
                    maxtime(i)=j;
                end
                if temp>threshold && recvt(i)==0
                    recvt(i)=j;
                    count = count +1;
                end   
                if temp>filterthresh && starttime(i)==0
                    starttime(i)=j;
                end 
                if temp>filterthresh
                    lasttime(i)=j;
                end 
            end
        end


%         filteredmax=[0,0,0,0,0,0,0,0];
%         filteredrecvt=[0,0,0,0,0,0,0,0];
%  
%         for l=1:8
%             if lasttime(l)-starttime(l)<350 && maxtime(l)-starttime(l)<20
%                 filteredmax(l)=max(l);
%                 filteredrecvt(l)=recvt(l);
%                 count = count+1;
%             end
%         end

        if count <= 3
            disp('not enough valid data');
            continue;
        end
 


        TT=[0,0,0,0];
        NN=[0,0,0,0];
        sortedmax= sort(max,'descend');
        %disp('sortdone');

       % disp('start find right NN and TT');
        n=1;
        for zz=1:8
            for w=1:8
                if max(w)==sortedmax(zz)&& w~=NN(1)&& w~=NN(2)&& w~=NN(3)&& w~=NN(4) && max(w)~= 0
                    TT(n)=recvt(w);
                    NN(n)=w;
                    n=n+1;
                    break;
                end
                if n==5
                    break;
                end
            end
        end

        if TT(1)==TT(2) && TT(2)==TT(3) && TT(3)==TT(4)
            TT(2)=TT(1)+0.1;
            TT(3)=TT(1)+0.2;
            TT(4)=TT(1)+0.3;
        end

        %disp('NN and TT done');
        syms x y z t0
        [solutions_t0, solutions_x, solutions_y, solutions_z] = solve(...
                        (x-CO(NN(1),1))^2+(y-CO(NN(1),2))^2+(z-CO(NN(1),3))^2 == v^2*(TT(1)-t0)^2,... 
                        (x-CO(NN(2),1))^2+(y-CO(NN(2),2))^2+(z-CO(NN(2),3))^2 == v^2*(TT(2)-t0)^2,... 
                        (x-CO(NN(3),1))^2+(y-CO(NN(3),2))^2+(z-CO(NN(3),3))^2 == v^2*(TT(3)-t0)^2,...
                        (x-CO(NN(4),1))^2+(y-CO(NN(4),2))^2+(z-CO(NN(4),3))^2 == v^2*(TT(4)-t0)^2);

       solutions = [solutions_x, solutions_y, solutions_z, solutions_t0];

       sizesolu = size(solutions_t0);
       if sizesolu == 0
           disp('no solution in this event.');
           continue;
       end

       %x y z time
       solution1 = [0,0,0,0];
       solution2 = [0,0,0,0];
       solution1(1)=double(solutions(1,1));
       solution1(2)=double(solutions(1,2));
       solution1(3)=double(solutions(1,3));
       solution1(4)=double(solutions(1,4));

       solution2(1)=double(solutions(2,1));
       solution2(2)=double(solutions(2,2));
       solution2(3)=double(solutions(2,3));
       solution2(4)=double(solutions(2,4));

       disp('answer is');
       disp(solution1);
       disp(solution2);
       realsolu = 0;

       for realy=1:4
           real1=isreal(solution1(realy));
           if real1 == 0
               realsolu =1;
               break;
           end
       end

         % disp(realsolu);
       if realsolu == 1
           continue;
       end
         % disp(realsolu);
       for realx=1:4
           real2=isreal(solution2(realx));
           if real2 == 0
               realsolu =1;
               break;
           end
       end
       %disp(realsolu);
       if realsolu == 1
           continue;
       end

       valid1=0;
       valid2=0;
       plotvalid = 0;

       %disp(solution1(1));
       %disp(solution1(2));
      %disp(solution1(3));

        if (solution1(1)<=size_x+5 && solution1(2)<=size_y+5 && solution1(3)<=size_z+5 && solution1(1)>=-5 && solution1(2)>=-5 && solution1(3)>=-5)
            valid1=1;
        end
        if (solution2(1)<=size_x+5 && solution2(2)<=size_y+5 && solution2(3)<=size_z+5 && solution2(1)>=-5 && solution2(2)>=-5 && solution2(3)>=-5)
            valid2=1;
        end  

        if (valid1 ==1 && valid2 ==1)
            if solution1(4)<solution2(4)
                plotvalid = 1;
            else
                plotvalid = 2;
            end
        end

        if (valid1 ==1 && valid2 ~=1)
            plotvalid = 1;
        end

        if (valid1 ~=1 && valid2 ==1)
            plotvalid = 2;
        end


        if plotvalid == 1
            hold on 
               plot3(solutions(1,1), solutions(1,2), solutions(1,3), 'marker','o');
            drawnow; 
%             disp('draw ans1');
%             disp(solution1);
           % disp('finish plot');
        end
        if plotvalid == 2
            hold on
            
            plot3(solutions(2,1), solutions(2,2), solutions(2,3), 'marker','o');
            drawnow;            
%                disp('draw ans2');
%             disp(solution2);
%             disp('finish plot');
        end

    end

end




function sh1_Callback(hObject, eventdata, handles)
% hObject    handle to sh1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sh1 as text
%        str2double(get(hObject,'String')) returns contents of sh1 as a double


% --- Executes during object creation, after setting all properties.
function sh1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sh1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function sd1_Callback(hObject, eventdata, handles)
% hObject    handle to sd1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sd1 as text
%        str2double(get(hObject,'String')) returns contents of sd1 as a double


% --- Executes during object creation, after setting all properties.
function sd1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sd1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sh2_Callback(hObject, eventdata, handles)
% hObject    handle to sh2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sh2 as text
%        str2double(get(hObject,'String')) returns contents of sh2 as a double


% --- Executes during object creation, after setting all properties.
function sh2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sh2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sd2_Callback(hObject, eventdata, handles)
% hObject    handle to sd2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sd2 as text
%        str2double(get(hObject,'String')) returns contents of sd2 as a double


% --- Executes during object creation, after setting all properties.
function sd2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sd2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sh3_Callback(hObject, eventdata, handles)
% hObject    handle to sh3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sh3 as text
%        str2double(get(hObject,'String')) returns contents of sh3 as a double


% --- Executes during object creation, after setting all properties.
function sh3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sh3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sd3_Callback(hObject, eventdata, handles)
% hObject    handle to sd3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sd3 as text
%        str2double(get(hObject,'String')) returns contents of sd3 as a double


% --- Executes during object creation, after setting all properties.
function sd3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sd3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sh4_Callback(hObject, eventdata, handles)
% hObject    handle to sh4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sh4 as text
%        str2double(get(hObject,'String')) returns contents of sh4 as a double


% --- Executes during object creation, after setting all properties.
function sh4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sh4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sd4_Callback(hObject, eventdata, handles)
% hObject    handle to sd4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sd4 as text
%        str2double(get(hObject,'String')) returns contents of sd4 as a double


% --- Executes during object creation, after setting all properties.
function sd4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sd4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Browsebt.
function Browsebt_Callback(hObject, eventdata, handles)
% hObject    handle to Browsebt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fullpath;    
[filename pathname] = uigetfile({'*.txt'},'File Selector');
fullpathname = strcat(pathname,filename);
fullpath = fullpathname;
set(handles.waddr,'String',fullpathname);
% Update handles structure
guidata(hObject, handles);




function waddr_Callback(hObject, eventdata, handles)
% hObject    handle to waddr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of waddr as text
%        str2double(get(hObject,'String')) returns contents of waddr as a double


% --- Executes during object creation, after setting all properties.
function waddr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to waddr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sh5_Callback(hObject, eventdata, handles)
% hObject    handle to sh5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sh5 as text
%        str2double(get(hObject,'String')) returns contents of sh5 as a double


% --- Executes during object creation, after setting all properties.
function sh5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sh5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sd5_Callback(hObject, eventdata, handles)
% hObject    handle to sd5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sd5 as text
%        str2double(get(hObject,'String')) returns contents of sd5 as a double


% --- Executes during object creation, after setting all properties.
function sd5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sd5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sh6_Callback(hObject, eventdata, handles)
% hObject    handle to sh6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sh6 as text
%        str2double(get(hObject,'String')) returns contents of sh6 as a double


% --- Executes during object creation, after setting all properties.
function sh6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sh6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sd6_Callback(hObject, eventdata, handles)
% hObject    handle to sd6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sd6 as text
%        str2double(get(hObject,'String')) returns contents of sd6 as a double


% --- Executes during object creation, after setting all properties.
function sd6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sd6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sh7_Callback(hObject, eventdata, handles)
% hObject    handle to sh7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sh7 as text
%        str2double(get(hObject,'String')) returns contents of sh7 as a double


% --- Executes during object creation, after setting all properties.
function sh7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sh7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sd7_Callback(hObject, eventdata, handles)
% hObject    handle to sd7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sd7 as text
%        str2double(get(hObject,'String')) returns contents of sd7 as a double


% --- Executes during object creation, after setting all properties.
function sd7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sd7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sh8_Callback(hObject, eventdata, handles)
% hObject    handle to sh8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sh8 as text
%        str2double(get(hObject,'String')) returns contents of sh8 as a double


% --- Executes during object creation, after setting all properties.
function sh8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sh8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit28_Callback(hObject, eventdata, handles)
% hObject    handle to edit28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit28 as text
%        str2double(get(hObject,'String')) returns contents of edit28 as a double


% --- Executes during object creation, after setting all properties.
function edit28_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when figure1 is resized.
function figure1_ResizeFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function sr1_Callback(hObject, eventdata, handles)
% hObject    handle to sr1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sr1 as text
%        str2double(get(hObject,'String')) returns contents of sr1 as a double


% --- Executes during object creation, after setting all properties.
function sr1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sr1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sr2_Callback(hObject, eventdata, handles)
% hObject    handle to sr2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sr2 as text
%        str2double(get(hObject,'String')) returns contents of sr2 as a double


% --- Executes during object creation, after setting all properties.
function sr2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sr2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sr3_Callback(hObject, eventdata, handles)
% hObject    handle to sr3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sr3 as text
%        str2double(get(hObject,'String')) returns contents of sr3 as a double


% --- Executes during object creation, after setting all properties.
function sr3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sr3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sr4_Callback(hObject, eventdata, handles)
% hObject    handle to sr4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sr4 as text
%        str2double(get(hObject,'String')) returns contents of sr4 as a double


% --- Executes during object creation, after setting all properties.
function sr4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sr4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sr5_Callback(hObject, eventdata, handles)
% hObject    handle to sr5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sr5 as text
%        str2double(get(hObject,'String')) returns contents of sr5 as a double


% --- Executes during object creation, after setting all properties.
function sr5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sr5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sr6_Callback(hObject, eventdata, handles)
% hObject    handle to sr6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sr6 as text
%        str2double(get(hObject,'String')) returns contents of sr6 as a double


% --- Executes during object creation, after setting all properties.
function sr6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sr6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit35_Callback(hObject, eventdata, handles)
% hObject    handle to edit35 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit35 as text
%        str2double(get(hObject,'String')) returns contents of edit35 as a double


% --- Executes during object creation, after setting all properties.
function edit35_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit35 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sr8_Callback(hObject, eventdata, handles)
% hObject    handle to sr8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sr8 as text
%        str2double(get(hObject,'String')) returns contents of sr8 as a double


% --- Executes during object creation, after setting all properties.
function sr8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sr8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function colume1_Callback(hObject, eventdata, handles)
% hObject    handle to colume1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of colume1 as text
%        str2double(get(hObject,'String')) returns contents of colume1 as a double


% --- Executes during object creation, after setting all properties.
function colume1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to colume1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function colume2_Callback(hObject, eventdata, handles)
% hObject    handle to colume2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of colume2 as text
%        str2double(get(hObject,'String')) returns contents of colume2 as a double


% --- Executes during object creation, after setting all properties.
function colume2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to colume2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function colume3_Callback(hObject, eventdata, handles)
% hObject    handle to colume3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of colume3 as text
%        str2double(get(hObject,'String')) returns contents of colume3 as a double


% --- Executes during object creation, after setting all properties.
function colume3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to colume3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle statebutton of radiobutton1


% --- Executes on button press in mode1.
function mode1_Callback(hObject, eventdata, handles)
% hObject    handle to mode1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.colume1, 'enable', 'on');
set(handles.colume11, 'enable', 'off');
set(handles.colume2, 'enable', 'on');
set(handles.colume21, 'enable', 'off');
set(handles.colume3, 'enable', 'on');
set(handles.colume31, 'enable', 'off');
set(handles.colume_s1, 'enable', 'on');
set(handles.colume_s11, 'enable', 'off');
set(handles.colume_s2, 'enable', 'on');
set(handles.colume_s21, 'enable', 'off');
set(handles.colume_s3, 'enable', 'on');
set(handles.colume_s31, 'enable', 'off');

handles.mode = 1;
guidata(hObject, handles);


% --- Executes on button press in mode2.
function mode2_Callback(hObject, eventdata, handles)
% hObject    handle to mode2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.colume1, 'enable', 'off');
set(handles.colume11, 'enable', 'on');
set(handles.colume2, 'enable', 'off');
set(handles.colume21, 'enable', 'on');
set(handles.colume3, 'enable', 'off');
set(handles.colume31, 'enable', 'on');
set(handles.colume_s1, 'enable', 'off');
set(handles.colume_s11, 'enable', 'on');
set(handles.colume_s2, 'enable', 'off');
set(handles.colume_s21, 'enable', 'on');
set(handles.colume_s3, 'enable', 'off');
set(handles.colume_s31, 'enable', 'on');
 
handles.mode = 2;
guidata(hObject, handles);


function sr7_Callback(hObject, eventdata, handles)
% hObject    handle to sr7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sr7 as text
%        str2double(get(hObject,'String')) returns contents of sr7 as a double


% --- Executes during object creation, after setting all properties.
function sr7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sr7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sd8_Callback(hObject, eventdata, handles)
% hObject    handle to sd8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sd8 as text
%        str2double(get(hObject,'String')) returns contents of sd8 as a double


% --- Executes during object creation, after setting all properties.
function sd8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sd8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function size1_Callback(hObject, eventdata, handles)
% hObject    handle to size1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of size1 as text
%        str2double(get(hObject,'String')) returns contents of size1 as a double


% --- Executes during object creation, after setting all properties.
function size1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to size1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function size2_Callback(hObject, eventdata, handles)
% hObject    handle to size2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of size2 as text
%        str2double(get(hObject,'String')) returns contents of size2 as a double


% --- Executes during object creation, after setting all properties.
function size2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to size2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function size3_Callback(hObject, eventdata, handles)
% hObject    handle to size3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of size3 as text
%        str2double(get(hObject,'String')) returns contents of size3 as a double


% --- Executes during object creation, after setting all properties.
function size3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to size3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in sensornumber.
function sensornumber_Callback(hObject, eventdata, handles)
% hObject    handle to sensornumber (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns sensornumber contents as cell array
%        contents{get(hObject,'Value')} returns selected item from sensornumber
val = get(hObject, 'Value');
str = get(hObject, 'String');
switch str{val}
    case '4' %user selects 4 sensor
        set(handles.sensor8, 'enable', 'off')
        set(handles.sensor7, 'enable', 'off')
        set(handles.sensor6, 'enable', 'off')
        set(handles.sensor5, 'enable', 'off')
        set(handles.sensor4, 'enable', 'on')
        set(handles.sensor3, 'enable', 'on')
        set(handles.sensor2, 'enable', 'on')
        set(handles.sensor1, 'enable', 'on')     
        set(handles.sh8, 'enable', 'off')
        set(handles.sr8, 'enable', 'off')
        set(handles.sd8, 'enable', 'off')
        set(handles.sh7, 'enable', 'off')
        set(handles.sr7, 'enable', 'off')
        set(handles.sd7, 'enable', 'off')
        set(handles.sh6, 'enable', 'off')
        set(handles.sr6, 'enable', 'off')
        set(handles.sd6, 'enable', 'off')
        set(handles.sh5, 'enable', 'off')
        set(handles.sr5, 'enable', 'off')
        set(handles.sd5, 'enable', 'off')
        set(handles.sh4, 'enable', 'on')
        set(handles.sr4, 'enable', 'on')
        set(handles.sd4, 'enable', 'on')
        set(handles.sh3, 'enable', 'on')
        set(handles.sr3, 'enable', 'on')
        set(handles.sd3, 'enable', 'on')
        set(handles.sh2, 'enable', 'on')
        set(handles.sr2, 'enable', 'on')
        set(handles.sd2, 'enable', 'on')
        set(handles.sh1, 'enable', 'on')
        set(handles.sr1, 'enable', 'on')
        set(handles.sd1, 'enable', 'on')
    case '5' %user selects 5 sensor
        set(handles.sensor8, 'enable', 'off')
        set(handles.sensor7, 'enable', 'off')
        set(handles.sensor6, 'enable', 'off')
        set(handles.sensor5, 'enable', 'on')
        set(handles.sensor4, 'enable', 'on')
        set(handles.sensor3, 'enable', 'on')
        set(handles.sensor2, 'enable', 'on')
        set(handles.sensor1, 'enable', 'on') 
        set(handles.sh8, 'enable', 'off')
        set(handles.sr8, 'enable', 'off')
        set(handles.sd8, 'enable', 'off')
        set(handles.sh7, 'enable', 'off')
        set(handles.sr7, 'enable', 'off')
        set(handles.sd7, 'enable', 'off')
        set(handles.sh6, 'enable', 'off')
        set(handles.sr6, 'enable', 'off')
        set(handles.sd6, 'enable', 'off')
        set(handles.sh5, 'enable', 'on')
        set(handles.sr5, 'enable', 'on')
        set(handles.sd5, 'enable', 'on')
        set(handles.sh4, 'enable', 'on')
        set(handles.sr4, 'enable', 'on')
        set(handles.sd4, 'enable', 'on')
        set(handles.sh3, 'enable', 'on')
        set(handles.sr3, 'enable', 'on')
        set(handles.sd3, 'enable', 'on')
        set(handles.sh2, 'enable', 'on')
        set(handles.sr2, 'enable', 'on')
        set(handles.sd2, 'enable', 'on')
        set(handles.sh1, 'enable', 'on')
        set(handles.sr1, 'enable', 'on')
        set(handles.sd1, 'enable', 'on')    
    case '6' %user selects 6 sensor
        set(handles.sensor8, 'enable', 'off')
        set(handles.sensor7, 'enable', 'off')
        set(handles.sensor6, 'enable', 'on')
        set(handles.sensor5, 'enable', 'on')
        set(handles.sensor4, 'enable', 'on')
        set(handles.sensor3, 'enable', 'on')
        set(handles.sensor2, 'enable', 'on')
        set(handles.sensor1, 'enable', 'on')   
        set(handles.sh8, 'enable', 'off')
        set(handles.sr8, 'enable', 'off')
        set(handles.sd8, 'enable', 'off')
        set(handles.sh7, 'enable', 'off')
        set(handles.sr7, 'enable', 'off')
        set(handles.sd7, 'enable', 'off')
        set(handles.sh6, 'enable', 'on')
        set(handles.sr6, 'enable', 'on')
        set(handles.sd6, 'enable', 'on')
        set(handles.sh5, 'enable', 'on')
        set(handles.sr5, 'enable', 'on')
        set(handles.sd5, 'enable', 'on')
        set(handles.sh4, 'enable', 'on')
        set(handles.sr4, 'enable', 'on')
        set(handles.sd4, 'enable', 'on')
        set(handles.sh3, 'enable', 'on')
        set(handles.sr3, 'enable', 'on')
        set(handles.sd3, 'enable', 'on')
        set(handles.sh2, 'enable', 'on')
        set(handles.sr2, 'enable', 'on')
        set(handles.sd2, 'enable', 'on')
        set(handles.sh1, 'enable', 'on')
        set(handles.sr1, 'enable', 'on')
        set(handles.sd1, 'enable', 'on')
    case '7' %user selects 7 sensor
        set(handles.sensor8, 'enable', 'off')
        set(handles.sensor7, 'enable', 'on')
        set(handles.sensor6, 'enable', 'on')
        set(handles.sensor5, 'enable', 'on')
        set(handles.sensor4, 'enable', 'on')
        set(handles.sensor3, 'enable', 'on')
        set(handles.sensor2, 'enable', 'on')
        set(handles.sensor1, 'enable', 'on') 
        set(handles.sh8, 'enable', 'off')
        set(handles.sr8, 'enable', 'off')
        set(handles.sd8, 'enable', 'off')
        set(handles.sh7, 'enable', 'on')
        set(handles.sr7, 'enable', 'on')
        set(handles.sd7, 'enable', 'on')
        set(handles.sh6, 'enable', 'on')
        set(handles.sr6, 'enable', 'on')
        set(handles.sd6, 'enable', 'on')
        set(handles.sh5, 'enable', 'on')
        set(handles.sr5, 'enable', 'on')
        set(handles.sd5, 'enable', 'on')
        set(handles.sh4, 'enable', 'on')
        set(handles.sr4, 'enable', 'on')
        set(handles.sd4, 'enable', 'on')
        set(handles.sh3, 'enable', 'on')
        set(handles.sr3, 'enable', 'on')
        set(handles.sd3, 'enable', 'on')
        set(handles.sh2, 'enable', 'on')
        set(handles.sr2, 'enable', 'on')
        set(handles.sd2, 'enable', 'on')
        set(handles.sh1, 'enable', 'on')
        set(handles.sr1, 'enable', 'on')
        set(handles.sd1, 'enable', 'on')
    case '8' %user selects 8 sensor
        set(handles.sensor8, 'enable', 'on')
        set(handles.sensor7, 'enable', 'on')
        set(handles.sensor6, 'enable', 'on')
        set(handles.sensor5, 'enable', 'on')
        set(handles.sensor4, 'enable', 'on')
        set(handles.sensor3, 'enable', 'on')
        set(handles.sensor2, 'enable', 'on')
        set(handles.sensor1, 'enable', 'on')        
        set(handles.sh8, 'enable', 'on')
        set(handles.sr8, 'enable', 'on')
        set(handles.sd8, 'enable', 'on')
        set(handles.sh7, 'enable', 'on')
        set(handles.sr7, 'enable', 'on')
        set(handles.sd7, 'enable', 'on')
        set(handles.sh6, 'enable', 'on')
        set(handles.sr6, 'enable', 'on')
        set(handles.sd6, 'enable', 'on')
        set(handles.sh5, 'enable', 'on')
        set(handles.sr5, 'enable', 'on')
        set(handles.sd5, 'enable', 'on')
        set(handles.sh4, 'enable', 'on')
        set(handles.sr4, 'enable', 'on')
        set(handles.sd4, 'enable', 'on')
        set(handles.sh3, 'enable', 'on')
        set(handles.sr3, 'enable', 'on')
        set(handles.sd3, 'enable', 'on')
        set(handles.sh2, 'enable', 'on')
        set(handles.sr2, 'enable', 'on')
        set(handles.sd2, 'enable', 'on')
        set(handles.sh1, 'enable', 'on')
        set(handles.sr1, 'enable', 'on')
        set(handles.sd1, 'enable', 'on')  
end
handles.sensor_number=str{val};
% disp(class(handles.sensor_number));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function sensornumber_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sensornumber (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in push_temperature.
function push_temperature_Callback(hObject, eventdata, handles)
% hObject    handle to push_temperature (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global tempfullpath;    
[tempfilename, temppathname] = uigetfile({'*.csv'},'File Selector');
tempfullpathname = strcat(temppathname,tempfilename);
tempfullpath = tempfullpathname;
set(handles.temperature_addr,'String',tempfullpathname);
% Update handles structure
guidata(hObject, handles);


function temperature_addr_Callback(hObject, eventdata, handles)
% hObject    handle to temperature_addr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of temperature_addr as text
%        str2double(get(hObject,'String')) returns contents of temperature_addr as a double


% --- Executes during object creation, after setting all properties.
function temperature_addr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to temperature_addr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in push_evt.
function push_evt_Callback(hObject, eventdata, handles)
% hObject    handle to push_evt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global evtfullpath;    
[evtfilename, evtpathname] = uigetfile({'*.txt'},'File Selector');
evtfullpathname = strcat(evtpathname,evtfilename);
evtfullpath = evtfullpathname;
set(handles.EVTaddr,'String',evtfullpathname);
% Update handles structure
guidata(hObject, handles);


function EVTaddr_Callback(hObject, eventdata, handles)
% hObject    handle to EVTaddr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EVTaddr as text
%        str2double(get(hObject,'String')) returns contents of EVTaddr as a double


% --- Executes during object creation, after setting all properties.
function EVTaddr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EVTaddr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in statebutton.
function statebutton_Callback(hObject, eventdata, handles)
% hObject    handle to statebutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 
handles.state = handles.state * -1;
if handles.state >0
    set(hObject,'String','Pause');
else
    set(hObject,'String','Resume');   
end
disp('change sattae');
disp(handles.state);
guidata(hObject, handles);
disp('finish update');



function numberevent_Callback(hObject, eventdata, handles)
% hObject    handle to numberevent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of numberevent as text
%        str2double(get(hObject,'String')) returns contents of numberevent as a double


% --- Executes during object creation, after setting all properties.
function numberevent_CreateFcn(hObject, eventdata, handles)
% hObject    handle to numberevent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function highest_Callback(hObject, eventdata, handles)
% hObject    handle to highest (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of highest as text
%        str2double(get(hObject,'String')) returns contents of highest as a double


% --- Executes during object creation, after setting all properties.
function highest_CreateFcn(hObject, eventdata, handles)
% hObject    handle to highest (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function lowest_Callback(hObject, eventdata, handles)
% hObject    handle to lowest (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lowest as text
%        str2double(get(hObject,'String')) returns contents of lowest as a double


% --- Executes during object creation, after setting all properties.
function lowest_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lowest (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
