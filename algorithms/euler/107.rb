# https://projecteuler.net/problem=107

class Network
  attr_reader :matrix

  def initialize(matrix)
    @matrix = matrix
  end

  def nodes
    @nodes ||= Node.create_set(matrix)
  end

  def edges
    @edges ||= nodes.map(&edges)
  end

  def minimized?
    edges.count == nodes.count - 1
  end
end

class Node
  def edges
    @edges ||= []
  end

  def self.create_set(matrix)
    nodes = Array.new(matrix.size) { self.new }
    edges = []

    matrix.each.with_index do |node_edges, index|
      node_edges.each.with_index do |edge_value, edge_index|
        next if edge_value == '-'

        node = nodes[index]
        edge = Edge.new(edge_value, node, nodes[edge_index])
        edge = edges.find { |existing_edge| existing_edge == edge } || edge

        node.edges << edge
      end
    end

    nodes
  end
end

class Edge
  attr_reader :value, :a, :b

  def initialize(value, a, b)
    @value = value
    @a, @b = a, b
  end

  def ==(other)
    self.value == other.value && self.a == other.a && self.b == other.b
  end
end

matrix = File.read('./107_network.txt').split("\n").map { |line| line.split(',') }
p matrix

network = Network.new(matrix)

network.nodes.each do |node|
  smallest_edge = node.edges.min_by { |edge| edge.value }

  node.edges.clear
  node.edges << smallest_edge
end

p network.minimized?
