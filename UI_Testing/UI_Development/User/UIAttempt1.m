function varargout = UIAttempt1(varargin)
% UIATTEMPT1 MATLAB code for UIAttempt1.fig
%      UIATTEMPT1, by itself, creates a new UIATTEMPT1 or raises the existing
%      singleton*.
%
%      H = UIATTEMPT1 returns the handle to a new UIATTEMPT1 or the handle to
%      the existing singleton*.
%
%      UIATTEMPT1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UIATTEMPT1.M with the given input arguments.
%
%      UIATTEMPT1('Property','Value',...) creates a new UIATTEMPT1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before UIAttempt1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to UIAttempt1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help UIAttempt1

% Last Modified by GUIDE v2.5 06-Sep-2021 08:46:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @UIAttempt1_OpeningFcn, ...
                   'gui_OutputFcn',  @UIAttempt1_OutputFcn, ...
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


% --- Executes just before UIAttempt1 is made visible.
function UIAttempt1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to UIAttempt1 (see VARARGIN)

% Choose default command line output for UIAttempt1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes UIAttempt1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = UIAttempt1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in browse_id.
function browse_id_Callback(hObject, eventdata, handles)
% hObject    handle to browse_id (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile('*.*', 'Pick a MATLAB code file');
if isequal(filename,0) || isequal(pathname,0)
   disp('User pressed cancel')
else
   filename=strcat(pathname,filename);
   img=imread(filename);
   %imshow(ig);
   handles.img=img;
   guidata(hObject,handles);
   %imshow(handles.in_img);
end


% --- Executes on button press in runSVM_id.
function runSVM_id_Callback(hObject, eventdata, handles)
% hObject    handle to runSVM_id (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
seg_algo=get(handles.seg_menu_id,'SelectedObject');
seg_algo=get(seg_algo,'String')

img=handles.img;
imshow(img);
switch seg_algo
    case'Hammouche Algorithm'
        handles.seg_img=segmenta(img)
        guidata(hObject,handles);
    case 'Region Growing'
        handles.seg_img=RegionGrowing(img)
        guidata(hObject,handles);
end

fea_ext_algo=get(handles.fea_extrac_id,'SelectedObject');
fea_ext_algo=get(fea_ext_algo,'String')
if fea_ext_algo=="GLCM"
    GLCM(handles.seg_img);
end


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
