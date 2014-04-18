Dir[File.expand_path('../lib/*.rb', __FILE__)].each { |f| require f }

module Spevo
  VERSION = "0.0.1"

  def self.version
    VERSION
  end
end
