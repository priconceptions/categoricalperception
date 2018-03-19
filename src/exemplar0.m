function [  arrOfMatrices ] = exemplar0(  file , c, r )
%EXEMPLAR0: Initial attempt at coding the exemplar model
%for each trial in data_sequence
%   Each matrix contains the columns:
%   (model classified type) (subject classified type) (actual type)
% when classifying a new object, the model uses previos examples to
% classify it as category A or category B.

AllData = load(file);
arrOfMatrices = {};
for i = 1:length(AllData.data_sequence)
    % traverse through rows
    for j = 1:size(AllData.data_sequence{i}.trial_sequence_array,1)
        type = 0;
        sim_to_A = 0;
        sim_to_B = 0;
        rowArr = AllData.data_sequence{i}.trial_sequence_array(j,[5,6]);
        if j == 1
            sim_to_A = 0;
            sim_to_B = 0;
            type = 1; % arbitrarily placed the first to type A
        end
        % go through all previous "seen" exemplars
        for k = 1:j-1
            if AllData.data_sequence{i}.trial_sequence_array(k,7) == 1
                sim_to_A = sim_to_A + exp(-1*c * minkowski_distance(AllData.data_sequence{i}.trial_sequence_array(k,[5,6]), rowArr, r));
            else
                sim_to_B = sim_to_B + exp(-1*c * minkowski_distance(AllData.data_sequence{i}.trial_sequence_array(k,[5,6]), rowArr, r));
            end
        end
        if (sim_to_B > sim_to_A)
            % the point is of type B
            type = 2;
        else
            type = 1;
        end
        mat(j,1) = type; %prototype
        mat(j,2) =  AllData.data_sequence{i}.trial_sequence_array(j,8); %subject
        mat(j,3) = AllData.data_sequence{i}.trial_sequence_array(j,7); %actual

            
    end
    arrOfMatrices{end+1} = mat;
end


end

