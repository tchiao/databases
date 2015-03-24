class BooksController < ApplicationController
  def index
    if params[:query] && !params[:query].empty? && safe_params?(params[:query])
      @query = params[:query]
      begin
        @records = eval(@query)
      rescue NoMethodError => e
        flash[:error] = "Bad method. Baaaad method."
        redirect_to root_path
      rescue NameError => e
        flash[:error] = "Are you sure you spelled the model name right?"
        redirect_to root_path
      rescue SyntaxError => e
        flash[:error] = "Syntactical errors ahoy!"
        redirect_to root_path
      rescue
        flash[:error] = "What happened? We're investigating!"
        redirect_to root_path
      else
        fetch_model_records
      end
    else
      @books, @book_status = Book.all, true
      @readers, @reader_status = Reader.all, true
      @ownership_statuses, @ownership_status = Ownership.select(:status).distinct, true
    end
  end
end


