Gem::Specification.new do |s|
    s.name        = 'routech_api'
    s.version     = '0.1.0'
    s.summary     = "Routech Api integration"
    s.description = "Simple Gem to connect to Routech Server and use Apis"
    s.authors     = ["Daniel Debrande Junior"]
    s.email       = 'daniel.debrande.jr@gmail.com'

    s.files         = Dir.chdir(File.expand_path(__dir__)) do
      `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
    end

    s.homepage    ='https://github.com/NeoFleet/routech_api'
    s.require_paths = ["lib"]
    s.license       = 'MIT'
  end
