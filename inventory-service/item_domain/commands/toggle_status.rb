module Items
  module Commands
    class ToggleStatus
      attr_reader :repo

      def initialize(repo: ItemRepository.new)
        @repo = repo
      end

      def call(id:)
        repo.toggle_status(id)
      end
    end
  end
end
