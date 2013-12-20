# 01_ in the file name is in order to get this file loaded first, before the models (initializers are loaded alphabetically).
ENV["NEO4J_URL"] ||= "http://localhost:7474"

uri = URI.parse(ENV["NEO4J_URL"])

$neo = Neography::Rest.new(uri.to_s)

Neography.configure do |c|
  c.server = uri.host
  c.port = uri.port

  if uri.user && uri.password
    c.authentication = 'basic'
    c.username = uri.user
    c.password = uri.password
  end
end

Neoid.db = $neo

Neoid.configure do |c|
  # should Neoid create sub-reference from the ref node (id#0) to every node-model? default: true
  c.enable_subrefs = true
end
