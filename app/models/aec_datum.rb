class AecDatum < ActiveRecord::Base
  require 'Nokogiri'
  attr_accessible :date, :name, :time
  
  
  def self.getTwoPartyPreferred
    outputLines = []
    myFile = File.open("#{Rails.root.to_s}/app/models/aec-mediafeed-results-standard-verbose-17496.xml")
    xml = Nokogiri::XML(myFile)
    myFile.close
    xml.remove_namespaces!
    xml.xpath('//TwoPartyPreferred').each do |line|
      tempArray = []
      line.xpath('.//Coalition').each do |line2|
        #tempName = line2.xpath('.//CoalitionName').text
        tempVotes = line2.xpath('.//Votes').text
        tempArray << tempVotes
        outputLines << tempArray
      end
    end
    return outputLines
  end
  
  #Adds the static AEC file in the same directory to the database, shouldn't be needed unless the database has somehow lost it's data
  def self.loadFile
  end
end