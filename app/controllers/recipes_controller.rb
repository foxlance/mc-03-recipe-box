class RecipesController < ApplicationController
	before_action :find_recipe, only: [:edit, :update, :show, :destroy]
	before_filter :authenticate_user!, except: [:index, :show]

	def index
		
	end

	def show
		
	end

	def new
		@recipe = Recipe.new
	end

	def create
		@recipe = current_user.recipes.build(recipe_params)

		if @recipe.save
			redirect_to @recipe
		else
			render 'new'
		end
	end

	def edit
		
	end

	def update
		@recipe = current_user.recipes.find(params[:id])

		if @recipe.update(recipe_params)
			redirect_to @recipe
		else
			render 'edit'
		end
	end


	private

	def recipe_params
		params.require(:recipe).permit(:name, :description, :image)
	end

	def find_recipe
		@recipe = Recipe.find(params[:id])
	end

end
