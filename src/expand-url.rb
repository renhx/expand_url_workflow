#coding: utf-8

require 'open-uri'
require 'CGI'
require 'rexml/document'

begin
    query = CGI.escape ARGV[0]
    open("http://api.longurl.org/v2/expand?format=xml&url=#{query}") do |f|
        print REXML::Document.new(f.read).elements["response/long-url"].text
    end
rescue
    print "Can't Expand URL"
    #raise
end
