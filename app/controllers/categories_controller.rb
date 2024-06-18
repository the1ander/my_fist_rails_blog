class CategoriesController < ApplicationController
    before_action :find_params, only: [:show, :edit, :update, :destroy]

def index
    @categories = Category.all
end

def create
    @category = Category.new(category_params)
    if @category.save
        flash[:notice] =  "Category created successfully"
        redirect_to @category
    else
        render 'new'

    end
end

def new
    @category = Category.new
end

def show
    
end

def edit
 
end

def update
 
    if @category.update(category_params)    
        flash[:notice] =  "Category updated successfully"
        redirect_to @category
    else
        render 'edit'
    end
end


def destroy
   
    @category.destroy
    flash[:notice] =  "Category deleted successfully"
    redirect_to categories_path
end

private

def find_params
    @category = Category.find(params[:id])
end

def category_params
    params.require(:category).permit(:name)
end

end