# Morpheus

An experimental ISQ backend built on Neo4j.

## Setup
Morpheus depends on a running Neo4j database running locally.
[Download](http://www.neo4j.org/download)
and start Neo4j before starting Morpheus. Make sure you are just using
the default localhost/port that comes with Neo4j.

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

rel = jim.completed_assessments.first.neo_relationship
rel.start_node  #  => #<Neography::Node ar_id=1, neoid_unique_id="Student:1", name="Jim", ar_type="Student"> 
rel.end_node    #  => #<Neography::Node ar_id=1,neoid_unique_id="Assessment:1", ar_type="Assessment">
rel.rel_type    #  => "completed_assessments"
```

## What is Working Currently
Students, Assessment, and the connection between the two.

## What we would need to make this work on TinkerPop Stack

1. We'll need to create our own gem that mimics much of the
   functionality of the [Lexster](https://github.com/elado/neoid) gem, but
is not so coupled to Neo4j.
2. [Lexster](https://github.com/elado/neoid), the gem that writes to
   neo4j, does so via the
[Neography](https://github.com/maxdemarzi/neography) gem. We would need
to to move this functionality to either the Rexpro gem, or mimic the
Neography gem to write to Rexster via HTTP.
