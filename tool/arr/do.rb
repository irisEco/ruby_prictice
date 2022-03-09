class Hasie
  def initialize
    @@inner_store = {}
  end

  # def each
  #   @inner_store.each do |key, value|
  #     yield key, value
  #   end
  # end

  # def method_missing(method_name, *args)
  #   if method_name.to_s.end_with?('=')
  #     property_name = method_name[0...-1]
  #     @inner_store[property_name] = args.first
  #   else
  #     property_name = method_name.to_s
  #     @inner_store[property_name]
  #   end
  # end

  def respond_to_missing?(method_name,*args)
    true
  end

  def self.s_and_r(name)
  send(:define_method, "#{name}=") do |value|
    @@inner_store.name = value
  end
  end

end

class B < Hasie
  s_and_r :name
end

object_1 = B.new
object_1.name= 'john'
# object_1.kid_count = 5
# puts object_1.name

# object_1.each do |key, value|
#   puts key
# end


# puts object_1.respond_to?(:name)

puts object_1