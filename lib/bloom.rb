module Bloom
  DEFAULTS = {
    m: 256,
    k: 8
  }
end

Dir[File.join(File.dirname(__FILE__), 'bloom', '**', '*.rb')].each {|f| require f}
