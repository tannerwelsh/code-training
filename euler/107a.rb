matrix = File.read('./107_network.txt').split("\n").map { |line| line.split(',') }

nodes = matrix.map.with_index do |node, index|
  node.slice(0, index)
end

nodes.map! do |edges|
  smallest = edges.max { |edge| 0 - edge.to_i }

  edges.map { |edge| (edge.to_i > smallest.to_i) ? '-' : edge }
end

p nodes
