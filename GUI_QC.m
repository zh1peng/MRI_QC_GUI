function varargout = GUI_QC(varargin)

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_QC_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_QC_OutputFcn, ...
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


% --- Executes just before GUI_QC is made visible.
function GUI_QC_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_QC (see VARARGIN)

% Choose default command line output for GUI_QC
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
global clickcount tmp tmp2
clickcount=-1;
% tmp=load('words');
tmp2=load('score')

% UIWAIT makes GUI_QC wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_QC_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Next.
function Next_Callback(hObject, eventdata, handles)

global clickcount tmp tmp2 n

clickcount=clickcount+1;
if clickcount==0
set(hObject,'String','Next!');
end
n=str2num(get(handles.startnum,'String'))+clickcount;

k=mod(n,50);
if k==0
   save('tmp','tmp2', 'n');
end

strr1=tmp2.score{n,1};
path=get(handles.filepath,'String');
filetype1=get(handles.filetype,'SelectedObject');
filetype2=get(filetype1,'String');

subfile=fullfile(path,strr1,filetype2);
strr=['You are working on No.', num2str(n),' subject.  ',...
 'ID is ',strr1,'. ', 'Dir is ', subfile, '.'];
set(handles.info, 'String', strr)


% strr2=tmp.words{n};
% set(handles.blackboard,'String', strr2);


xjview(subfile)
spm_orthviews('Xhairs','off');











    


% --- Executes on button press in confirm.
function confirm_Callback(hObject, eventdata, handles)
% hObject    handle to confirm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Qc_result n tmp2
select=get(handles.QC,'SelectedObject');
Qc_result=get(select,'String');
tmp2.score(n,2)=cellstr(Qc_result);
h=figure(1);
close(h);



% --- Executes on button press in stop.
function stop_Callback(hObject, eventdata, handles)
global tmp2 n
if get(handles.stop,'Value')==1
    save('saved_results','tmp2', 'n');
end




function bad_Callback(hObject, eventdata, handles)

function tiny_Callback(hObject, eventdata, handles)

function good_Callback(hObject, eventdata, handles)

function type1_Callback(hObject, eventdata, handles)

function type2_Callback(hObject, eventdata, handles)



function startnum_Callback(hObject, eventdata, handles)

function startnum_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function filepath_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function filepath_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
