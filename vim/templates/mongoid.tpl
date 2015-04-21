#!/usr/bin/env ruby
# coding: UTF-8

require 'bundler/setup'
require 'mongoid'

if !File.exist? 'database.yml'
  puts <<-eos
Initialize database.yml with:

production:
  sessions:
    default:
      hosts:
        - localhost:27017
      database: #{__FILE__}
eos
  exit
end

Mongoid.load! 'database.yml', :production
Mongoid.logger = Logger.new $stdout
Moped.logger = Logger.new $stdout

class Family
  include Mongoid::Document
  has_many :members, dependent: :delete
  field :name, type: String
  validates_uniqueness_of :name
end

class Member
  include Mongoid::Document
  field :name, type: String
  belongs_to :family
end

if __FILE__ == $0
  Family.destroy_all
  family = Family.create! name: 'Blanco Martínez'
  names = %w[Alba María Javier]
  names.each { |name| Member.create! name: name, family: family }
  puts Member.count()
end
