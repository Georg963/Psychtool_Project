function [wRect, wPtr] = openWindow()
    % opens the main window as onscreen
    % size:   full size
    % background color:  default white
    [wPtr, wRect]=Screen('OpenWindow',0);
end