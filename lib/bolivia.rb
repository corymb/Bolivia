require "bolivia/version"

module Bolivia
  def generate_secret_key
    SecureRandom.hex(50)
  end
end
