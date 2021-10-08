function [fid, answer] = subject()

    prompt = {'Subject number:','age:', 'Handedness:', 'gender:'};
    name = 'Subject information';
    numlines = 1;
    defaultanswer = {'00','20', 'right', 'female'};
    
    answer=inputdlg(prompt, name, numlines, defaultanswer);
    
    % add the subject number to the filename:
    filename1 = sprintf('Project_%s.txt', answer{1});

    % add a path to the filename:
    filename2 = sprintf('%s\\%s', cd, filename1);

    % open file to write data into it:
    fid = fopen(filename2, 'w');
end