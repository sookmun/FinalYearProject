%%https://www.youtube.com/watch?v=9c6fOV8_JI0
%%https://www.youtube.com/watch?v=zyxi_1OyZ2I

function varargout = test1_arithmic(varargin)
% TEST1_ARITHMIC MATLAB code for test1_arithmic.fig
%      TEST1_ARITHMIC, by itself, creates a new TEST1_ARITHMIC or raises the existing
%      singleton*.
%
%      H = TEST1_ARITHMIC returns the handle to a new TEST1_ARITHMIC or the handle to
%      the existing singleton*.
%
%      TEST1_ARITHMIC('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TEST1_ARITHMIC.M with the given input arguments.
%
%      TEST1_ARITHMIC('Property','Value',...) creates a new TEST1_ARITHMIC or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before test1_arithmic_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to test1_arithmic_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help test1_arithmic

% Last Modified by GUIDE v2.5 05-Sep-2021 13:36:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @test1_arithmic_OpeningFcn, ...
                   'gui_OutputFcn',  @test1_arithmic_OutputFcn, ...
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


% --- Executes just before test1_arithmic is made visible.
function test1_arithmic_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to test1_arithmic (see VARARGIN)

% Choose default command line output for test1_arithmic
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes test1_arithmic wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = test1_arithmic_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in ans_butt_id.
function ans_butt_id_Callback(hObject, eventdata, handles)
% hObject    handle to ans_butt_id (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val1=str2double(get(handles.val1_id,'String'));
val2=str2double(get(handles.val2_id,'String'));

answer=multiple(val1,val2);
val1
val2
set(handles.rep_id,'String',answer);



function val1_id_Callback(hObject, eventdata, handles)
% hObject    handle to val1_id (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of val1_id as text
%        str2double(get(hObject,'String')) returns contents of val1_id as a double


% --- Executes during object creation, after setting all properties.
function val1_id_CreateFcn(hObject, eventdata, handles)
% hObject    handle to val1_id (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function val2_id_Callback(hObject, eventdata, handles)
% hObject    handle to val2_id (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of val2_id as text
%        str2double(get(hObject,'String')) returns contents of val2_id as a double


% --- Executes during object creation, after setting all properties.
function val2_id_CreateFcn(hObject, eventdata, handles)
% hObject    handle to val2_id (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when selected object is changed in met_menu_id.
function met_menu_id_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in met_menu_id 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
