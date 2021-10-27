%% Define Block Dialog Tabs, Sections, and Order of Properties
% This example customizes the block dialog box for the |MultipleGroupsWithTabs| MATLAB System block by
% specifying property display names and modifying the
% |getPropertyGroupImpl| method.
classdef SODefineBlockDialogTabsExample < matlab.System
    % MultipleGroupsWithTabs Customize block dialog with multiple tabs and parameter groups.
    
    % Public, tunable properties
    properties
        %StartValue Start Value
        Technology = 0
        
        %EndValue End Value
        EndValue = 10
        
        Threshold = 1
        
        %BlockLimit Limit
        BlockLimit = 55
    end
    % Public Nontunable 
    properties(Nontunable)
        %IC1 First initial condition
        IC1 = 0
        
        %IC2 Second initial condition
        IC2 = 10
        
        %IC3 Third initial condition
        IC3 = 100

        %UseThreshold Use threshold
        UseThreshold (1,1) logical = true
    end
    
    methods (Static, Access = protected)
        function groups = getPropertyGroupsImpl
            % Section to always display above any tabs.
            alwaysSection = matlab.system.display.Section(...
                'Title','','PropertyList',{'BlockLimit'});
           
            % Group with no sections
            initTab = matlab.system.display.SectionGroup(...
                'Title','Initial conditions', ...
                'PropertyList',{'IC1','IC2','IC3'});
            
            % Section for the value parameters
            valueSection = matlab.system.display.Section(...
                'Title','Value parameters',...
                'PropertyList',{'StartValue','EndValue'});
            
            % Section for the threshold parameters
            thresholdSection = matlab.system.display.Section(...
                'Title','Threshold parameters',...
                'PropertyList',{'Threshold','UseThreshold'});
            
            % Group with two sections: the valueSection and thresholdSection sections
            mainTab = matlab.system.display.SectionGroup(...
                'Title','Main', ...
                'Sections',[valueSection,thresholdSection]);
            
            % Return an array with the group-less section, the group with
            % two sections, and the group with no sections.
            groups = [alwaysSection,mainTab,initTab];
        end
    end
end

% Copyright 2018 The MathWorks, Inc.
%% Change Property Label
% To change the property label that appears on the dialog box, add comments
% before each property in this format |%PropertyName Block Dialog Label|
% with no space between the comment and the property name. For example, to
% display the |StartValue| property as *Start Value*, specify:
%
%   %StartValue Start Value 
%   StartValue = 0
%
%%
% The |MultipleGroupsWithTabs| System object in this example relabels
% each property for display in the MATLAB System block dialog.

%% Organize Dialog Box
% The |MutlitpleGroupsWithTabs| System object class defines a
% |getPropertyGroupsImpl| method. Inside the |getPropertyGroupsImpl|
% method, this example defines two tabs (section groups) and three parameter groupings (sections).
%%
%
% <include>MultipleGroupsWithTabs.m</include>
%
%% Resulting Dialog Box
%load_system('simulink/SODefineBlockDialogTabsExample')
%open_system('ShowSystemBlockDialog/MATLAB System')
%%
%
% <<../dialog1.png>>
%
%%
%
% <<../dialog2.png>>
%