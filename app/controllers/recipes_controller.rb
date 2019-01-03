class RecipesController < ApplicationController
    def index
        @recipes = Recipe.search('chocolate')
        @search_term = params[:q] || 'chocolate'
    end
end
