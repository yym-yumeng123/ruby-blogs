require 'rack'
require 'webrick'

class X
  def call(env)
    request = Rack::Request.new(env)

    case request.path
    when '/index.html'
      [
        200,
        {'Content-Type' => 'text/html;charset=utf-8'},
        ['<link rel="stylesheet" href="style.css"><h1>首页</hi>']
      ]
    when '/style.css'
      [
        200,
        {'Content-Type' => 'text/css;charset=utf-8'},
        ['h1{color: red}']
      ]
    else
      [
        404,
        {'Content-Type' => 'text/html;charset=utf-8'},
        ['<h1>路径不存在</hi>']
      ]
    end
  end
end

Rack::Handler::WEBrick.run X.new, Host: '0.0.0.0', Port: 1234, AccessLog: []