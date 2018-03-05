class IpsController < ApplicationController

  def index
    render json: {ip: request.remote_ip}
  end

end
