require 'acqinc/version'
require 'open-uri'
require 'nokogiri'

module Acqinc
  class CLI
    doc = Nokogiri::HTML(open('https://docs.acquia.com/articles/module-incompatibilities-acquia-cloud'))
    doc.xpath('//tr').each do |item|
      if !item.xpath('./td/a')[0].nil?
        item.xpath('./td/a')[0].each do |x|
          puts x[1].split('/')[-1]
        end
      end
    end
  end
end
