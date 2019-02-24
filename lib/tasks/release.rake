require 'march-madness/version'

desc "Release version #{MarchMadness::VERSION} of the gem"
task :release do
  system "git tag -a v#{MarchMadness::VERSION} -m 'Tagging #{MarchMadness::VERSION}'"
  system 'git push --tags'

  system "gem build march-madness.gemspec"
  system "gem push march-madness-#{MarchMadness::VERSION}.gem"
  system "rm march-madness-#{MarchMadness::VERSION}.gem"
end