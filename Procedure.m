% function drawing the cues and returning the VBLTimestamp
function [tar_VBL, tar_SOT, tar_FT] = Procedure(wPtr, trial_SOT, cue_condition, target_condition, center_x, center_y)
    s = 0;
    switch cue_condition
        case 0
            s = s + 0.2;
        case 1
            s = s + 0;
            Screen('DrawLine', wPtr, [0 0 0], center_x-510, center_y+30, center_x-450, center_y-30, 5)
            Screen('DrawLine', wPtr, [0 0 0], center_x-510, center_y-30, center_x-450, center_y+30, 5)
            [~, cued_SOT, ~] = Screen('Flip',wPtr, trial_SOT, 2);
            [~, cued_SOT, ~] = Screen('Flip',wPtr, cued_SOT + 0.2, 1);
            trial_SOT = cued_SOT;
        case 2
            s = s + 0;
            Screen('DrawLine', wPtr, [0 0 0], center_x+450, center_y+30, center_x+510, center_y-30, 5)
            Screen('DrawLine', wPtr, [0 0 0], center_x+450, center_y-30, center_x+510, center_y+30, 5)
            [~, cued_SOT, ~] = Screen('Flip',wPtr, trial_SOT, 2);
            [~, cued_SOT, ~] = Screen('Flip',wPtr, cued_SOT+0.2, 1);
            trial_SOT = cued_SOT;
    end
    
    switch target_condition
        case 1
            Screen('TextFont',wPtr, 'Courier');
            Screen('TextSize',wPtr, 50);
            Screen('TextStyle', wPtr, 1);
            Screen('DrawText', wPtr, 'GO', center_x-510, center_y-15, [0 0 0]);
            [tar_VBL, tar_SOT, tar_FT] = Screen('Flip', wPtr, trial_SOT + s + 0.5, 1);
        case 2
            Screen('TextFont',wPtr, 'Courier');
            Screen('TextSize',wPtr, 50);
            Screen('TextStyle', wPtr, 1);
            Screen('DrawText', wPtr, 'GO', center_x+450, center_y-15, [0 0 0]);
            [tar_VBL, tar_SOT, tar_FT] = Screen('Flip', wPtr, trial_SOT + s + 0.5, 1);
    end

end