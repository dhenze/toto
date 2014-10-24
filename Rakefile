# This file contains some Rake tasks to
# help ease development and releasing processes.
require "bundler/gem_tasks"
require 'rake'
require 'rake/testtask'

Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/*_test.rb'
  test.verbose = true
end

task :default => :test

namespace :custom do
  desc "Create a release, supports (patch | minor | major)"
  task :release do |t|
    name = ARGV[1]
    if name 
      release(name)
      task name.to_sym do ; end
    else
      release
    end
  end

  desc "Publish work and releases to bitbucket origin."
  task :publish do
    %x[git push --tags origin HEAD:master]
  end


  # Testing out rakefile to generate changelog - use with caution!
  desc "Generate changelog based git tags"
  task :changelog do
    # Create hash of tags, tag points to sha.
    tags = Dir['.git/refs/tags/*'].each.with_object({}) do |path, hsh|
      hsh[File.basename(path)] = File.read(path).chomp
    end
   
    output = []
    tags.reduce(nil) do |(_, commit1), (version, commit2)|
      tag_date = `git log -1 --format="%ci" #{commit2}`.chomp
      lines = [ "## #{version} - #{tag_date}\n" ]
      if commit1
        lines << `git log #{commit1}...#{commit2} --pretty=" * (%h) %s [%an]"`
      end
   
      output << lines.join("\n")
      [version, commit2]
    end
    puts output.reverse.join("\n")
  end

  # Helper method for release task.
  def release dimension="patch"
    %x[semver inc #{dimension}]
    %x[git commit -m "Version $(semver tag)" -- .semver]
    %x[git semtag]
  end
end