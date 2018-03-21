## Description of Prototype model

The prototype model of categorization proposes that humans categorize an object based on how similar it is to a prototype of that category. A prototype of a category is an average of all objects seen from a given category. An observer following the prototype model would, upon seeing a new object, compare it to the average (prototype) and group it based on how similar it is to the prototype.

Similarity to the prototype is calculated using the distance to the prototype. The function for the [Minkowski distance](https://en.wikipedia.org/wiki/Minkowski_distance), given two vectors and r is:

```
function [ dist ] = minkowski_distance(v1, v2, r)
%MINKOWSKI_DISTANCE: computes minkowski distance of two vectors
%   Detailed explanation goes here
dist  = (sum(abs(v1 - v2) .^ r)) ^ (1/r);
end
```
