
k=0;
threshold = 0.2; % calculate the time which the sensor sees the crack wave (using threshold crossing method)
filterthresh = 0.25; % this is to filter out the channels without any value exceeding the threshold values

foo={['' char(13) '']};%damn it

formatss  = '%s%s%s%s%s%s%s%s';

fd = fopen('08-18-virgin-wave.txt','rt','n','UTF-8');
M = textscan(fd,'%f %f %f %f',1,'Delimiter','\t');
max_event=M{2};


filename = 'C:\Zhe\4-sample wave file\Filtered_waves\08_18_virgin.xlsx';



result=zeros(max_event*2,9);

result_count=1;



while ~feof(fd)
    
       
        oneevent=cell(2048,8);
        missed=0;
        row_count=1;
        col_count=1;
        
            %-----------  scan the waveform text file  ------------
        C = textscan(fd,formatss,2048,'Delimiter','\t	');
        for row=1:size(C{1},1)
            for col=1:size(C,2)   
                if size(cell2mat(C{1,col}(row)),1)==0 || str2double(C{1,col}(row))>1 || isequal(C{1,col}(row),foo(1)) || isequal(C{1,col}(row),{''})
                    missed=missed+1;
                    continue;
                end
                
                oneevent{row_count,col_count}=C{1,col}(row);
                if col_count==8
                    row_count=row_count+1;
                    col_count=1;
                else
                    col_count=col_count+1;
                end
                
            end
        end
        
    while missed>0
        C = textscan(fd,'%s',1,'Delimiter','\t	');
        if size(cell2mat(C{1}),1)==0 || str2double(C{1})>1
            continue;
        end
        
        oneevent{row_count,col_count}=C{1};
        missed=missed-1;
        
        if col_count==8
            row_count=row_count+1;
            col_count=1;
        else
            col_count=col_count+1;
        end
        
    end

        k=k+1;
        
             
        

        
        
              
        % increment the event counter
        disp(k);
        
        

        %-----------  initialize the data matrices  ------------
        max=[0,0,0,0,0,0,0,0]; % record the maximum value of each channel
        recvt=[1,2,3,4,5,6,7,8;0,0,0,0,0,0,0,0]; % received time of each channel
        pass=[0,0,0,0,0,0,0,0]; % filter the channel
        
        count=0;
        %-----------  inner loop, loop through the 8 channels, and 2048 sampled datas to fill in the above matrices  ------------
        for i=1:8
            for j=1:2048
                if isnan(str2double(oneevent{j,i}))==0
                    temp = abs(str2double(oneevent{j,i}));
                    if temp>max(i)
                        max(i) = temp;
                        
                    end
                    if temp>threshold && recvt(2,i)==0
                        count=count+1;
                        recvt(2,i)=j;
                        continue;
                    end   

                    
                end

                
            end
        end


%-----------  if only less than 4 sensors meet the filtering requirements, we disgard this set of data, continue to the next event  ------------
        if count <= 4
            continue;
        end
%         sortedtime=[1,2,3,4,5,6,7,8;0,0,0,0,0,0,0,0];
%         timeindex=[0,0,0,0,0;0,0,0,0,0];
        [d1,d2] = sort(recvt(2,:));
        recvt=recvt(:,d2);
%-----------  TT is the time which the sensor receives the crack singals, NN is the number of sensor which sees the crack signal  ------------
        TT=zeros(count,1)';
        NN=zeros(count,1)';
%-----------  position in the TT matrix matches with position in the NN matrix  ------------
%-----------  i.e. TT = [12, 10, 8, 22], NN = [1 3 5 6], means sensor 1 receives the signal at 12 us  ------------
%-----------  sensor 3 receives signal at 10 us, sensor 5 receives signal at 8 us, sensor 6 receives at 22 us  ------------

         disp(recvt);
%-----------  sort the previous results, store the sorted results into TT and NN  ------------        
        %sortedrecvt= sort(recvt,'ascend');
   
        n=1;
        for zz=1:8
           if recvt(2,zz)~=0
               NN(n)=recvt(1,zz);
               TT(n)=recvt(2,zz);
               n=n+1;
           end
           
     
                   
        end
        
%         [d1,d2] = sort(timeindex(1,:));
%         timeindex=timeindex(:,d2);
%         
%         NN=timeindex(1,:);
%         TT=timeindex(2,:);

        
    disp('NN :');
    disp(NN);
        
    disp('TT:');
    disp(TT);
    
        
        
    
    result(result_count,1)=k;
    result(result_count,2:(count+1))=NN(1:count);
    result(result_count+1,1)=NaN;
    result(result_count+1,2:(count+1))=TT(1:count);
    
    result_count=result_count+2;
    
%     oneevent=[];
    clear oneevent;
    
    if k==max_event
       break; 
    end
end
result(result_count:size(result,1),:)=[];
xlswrite(filename,result);