class ServersController < ApplicationController

  def index
    @servers = Server.order(updated_at: :desc)
    render json: @servers
  end

  def create
    @server = Server.new(server_params)

    if @server.save
      render json: @server
    else
      render json: {errors: @server.errors, status: 422}
    end
  end

  protected

  def server_params
    params.require(:server).permit(:name, :ip)
  end

end
