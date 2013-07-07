class StaticPagesController < ApplicationController
	skip_before_filter :require_authentication,  only:[:index]
  def index
  end
end
