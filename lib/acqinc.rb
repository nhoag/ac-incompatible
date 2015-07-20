require "acqinc/version"
require 'mechanize'
require 'logger'
require 'nokogiri'

module Acqinc
  class CLI
    config = YAML::load_file(File.join(__dir__, '../_config.yml'))

    # Create a new mechanize object
    mech = Mechanize.new

    # Uncomment for verbose output
    # mech.log = Logger.new $stderr
    # mech.agent.http.debug_output = $stderr

    # Load the Accounts site
    page = mech.get('https://accounts.acquia.com/')
    form = page.forms[0]
    username_field = form.field_with(:id => 'edit-name')
    username_field.value = config['user_name']
    password_field = form.field_with(:id => 'edit-pass')
    password_field.value = config['user_pass']
    form.submit form.buttons.first

    incompatible = mech.get('https://docs.acquia.com/articles/module-incompatibilities-acquia-cloud');
    doc = Nokogiri::HTML(incompatible.body, "UTF-8")
    doc.xpath('//tr').each do |item|
      if !item.xpath('./td/a')[0].nil?
        item.xpath('./td/a')[0].each do |x|
          puts x[1].split('/')[-1]
        end
      end
    end
  end
end
