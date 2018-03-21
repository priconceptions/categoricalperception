## Description of Prototype model

**The full code for this model can be found [here](src/prototype0.m)**

The prototype model of categorization proposes that humans categorize an object based on how similar it is to a prototype of that category. A prototype of a category is an average of all objects seen from a given category. An observer following the prototype model would, upon seeing a new object, compare it to the average (prototype) and group it based on how similar it is to the prototype.

Similarity to the prototype is calculated using the distance to the prototype. The function for the [Minkowski distance](https://en.wikipedia.org/wiki/Minkowski_distance), given two vectors and r is:

```
function [ dist ] = minkowski_distance(v1, v2, r)
%MINKOWSKI_DISTANCE: computes minkowski distance of two vectors
dist  = (sum(abs(v1 - v2) .^ r)) ^ (1/r);
end
```
After finding the distance, similarity to the prototype is defined as a monotonically decreasing function of the distance and a sensitivity parameter *c*. Higher values of *c* increase the differentiation between prototypes. The similarity of *i* to prototype *P* is:

```
sim_i_P = exp(-1*c * minkowski_distance(P, rowArr, r));
% rowArr is the vector of coordinates for object i
```

Using this, the probablity that an observer using the protoype model classifies an object as A is:
```
probA = (g/2) + (1 - g)*(sim_to_A/(sim_to_A + sim_to_B));
```
*g* is a guessing parameter that represents the probability that the observer chooses at random between the two categories.

**References**
* Feldman,J & Briscoe,Erica.(2011).Cognition 118. *Conceptual complexity and the bias/variance tradeoff*. 2-16.
