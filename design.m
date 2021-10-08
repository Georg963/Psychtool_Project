function [cue_condition, target_condition, blank_period] = design()

    %Design:    
    % Cue conditions:
    % 0 = neutral/uncued (no X)
    % 1 = left cue (left X)
    % 2 = right cue (right X)

    % Target conditions:
    % 1 = go signal left
    % 2 = go signal right
    
    %cued trials: first you will see a cue, then the go signal
    %uncued trials: you will see only the go signal. the duration of the whole trial is the same as
    %in the cued condition. sucht that the trial types are comparible in terms
    %of timing. after the response, there is a 300 ms blank period until the next trial,
    %this is intertrial interval. if you do not press a button within 2 seconds, a new trial will be
    %started. Press escape to end the experiment
    
    blank_period = 0.3;
    
    %uncued and cued-trials: 50:50
    %of cued-trials: 80:20 valid/invalid cued trials
    
    %Minimum design:
    % 10 uncued - 10 cued trials
    % of cued trials: 4/5 valid - 1/5 invalid

    cues = [zeros(1,10), zeros(1,5)+1, zeros(1,5)+2];
    targets = [zeros(1,5)+1, zeros(1,5)+2, zeros(1,4)+1, zeros(1,1)+2, zeros(1,1)+1, zeros(1,4)+2];
    
    %cue1 = [cues cues];
    %targets1 = [targets targets];
        
    % randomize trial presentation order 
    % (e.g., only the minimum balanced design with 20 trials)
    % (if you like to have a longer experiment, take the scaled vectors cue_condition1 and target_condition1)
    new_order = randperm(length(cues));
    cue_condition = cues(new_order);
    target_condition = targets(new_order); 
end