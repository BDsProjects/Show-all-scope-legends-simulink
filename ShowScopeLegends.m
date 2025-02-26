function ShowScopeLegends(ModelName)

    if nargin < 1
        error('Please provide a, or the correct Simulink model name as input.');
    end
    
    % Load the model if it's not already open
    if ~bdIsLoaded(ModelName)
        load_system(ModelName);
    end

    % Find all Scope blocks in the model
    scopeBlocks = find_system(ModelName, 'BlockType', 'Scope');

    % Loop through each Scope block and enable the legend
    for i = 1:length(scopeBlocks)
        set_param(scopeBlocks{i}, 'ShowLegend', 'on');
    end

    % Save the model
    save_system(ModelName);
    
    % Display confirmation message
    fprintf('Legends enabled for all Scope blocks in "%s".\n', <ModelName);

    % Call with ShowScopeLegends('Your_Model_Name')
    % It is not necessary to include the .slx after the model name.

end