function [] = savedata(fid, answer, trial, cue, target , ReactionTime, keyPressed)

    id = str2num(answer{1});
    age = str2num(answer{2});
    hand = answer{3};
    gender = answer{4};
    rt = round(ReactionTime * 1000);
    
    %response = 0 if no key was pressed
    %response = 1 if Key = LeftArrow 
    %response = 2 if Key = RightArrow
    response = 0;
    if strcmp(keyPressed, 'LeftArrow') == 1
        response = 1;
    elseif strcmp(keyPressed, 'RightArrow') == 1
        response = 2;
    end

    %trialtype : valid/invalid/neutral
    %0 = neutral (uncued), 1=valid(cued), 2=invalid(cued)
    trialType = 2;
    if cue == target
        trialType = 1;
    elseif cue == 0
        trialType = 0;
    end
    
    %accuracy
    accuracy = 0;
    if response == target
        accuracy = 1; 
    end
    
    fprintf(fid, '%d %d %s %s %d %d %d %d %d %d %d \n' , ...
        id, age, hand, gender, trial, cue, target, ...
        trialType, response, rt, accuracy);
end