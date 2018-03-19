function  [ percentMat ] = percentFit( arrOfMatrices )
%PERCENTfIT: takes the array of matrices and returns an array of percentage
%fits
% CAN BE USED FOR ANY MODEL--- THE VARIABLE NAMES DON'T MATTER
%   Each object has 2 fields:
%   (percent fit with subject) (percent fit with actual data)
%   NOTE: percent fit with actaul data will be modified once distance is
%   figured out

percentMat = {};
y = [];
for i = 1:length(arrOfMatrices)
   protoGuess = arrOfMatrices{i}(:,1);
   actual = arrOfMatrices{i}(:,3);
   subjectGuess = arrOfMatrices{i}(:,2);
   % prototype model's guess and subject's guess match
   percentProtoSubject = 1 - sum(abs(protoGuess - subjectGuess)) / length(protoGuess);
   % prototype model's guess and actual match
   percentProtoActual = 1 - sum(abs(protoGuess - actual)) / length(protoGuess);
   % how subject's guess matches the actual
   percentSubjectActual = 1 - sum(abs(subjectGuess - actual)) / length(protoGuess);
   % put these into array
   a = [percentProtoSubject, percentProtoActual, percentSubjectActual];
   y = [y;a];
   percentMat{end+1} = a;
   
end
%disp(y)
x = [1 2 3 4 5 6];
plot(x,y)
title('Graph of Model fit')
xlabel('Trials 1-6')
ylabel('Model Fit')
legend('model guess and subject guess match', 'models guess and actual match', 'subjects guess match with actual')

xticks([1 2 3 4 5 6])
xticklabels({'1', '2', '3', '4', '5', '6'})



end

