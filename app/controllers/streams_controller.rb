class StreamsController < ApplicationController
  before_action :set_count

  def index
    # @count is set from session in the `set_count` method
    @vehicle = Vehicle.last

  end

  def increment
    session[:count] = @count + 1
    set_count
    render :change_count
  end

  def decrement
    session[:count] = @count - 1
    set_count
    render :change_count
  end

  private

  def set_count
    # Initialize @count to 0 if not set in session
    @count = session[:count] || 0
  end
end
