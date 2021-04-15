# frozen_string_literal: true

require "hanami/api"
require "hanami/middleware/body_parser"

class HttpApp < Hanami::API
  use Hanami::Middleware::BodyParser, :json

  get "/" do
    "Hello, world"
  end

  scope "api" do
    get "/items" do
      items = ItemRepository.new.all
      json(items)
    end

    post "/item" do
      command = Items::Commands::Create.new
      result = command.call(params[:item])

      case result
      in { status: :ok, result: result }
        json(result)
      in { status: :error, message: message }
        halt(422, message)
      end
    end

    put "/items/:id/toggle_status" do
      command = Items::Commands::ToggleStatus.new
      command.call(id: params[:id])

      json(:ok)
    end
  end
end
