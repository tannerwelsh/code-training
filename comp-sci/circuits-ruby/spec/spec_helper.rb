source_files = File.expand_path('../../*.rb', __FILE__)

Dir[ source_files ].each { |file| require file }

class Integer
  def to_bits(length = 8)
    bits = to_s(2).chars.map(&:to_i)

    if bits.length < length
      bits = Array.new(length - bits.length, 0) + bits
    end

    bits
  end
end
