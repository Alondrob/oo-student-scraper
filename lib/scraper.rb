require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

    attr_accessor :student
#css - allows to grab css 
  @@all = []

  def self.scrape_index_page(index_url)
    students = []
    html = open(index_url)
    page = Nokogiri::HTML(html) #nokogiri is a library
    page.css(".student-card").each do |card| 
      student = {}
      #  binding.pry
      student[:name] = card.css(".student-name").text
      student[:location] = card.css(".student-location").text
      student[:profile_url] = card.children[1].attr("href")
      students << student
    end
   students
  end

  def self.scrape_profile_page(profile_url)
    html = open(profile_url)
    page = Nokogiri::HTML(html) #nokogiri is a library
    # binding.pry
    student = {}
    student[:profile_quote] = page.css(".profile-quote").text
    student[:bio] = page.css(".bio-content .description-holder p").text
    socials = page.css(".social-icon-container").children.css("a").map {|link| link.attr("href")}
     socials.each do |link|
      if link.include?("twitter")
        student[:twitter] = link
      elsif link.include?("linkedin")
        student[:linkedin] = link
      elsif link.include?("github")
            student[:github] = link
      else
          student[:blog] = link
      end
    end
    student 
  end
    
end

