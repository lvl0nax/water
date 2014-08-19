class ChangeHost

  def initialize(app)
    @app = app
  end

  def call(env)
    if env['HTTP_HOST'].to_s.include?('прима-аква.рф')
      [301, { 'Location' => Rack::Request.new(env).url.sub('прима-аква.рф', 'prima-aqua.ru') }, ['Redirecting...']]
    else
      @app.call(env)
    end
  end

end
