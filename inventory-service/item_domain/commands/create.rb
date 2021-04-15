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
          produce_event(item)

          { status: :ok, result: item}
        else
          { status: :error, message: 'invalid item' }
        end
      end

      private

      def valid?(payload)
        !payload[:name].empty? && payload[:price].to_i > 0
      end

      def produce_event(item)
        event = {
          event_id: SecureRandom.uuid,
          event_name: 'ItemCreated',
          data: item
        }

        Producer.new.call('items-stream', event)
      end
    end
  end
end
