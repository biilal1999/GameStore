require "rspec/core/rake_task"


desc "Instalar las dependencias"

task:install do
	exec "bundle install"
end





desc "Ejecutar los tests"


RSpec::Core::RakeTask.new("test") do |t|
	t.pattern = ['spec/*_spec_*.rb']
	t.verbose = false
end
