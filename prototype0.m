function [ arrOfMatrices ] = prototype0( file , c, r )
%PROTOTYPE0: uses mean as the prototype and outputs a structure of matrices
%for each trial in data_sequence
%   Each matrix contains the columns:
%   (model classified type) (subject classified type) (actual type)
AllData = load(file);
arrOfMatrices = {};
for i = 1:length(AllData.data_sequence)
    % traverse through rows
    sumAVector = [0 0];
    sumBVector = [0 0];
    A_Count = 0;
    B_Count = 0;
    for j = 1:size(AllData.data_sequence{i}.trial_sequence_array,1)
        if (j == 1)
            A_mean = [0 0];
            B_mean = [0 0];
        else
            actualType = AllData.data_sequence{i}.trial_sequence_array(j-1,7); %actual
            if actualType == 1
                A_Count = A_Count + 1;
                newAVector = AllData.data_sequence{i}.trial_sequence_array(j-1,[5,6]);
                sumAVector = sumAVector + newAVector;
                A_mean = sumAVector/A_Count;
            else 
                B_Count = B_Count + 1;
                newBVector = AllData.data_sequence{i}.trial_sequence_array(j-1,[5,6]);
                sumBVector = sumBVector + newBVector;
                B_mean = sumBVector/B_Count;
            end
        end
                
        rowArr = AllData.data_sequence{i}.trial_sequence_array(j,[5,6]);
        type = 0;
        % the third argument in minkowski_distance is r. If set to 2, it is
        % equivalent to euclidean_distance
        sim_to_A = exp(-1*c * minkowski_distance(A_mean, rowArr, r));
        sim_to_B = exp(-1*c * minkowski_distance(B_mean, rowArr, r));
        %IF NO POINTS OF THE GIVEN CATEGORY IS SEEN, THEN THERE IS NO
        %SIMILARITY!
        if A_Count == 0
            sim_to_A = -inf;
        end
        if B_Count == 0
            sim_to_B = -inf;
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

