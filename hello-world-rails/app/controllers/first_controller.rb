class FirstController < ApplicationController
  def hello
    # render plain: 'hello-world-1-编辑'
    # render json: {:name => 'yym', :age => 17}
    render 'first/hello'
  end

  def hi
    render 'first/hi'
  end
end
