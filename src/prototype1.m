% author: Priyanka Dhulkhed
% implementation of prototype model with the mean as the prototype
function prototype1(number)
% loading the variable data_sequence from the file into AllData. We will use AllData to
% access the fields
AllData = load('dataSequence.mat'); % AllData is a struct with field data_sequence

for i = 1:length(AllData.data_sequence)
    A_mean = AllData.data_sequence{i}.experiment_parameters.A.mean;
    B_mean = AllData.data_sequence{i}.experiment_parameters.B.mean;
    rowArr = AllData.data_sequence{i}.trial_sequence_array(i,1:end-8);
    disp(i)
    disp(A_mean)
    disp(rowArr)
    
end

end



