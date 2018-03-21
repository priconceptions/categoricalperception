function [ dist ] = minkowski_distance(v1, v2, r)
%MINKOWSKI_DISTANCE: computes minkowski distance of two vectors
%   Detailed explanation goes here
dist  = (sum(abs(v1 - v2) .^ r)) ^ (1/r);
end

