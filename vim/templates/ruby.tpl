#!/usr/bin/env ruby
# coding: UTF-8
$DEBUG = true
require "logger"

logger = Logger.new $stderr
logger.level = Logger.const_get ENV.fetch "LOG_LEVEL", "INFO"

logger.debug "This is a debug message"
logger.info "Hello, logging world!"
logger.warn "This is a warning message"
logger.error "This is an error message"
logger.fatal "This is a fatal message"

puts "Hello world!"
