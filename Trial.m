function Output = Trial(definput)


list = {'6T','8T','10T'};
c = listdlg('PromptString',{'Select a file.',...
    'Only one file can be selected at a time.',''},...
    'SelectionMode','single','ListString',list);
%f = listdlg('ListString', ...
    %        {'John Smith' ...
     %        sprintf('Cecelia\nPayne-Gaposchkin') ...
      %       'Gina Peters'});
z = list(c);
chr = char(z);
%d = cell2mat(c);
%d = num2str(c);
%model = listdlg('What do you want to perform', 'Select',...
                %'Summation','Subtraction','c');
            
switch chr
    case '6T'
        disp('Will perform summation')
        per=1;
        
    case '8T'
        disp('Will perform subtraction');
        per=2;
        
   
        
end

if per ==1
    disp('Performing simulaion')
    inputdata = {'first number','second number'};
    dlgtitle = 'Summation';
    definput = {'10','2'};
    
    data = inputdlg(inputdata,dlgtitle, [1 50],definput);

    a = str2num(data{1});
    b = str2num(data{2});
    output = a+b
end  
end

        
    