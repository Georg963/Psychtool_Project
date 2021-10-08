%% Start debugging (transparent) mode:
PsychDebugWindowConfiguration

%% Skip calibrations (e.g. when using an LED labtop monitor):
% ... is ok for development and testing but should be set to 
% ... Screen('Preference', 'SkipSyncTests', 0)
% ... in real study (for maximum accuracy and reliability)
Screen('Preference', 'SkipSyncTests', 1);

% Start EXPERIMENT:
[wRect, wPtr] = openWindow();
[cue_condition, target_condition, blank_period] = design();
MaxTrial = length(target_condition);

%query the subject information via input dialogue 
%and open the according subject file for later storing the data
[fid, answer] = subject();

for trial = 1:MaxTrial
    cue = cue_condition(trial);
    target = target_condition(trial);
    
    % compute center of your screen:
    center_x = wRect(3)/2;
    center_y = wRect(4)/2;
    
    Screen('FrameRect',wPtr,[0 0 0],[center_x/2-40 center_y-40 center_x/2+40 center_y+40], 5)
    Screen('FrameRect',wPtr,[0 0 0],[center_x+440 center_y-40 center_x+520 center_y+40], 5)
    Screen('DrawLine',wPtr,[0 0 0], center_x-20, center_y, center_x+20, center_y, 5)
    Screen('DrawLine',wPtr,[0 0 0], center_x, center_y-20, center_x, center_y+20, 5)
    [trial_VBL, trial_SOT, trial_FT] = Screen('Flip', wPtr, [], 1);
    
    [tar_VBL, tar_SOT, tar_FT] = Procedure(wPtr, trial_SOT + blank_period, cue, target, center_x, center_y);
    [key, RT, escape] = Response(tar_SOT);
    
    if escape == 1
        break
    end
    
    savedata(fid, answer, trial, cue, target, RT, key);
    blankScreen(wPtr);
end

%close open file
fclose(fid);

% End experiment and close Psychtoolbox main screen:
Screen('CloseAll')
clear all;