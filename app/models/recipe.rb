# frozen_string_literal: true

require 'httparty'

class Recipe
  include HTTParty

  API_KEY = ENV['FOOD2FORK_KEY']
  base_uri 'https://www.food2fork.com/api/search'
  default_params key: API_KEY

  format :json

  def self.search(term)
    cleaned_up_term = term.gsub(/\s+/, '+')
    response = get('', query: { q: term })['recipes'] || []
    response
  end

  def self.images(term)
    cleaned_up_term = term.gsub(/\s+/, '+')
    response = get('', query: { q: term })['recipes'] || []
    images = []
    response.each { |recipe| images << recipe['image_url'] }
    images
  end
end
