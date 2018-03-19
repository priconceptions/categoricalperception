function [ dist ] = euclidean_distance(v1, v2 )
%EUCLIDEAN_DISTANCE: computes euclidean distance of two vectors
%   Detailed explanation goes here
dist  = sqrt(sum((v1 - v2) .^ 2));

end

