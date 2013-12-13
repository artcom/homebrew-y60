# A sample Guardfile
# More info at https://github.com/guard/guard#readme
require 'command'
require 'chromatic'

guard :rubocop do
  watch(%r{.+\.rb$})
  watch(%r{(?:.+/)?\.rubocop\.yml$}) { |m| File.dirname(m[0]) }
end

guard :shell, :all_on_start => true do
  watch(%r{.+\.rb$})do |m|
    print "Running brew audit for "
    print "'#{m[0]}'".cyan
    print " : "
    command = Command.run("brew audit #{m[0]}")
    if command.success?
      print "OK\n".green
    else
      issues = command.stdout.strip.lines.to_a[1..-1]
      print "#{issues.size} ISSUES\n".red
      puts "#{issues.join()}".yellow
    end
  end
end
