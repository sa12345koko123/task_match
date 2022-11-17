class Companies::BlogsController < ApplicationController

  def index
    @company = Company.find(params[:company_id])
    @blogs = @company.blogs
    @blog = Blog.new
  end

  def new
    @blog = Blog.new
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def create
    @blog =Blog.new(blog_params)
    @blog.company_id = current_companies_company.id
    @blog.save
    redirect_to companies_company_blogs_path
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.company_id = current_companies_company.id
    @blog.destroy
    redirect_to companies_company_blogs_path
  end


  private

  def blog_params
    params.require(:blog).permit(:title, :content, :start_time, :company_id)
  end
end
