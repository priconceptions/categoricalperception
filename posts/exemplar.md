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
Like in the prototype model, similarity is described as a monotonically function of the distance and a sensitivity parameter *c*. The sum of similarities between a newly seen object and already categorized exemplars is as follows:

```
        % go through all previous "seen" exemplars
        for k = 1:j-1
            if AllData.data_sequence{i}.trial_sequence_array(k,7) == 1
                sim_to_A = sim_to_A + exp(-1*c * minkowski_distance(AllData.data_sequence{i}.trial_sequence_array(k,[5,6]), rowArr, r));
            else
                sim_to_B = sim_to_B + exp(-1*c * minkowski_distance(AllData.data_sequence{i}.trial_sequence_array(k,[5,6]), rowArr, r));
            end
        end
```

Using what we have above, the probability that an observer using the exemplar model classifies an object as A is:

```
probA = (g/2) + (1 - g)*(sim_to_A/(sim_to_A + sim_to_B));
```
*g* is a guessing parameter that represents the probability that the observer chooses at random between the two categories.

**References**
* Feldman,J & Briscoe,Erica.(2011).Cognition 118.*Conceptual complexity and the bias/variance tradeoff*. 2-16.
