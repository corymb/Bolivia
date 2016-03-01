require "bolivia/version"

module Bolivia
  def generate_secret_key
    SecureRandom.hex(50)
  end

  def raise404
      res.status = 404
      if File.exist?('views/404.mote')
        res.write view("404")
      else
        res.write 'Page not found.'
        halt(res.finish)
      end
  end
end
