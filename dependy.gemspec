# coding: utf-8
Gem::Specification.new do |gem|
  gem.name = 'dependy'
  gem.version = '0.1.0'
  gem.authors = ['Slavko Krucaj']
  gem.email = ['slavko.krucaj@gmail.com']
  gem.description = %q{Analyzing class dependency graphs}
  gem.summary = %q{Tool for inspecting class dependency graphs}
  gem.license = 'MIT'

  gem.files = `git ls-files`.split($/)
  gem.executables = gem.files.grep(%r{^bin/}) { |f| File.basename(f) }
  gem.test_files = gem.files.grep(%r{^spec/})
end
