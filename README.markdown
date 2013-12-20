# Morpheus

An experimental ISQ backend built on Neo4j.

## Setup
Morpheus depends on a running Neo4j database running locally.
[Download](http://www.neo4j.org/download)
and start Neo4j before starting Morpheus.

## Data
While Morpheus has a basic sqlite database, it is primarily configured
to write to the neo4j databsae. The sqlite interface is maintained to
leverage active_model functionality. 

Here is an example of what you can do with this stack:

```ruby
jim = Student.create!(:name => "Jim")
jim.assessments << Assessment.create

jim.neo_node                # => #<Neography::Node…>
jim.neo_node.name           # => "jim"

rel = jim.completed.first.neo_relationship
rel.start_node  # user.neo_node
rel.end_node    # user.assessment.first.neo_node
rel.rel_type    # 'completed'
```
