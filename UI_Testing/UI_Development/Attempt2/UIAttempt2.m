function varargout = UIAttempt2(varargin)
% UIATTEMPT2 MATLAB code for UIAttempt2.fig
%      UIATTEMPT2, by itself, creates a new UIATTEMPT2 or raises the existing
%      singleton*.
%
%      H = UIATTEMPT2 returns the handle to a new UIATTEMPT2 or the handle to
%      the existing singleton*.
%
%      UIATTEMPT2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UIATTEMPT2.M with the given input arguments.
%
%      UIATTEMPT2('Property','Value',...) creates a new UIATTEMPT2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before UIAttempt2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to UIAttempt2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help UIAttempt2

% Last Modified by GUIDE v2.5 06-Sep-2021 15:09:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @UIAttempt2_OpeningFcn, ...
                   'gui_OutputFcn',  @UIAttempt2_OutputFcn, ...
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


% --- Executes just before UIAttempt2 is made visible.
function UIAttempt2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to UIAttempt2 (see VARARGIN)

% Choose default command line output for UIAttempt2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes UIAttempt2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = UIAttempt2_OutputFcn(hObject, eventdata, handles) 
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
handles.folder = uigetdir('C:\');
guidata(hObject,handles);


% --- Executes on button press in run_butt_id.
function run_butt_id_Callback(hObject, eventdata, handles)
% hObject    handle to run_butt_id (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.folder;
call_segmentation_feat_extraction(hObject, eventdata, handles);
confusion_met=SVM();

set(handles.uitable1,'Data',confusion_met);


%--- Call segmentation algorithm
function call_segmentation_feat_extraction(hObject, eventdata, handles)
seg_algo=get(handles.seg_menu_id,'SelectedObject');
seg_algo=get(seg_algo,'Tag');

feaext_algo=get(handles.fea_extrac_id,'SelectedObject');
feaext_algo=get(feaext_algo,'Tag');

folder_name=handles.folder;

if seg_algo=="reg_grow_id"
    if feaext_algo=="glcm_id"
        regionGrowingGLCM(folder_name);
    else
        regionGrowingLESH(folder_name);
    end
else
    if feaext_algo=="glcm_id"
        hammoucheGLCM(folder_name);
    else
        hammoucheLESH(folder_name);
    end
end
