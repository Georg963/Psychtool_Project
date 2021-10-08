function [key, RT, escape] = Response(target_SOT)
    % Enable unified mode of KbName, so KbName accepts identical key names on
    % all operating systems:
    KbName('UnifyKeyNames');
    
    while 1
        s = GetSecs;
        if s <= target_SOT + 2
            rightKey = KbName('RightArrow');
            leftKey = KbName('LeftArrow');
            escapeKey = KbName('ESCAPE');
            
            [keyIsDown, secs, keyCode, ~] = KbCheck;
            if keyIsDown
                if keyCode(leftKey) || keyCode(rightKey)
                    escape = 0;
                    key = KbName(keyCode); % unified key name
                    RT = secs-target_SOT; % in seconds
                    break
                elseif keyCode(escapeKey)
                    escape = 1;
                    key="escape key was pressed";
                    RT=-1;
                    break
                end
            end
        else
            escape = 0;
            key="no key was pressed";
            RT=secs-target_SOT;
            break
        end
    end
end