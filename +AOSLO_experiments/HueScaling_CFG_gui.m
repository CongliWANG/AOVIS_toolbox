function CFG = HueScaling_CFG_gui()
    % CFG = HueScaling_CFG_gui()
    %
    % Get experimental parameters (CFG).
    
    import AOSLO_experiments.*
    
    CFG = AOSLO_experiments.HueScaling_CFG_load();
    
    %  Construct the components
    
    % ---- Figure handle
    f = figure('Visible','on','Name','parameters',...
            'Position',[500, 500, 550, 385], 'Toolbar', 'none');
    
    % ---- Panel
    ph = uipanel('Parent',f, 'Title', 'Experiment parameters',...
            'Position',[.05 .05 .9 .9]);

    % ---- Text boxes
    uicontrol(ph,'Style','text',...
                'String','Subject ID',...
                'Units','normalized',...
                'Position',[.05 .9 .25 .10]);
            
    subject_ID = uicontrol(ph,'Style','edit',...
            'Units','normalized',...
            'String', CFG.initials,...
            'Position', [.05 .85 .25 .10]);

    uicontrol(ph,'Style','text',...
                'String','pupil size (mm)',...
                'Units','normalized',...
                'Position', [.05 .75 .25 .10]);
            
    pupilsize = uicontrol(ph,'Style','edit',...
            'Units','normalized',...
            'String', num2str(CFG.pupilsize),...
            'Position', [.05 .7 .25 .10]); 
        
    uicontrol(ph,'Style','text',...
                'String','video prefix',...
                'Units','normalized',...
                'Position',[.05 .6 .25 .10]);
            
    vidprefix = uicontrol(ph,'Style','edit',...
            'Units','normalized',...
            'String', '',...
            'Position', [.05 .55 .25 .10]); 
        
    uicontrol(ph,'Style','text',...
                'String','Fieldsize (deg)',...
                'Units','normalized',...
                'Position',[.35 .9 .25 .10]);
            
    fieldsize = uicontrol(ph,'Style','edit',...
            'Units','normalized',...
            'String', num2str(CFG.fieldsize),...
            'Position', [.35 .85 .25 .10]);

    uicontrol(ph,'Style','text',...
                'String','flash dur (msec)',...
                'Units','normalized',...
                'Position',[.35 .75 .25 .10]);
            
    presentdur = uicontrol(ph,'Style','edit',...
            'Units','normalized',...
            'String', num2str(CFG.presentdur),...
            'Position', [.35 .7 .25 .10]); 

    uicontrol(ph,'Style','text',...
                'String','# trials',...
                'Units','normalized',...
                'Position',[.35 .6 .25 .10]);
            
    ntrials = uicontrol(ph,'Style','edit',...
            'Units','normalized',...
            'String', num2str(CFG.ntrials),...
            'Position', [.35 .55 .25 .10]); 

        
    uicontrol(ph,'Style','text',...
                'String','gain',...
                'Units','normalized',...
                'Position',[.65 .9 .25 .10]); 
            
    gain = uicontrol(ph,'Style','edit',...
            'Units','normalized',...
            'String', num2str(CFG.gain),...
            'Position', [.65 .85 .25 .10], ...
            'Enable', 'Inactive', ...
            'ButtonDownFcn', @get_cal_file);

    uicontrol(ph,'Style','text',...
                'String','stim size (pix)',...
                'Units','normalized',...
                'Position',[.65 .75 .25 .10]);
            
    stimsize = uicontrol(ph,'Style','edit',...
            'Units','normalized',...
            'String', num2str(CFG.stimsize),...
            'Position', [.65 .7 .25 .10]); 
        
    uicontrol(ph,'Style','text',...
                'String','comment',...
                'Units','normalized',...
                'Position',[.65 .6 .25 .10]);
            
    comment = uicontrol(ph,'Style','edit',...
            'Units','normalized',...
            'String', CFG.comment,...
            'Position', [.65 .55 .25 .10]);
        
        
    % ---- Radio buttons
    uicontrol(ph,'Style','text',...
            'String','stim shape',...
            'Units','normalized',...
            'Position',[.05 .45 .25 .07]);  
        
    stimshape = uibuttongroup(ph, 'Units','Normalized', ...
        'Position', [.05 .3 .25 .15]);
    
    uicontrol('Style','Radio', 'Parent', stimshape, ...
        'HandleVisibility','off', ...
        'Units','Normalized', ...
        'Position', [.1 .6 .8 .35], ...
        'String','square', 'Tag','square');

    uicontrol('Style','Radio', 'Parent', stimshape, ...
        'HandleVisibility','off', ...
        'Units','Normalized', ...
        'Position',  [.1 .1 .8 .35], ...
        'String','circle', 'Tag','circle');
    
    uicontrol(ph,'Style','text',...
                'String','cone selection',...
                'Units','normalized',...
                'Position',[.35 .45 .25 .07]);
            
    cone_selection = uibuttongroup(ph, 'Units','Normalized', ...
        'Position', [.35 .3 .25 .15]);
    
    uicontrol('Style','Radio', 'Parent', cone_selection, ...
        'HandleVisibility','off', ...
        'Units','Normalized', ...
        'Position', [.1 .6 .8 .35], ...
        'String','auto', 'Tag', 'auto');
    
    uicontrol('Style','Radio', 'Parent', cone_selection, ...
        'HandleVisibility','off', ...
        'Units','Normalized', ...
        'Position',  [.1 .1 .8 .35], ...
        'String','manual', 'Tag', 'manual');

            
    % ---- TCA Panel
    
    tcapanel = uipanel('Parent',f, 'Title', 'TCA',...
            'Position',[.6 .2 .3 .3]);
        
    
    uicontrol(tcapanel,'Style','text',...
                'String','X',...
                'Units','normalized',...
                'Position', [.4 .85 .1 .15]);
            
    uicontrol(tcapanel,'Style','text',...
                'String','Y',...
                'Units','normalized',...
                'Position', [.68 .85 .1 .15]);
            
    uicontrol(tcapanel,'Style','text',...
                'String','red',...
                'Units','normalized',...
                'Position', [.05 .6 .2 .15]); 
            
    uicontrol(tcapanel,'Style','text',...
                'String','green',...
                'Units','normalized',...
                'Position', [.05 .2 .2 .15]);  
            
    red_x_offset = uicontrol(tcapanel,'Style','edit',...
                'Units','normalized',...
                'String', CFG.red_x_offset,...
                'Position', [.3 .5 .3 .3]);

    red_y_offset = uicontrol(tcapanel,'Style','edit',...
                'Units','normalized',...
                'String', CFG.red_y_offset,...
                'Position', [.6 .5 .3 .3]);
            

    green_x_offset = uicontrol(tcapanel,'Style','edit',...
                'Units','normalized',...
                'String', CFG.green_x_offset,...
                'Position', [.3 .1 .3 .3]);

    green_y_offset = uicontrol(tcapanel,'Style','edit',...
                'Units','normalized',...
                'String', CFG.green_y_offset,...
                'Position', [.6 .1 .3 .3]);
            
    % ---- Buttons
    uicontrol(ph,'Style','pushbutton','String','start',...
            'Units','normalized',...
            'Position', [.35 .05 .25 .15], ...
            'Callback', 'uiresume(gcbf)');

