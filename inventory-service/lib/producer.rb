class Producer
  attr_reader :transport

  def initialize(transport: Object.new)
    @transport = transport
  end

  def call(*params)
    # some code here
  end
end
