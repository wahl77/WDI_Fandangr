class StaticPagesController < ApplicationController
	skip_before_filter :require_authentication,  only:[:index, :all]
  def index
  end
  def all
  end
end
