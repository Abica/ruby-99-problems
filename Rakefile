# stolen from the bitfields project (http://github.com/jsanders/bitfields/)
begin
  require 'rubygems'
rescue Exception
  puts 'RubyGems is not installed. See http://www.rubygems.org/read/chapter/3 for instructions.'
end
 
begin
  require 'spec/rake/spectask'
 
  Spec::Rake::SpecTask.new do |t|
    t.spec_opts = ['-c']
    t.libs << 'lib'
    t.spec_files = FileList['spec/**/*_spec.rb']
  end
rescue Exception
  puts 'RSpec not available. Install it with: sudo gem install rspec'
end
