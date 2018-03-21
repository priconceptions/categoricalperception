## Description of Exemplar model

**The full code for this model can be found [here](src/exemplar0.m)**

The exemplar model of categorization proposes that humans categorize objects based on the summed similarities of the given object to all *exemplars* of a particular category.

Like the prototype model, similarities to other exemplars of a given category is computed using the [Minkowski distance](https://en.wikipedia.org/wiki/Minkowski_distance):

```
function [ dist ] = minkowski_distance(v1, v2, r)
%MINKOWSKI_DISTANCE: computes minkowski distance of two vectors
dist  = (sum(abs(v1 - v2) .^ r)) ^ (1/r);
end
```
