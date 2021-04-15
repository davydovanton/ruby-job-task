module Items
  module Commands
    class Create
      attr_reader :repo

      def initialize(repo: ItemRepository.new)
        @repo = repo
      end

      def call(payload)
        if valid?(payload)
          item = repo.create(name: payload[:name], price: payload[:price])
          Producer.new.call('items-stream', 'ItemCreated', item)

          { status: :ok, result: item}
        else
          { status: :error, message: 'invalid item' }
        end
      end

      private

      def valid?(payload)
        !payload[:name].empty? && payload[:price].to_i > 0
      end
    end
  end
end
