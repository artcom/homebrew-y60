# -*- coding: UTF-8 -*-
require 'command'
require 'chromatic'

guard :rubocop do
  watch(%r{.+\.rb$})
  watch(%r{(?:.+/)?\.rubocop\.yml$}) { |m| File.dirname(m[0]) }
end

if ENV.values_at("LC_ALL","LC_CTYPE","LANG").compact.first.include?("UTF-8")
  MSG_OK = '✔'
  MSG_NOT_OK = '✘'
else
  MSG_OK = 'OK'
  MSG_NOT_OK = 'NOT OK'
end

guard :shell, :all_on_start => true do
  watch(%r{.+\.rb$})do |m|
    print 'Running brew audit for '
    print %Q|'#{m[0]}'|.cyan
    print ' : '
    command = Command.run(%Q|brew audit #{m[0]}|)
    if command.success?
      print %Q|#{MSG_OK}\n|.green
    else
      issues = command.stdout.strip.lines.to_a[1..-1]
      print %Q|#{MSG_NOT_OK} (#{issues.size} issues)\n|.red
      issues.each_with_index do |msg, counter|
        puts %Q|  #{counter + 1}: #{msg[3...-1]}|.red
      end
      # return nothing here - othwwise picks it up as return value and prints it
      nil
    end
  end
end
