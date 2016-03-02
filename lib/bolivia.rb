require "bolivia/version"

module Bolivia
  def Bolivia.generate_secret_key
    # Generates a 50 character alphanumeric secret key:
    SecureRandom.hex(50)
  end

  def raise404(message='Page not found.', template='views/404.mote')
    # Renders template if it exists (defaults to 'views/404.mote')
    # otherwise returns 'page not found'
    res.status = 404
    if File.exist?(template)
      case template
        when template.end_with?('mote')
          res.write view("404")
      end
    else
      res.write message
      halt(res.finish)
    end
  end

  def json_response(data)
    content_type = "application/json; charset=utf-8"
    res.headers["Content-Type"] = content_type
    res.write data.to_json
  end
end
