# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-events'
  s.author            = 'Philipp Neugebauer'
  s.version           = '1.0b'
  s.description       = 'Ruby on Rails Events extension for Refinery CMS'
  s.date              = '2012-09-18'
  s.summary           = 'Events extension for Refinery CMS'
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib}/**/*"] + ["readme.md"]

  # Runtime dependencies
  s.add_dependency             'refinerycms-core',    '>= 2.0'

  # Development dependencies (usually used for testing)
  s.add_development_dependency 'refinerycms-testing', '>= 2.0'
end