%     uicontrol(ph,'Style','pushbutton','String','plot stimuli',...
%             'Units','normalized',...
%             'Position', [.05 .05 .25 .15], ...
%             'Callback', @plot_stimuli);
        
    uiwait(f);
    
    get_current_CFG();
    
    function get_current_CFG()
        CFG.subject = get(subject_ID,'String');
        CFG.stimshape = get(get(stimshape, 'SelectedObject'), 'Tag');
        CFG.cone_selection = get(get(cone_selection, 'SelectedObject'), 'Tag');
        CFG.fieldsize = str2double(get(fieldsize,'String'));
        CFG.presentdur = str2double(get(presentdur,'String'));
        CFG.pupilsize = str2double(get(pupilsize,'String'));
        CFG.ntrials = str2double(get(ntrials,'String'));
        CFG.gain = get(gain,'String');
        CFG.stimsize = str2double(get(stimsize,'String'));
        
        CFG.red_x_offset = str2double(get(red_x_offset,'String'));
        CFG.red_y_offset = str2double(get(red_y_offset,'String'));
        CFG.green_x_offset = str2double(get(green_x_offset,'String'));
        CFG.green_y_offset = str2double(get(green_y_offset,'String'));
        
        CFG.comment = get(comment,'String');
        

    end

    close(f);

end