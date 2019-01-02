class RecipesController < ApplicationController
    def index
        @recipes = Recipe.search('')
        @search_term = params[:q] || 'chocolate'
    end
end
