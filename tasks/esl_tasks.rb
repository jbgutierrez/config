#!/usr/bin/env ruby
require "rubygems"
require 'thor'

require 'id3lib' # port install id3lib mp3splt
require "iconv"

require 'nokogiri'
require 'open-uri'
require 'appscript'
include Appscript


class EslTasks < Thor
  desc "split INPUT", "trocea el mp3"
  method_option :force, :default => false, :aliases => "-f", :desc => "Forzar sobreescritura"

  def split(source)
    files = File.file?(source) ? [ source ] : Dir.glob("#{source}/*.mp3")
    puts files.inspect
    files.each do |file|
      begin
      tag    = ID3Lib::Tag.new(file)
      lyrics = Iconv.conv("UTF-8", "UTF-16BE", tag.lyrics)
      tokens = lyrics.split("\n")
      start  = tokens.find{ |token| token  =~ /Fast dialog/i }
      min, sec = start.scan(/\d+/)
      rescue
        puts "FAILIRES ON #{file}"
        next
      end

      sec = sec.to_i + 3
      split = "mp3splt -Q \"#{file}\" #{min}.#{sec}.00 60.00.00"

      system split

      filename = File.basename(file, ".mp3")   
      dir = File.dirname(file)
      temp_filename = `find \"#{dir}\" -name \"#{filename}_*\"`.first.chomp
      rename = "mv \"#{temp_filename}\" \"#{dir}/#{filename} (extract).mp3\""

      system rename
    end
  end

  desc "update_notes", "refresca los scripts guardados en evernote"
  def update_notes

    def download(relative_url)
      server = 'http://www.eslpod.com/website'
      url = "#{server}/#{relative_url}"
      puts url
      Nokogiri::HTML(open(url))
    end

    app = app('Evernote')
    app.activate

    url = 'show_all.php'

    while url
      home = download(url)
      podcasts = home.css('.podcast_title')

      podcasts.each do |podcast|
        title = podcast.text.strip
        next unless title.gsub!("ESL Podcast ", "")

        exit unless app.find_notes(title).empty?

        doc = download podcast[:href]
        puts title

        body = doc.css('.podcast_table_home .pod_body')
        body.shift
        body.pop
        html = body.to_xhtml

        tags = doc.css('.pod_body .pod_body a').map(&:text)
        tags = tags.map{|t| t.chomp("\n").strip}.reject(&:empty?)
        puts tags

        created = Time.parse(doc.css('.date-header').first.text.strip)
        app.create_note :title => title, :with_html => html, :notebook => 'esl', :tags => tags, :created => created
      end

      url = home.at('.podcast_table_home').css('a').detect{|a| a.text =~ /next/ }[:href] rescue nil
    end
  end

end

EslTasks.start
