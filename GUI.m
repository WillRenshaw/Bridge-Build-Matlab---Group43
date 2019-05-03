%group 43 coursework

function varargout = GUI(varargin)
% GUI MATLAB code for GUI.fig
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
%      applied to the GUI before GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI

% Last Modified by GUIDE v2.5 24-Apr-2019 17:10:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
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
end

% --- Executes just before GUI is made visible.
function GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI (see VARARGIN)

% Choose default command line output for GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);

clear
clc
%Precalculated values for sin and cos theta

end

% --- Outputs from this function are returned to the command line.
function varargout = GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
end


function TensionBox_Callback(hObject, eventdata, handles)
% hObject    handle to TensionBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TensionBox as text
%        str2double(get(hObject,'String')) returns contents of TensionBox as a double
end

% --- Executes during object creation, after setting all properties.
function TensionBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TensionBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

end

function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double
end

% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double
end

% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function edit410x10x160Box_Callback(hObject, eventdata, handles)
% hObject    handle to edit410x10x160Box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit410x10x160Box as text
%        str2double(get(hObject,'String')) returns contents of edit410x10x160Box as a double
end

% --- Executes during object creation, after setting all properties.
function edit410x10x160Box_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit410x10x160Box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

% --- Executes on button press in CalculateFailure.
function CalculateFailure_Callback(hObject, eventdata, handles)
    s = sin(atan(1.25)); %Values for sin and cos theta
    c = cos(atan(1.25));

    %The names of all unknown forces
    names = ["F1";"F2";"F3";"F4";"F5";"F6";"F7";"F8";"F9";"F10";"F11";"F12";"F13";"F14";"F15";"F16";"F17";"F18";"F19";"F20";"F21";"Rx1";"Ry1";"Rx2";"Ry2"];
    %names of all members corresponding to forces
    memberNames = ["AB";"AC";"BC";"BD";"BE";"CE";"DE";"DF";"DG";"EG";"FG";"FH";"GH";"GI";"HI";"HJ";"IJ";"IK";"JK";"JL";"KL";];
    %Matrix containing all simultaenous equations
    A = [c	1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	0	0
    s	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	0
    -c	0	0	1	c	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
    -s	0	-1	0	-s	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
    0	-1	0	0	0	1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
    0	0	1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
    0	0	0	-1	0	0	0	1	c	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
    0	0	0	0	0	0	-1	0	-s	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
    0	0	0	0	-c	-1	0	0	0	1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
    0	0	0	0	s	0	1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
    0	0	0	0	0	0	0	-1	0	0	0	1	0	0	0	0	0	0	0	0	0	0	0	0	0
    0	0	0	0	0	0	0	0	0	0	-1	0	0	0	0	0	0	0	0	0	0	0	0	0	0
    0	0	0	0	0	0	0	0	-c	-1	0	0	c	1	0	0	0	0	0	0	0	0	0	0	0
    0	0	0	0	0	0	0	0	s	0	1	0	s	0	0	0	0	0	0	0	0	0	0	0	0
    0	0	0	0	0	0	0	0	0	0	0	-1	-c	0	0	1	0	0	0	0	0	0	0	0	0
    0	0	0	0	0	0	0	0	0	0	0	0	-s	0	-1	0	0	0	0	0	0	0	0	0	0
    0	0	0	0	0	0	0	0	0	0	0	0	0	-1	0	0	c	1	0	0	0	0	0	0	0
    0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	s	0	0	0	0	0	0	0	0
    0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	-1	-c	0	0	c	0	0	0	0	0
    0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	-s	0	-1	-s	0	0	0	0	0
    0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	-1	0	0	1	0	0	0	0
    0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	0	0	0	0	0
    0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	-c	-1	0	0	-1	0
    0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	s	0	0	0	0	1];

    af = 2 * str2num(get(handles.TensionBox, 'String'));%Failure load for members in tension
    bf = str2num(get(handles.edit2, 'String'));%Failure load for 10x6x125
    cf = str2num(get(handles.edit3, 'String'));%Failure load for 10x10x100
    df = str2num(get(handles.edit410x10x160Box, 'String'));%Failure load for 10x10x160
    breakingLoads = [df,af,af,cf,af,af,bf,cf,af,af,bf,cf,af,af,bf,cf,af,af,af,df,af,99999999,9999999,99999999,9999999]; %Vector containing all failure loads for all members

    
    %Initial variable set up
    solved = false;
    load = 0;
    f = get(handles.DecimalPlacesBox, 'String'); %get value of decimal point box
    step = 10^(-1 * str2num(f{get(handles.DecimalPlacesBox,'Value')})); %set step based on desired decimal places
    while (solved == false) %Loop through until solved
        load = load + step; %increment load on each loop iteration
        IL = load/10; %Calculate the individual load of each loading point
        b = [0;0;0;0;0;IL;0;0;0;IL;0;0;0;IL;0;0;0;IL;0;0;0;IL;0;0]; %Output vector
        x = A\b; %solve for unknown forces
        if(max(max(x > abs(breakingLoads)) ~= 0)) %calculate if any values exceed the relevant breaking load
            solved = true; %If so stop the loop
            [~, idx] = max(max(x > abs(breakingLoads))); %get the index of the broken member
            disp(["Broken Member is ", memberNames(idx), ' when force', names(idx), ' reached a load of ',load - step, 'N']); %display to console
            %change value of outputbox on gui to show result
            set(handles.edit5, 'String', strcat("Broken Member is ", memberNames(idx), ' when force '," ", names(idx), ' reached a load of:  ',num2str(load - step), 'N'));
        end
    end
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double

end
% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


% --- Executes on selection change in DecimalPlacesBox.
function DecimalPlacesBox_Callback(hObject, eventdata, handles)
% hObject    handle to DecimalPlacesBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns DecimalPlacesBox contents as cell array
%        contents{get(hObject,'Value')} returns selected item from DecimalPlacesBox

end
% --- Executes during object creation, after setting all properties.
function DecimalPlacesBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DecimalPlacesBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end
