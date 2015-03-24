class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def safe_params?(query)
    query =~ /destroy|delete|\bupdate\b|\bcreate\b|build/ ? false : true
  end

  def fetch_model_records
    if @records.class.to_s =~ /Book/
      fetch_book_records
      @book_status, @reader_status, @ownership_status = true, false, false
    elsif @records.class.to_s =~ /Reader/
      fetch_reader_records
      @book_status, @reader_status, @ownership_status = false, true, false
    elsif @records.class.to_s =~ /Ownership/
      fetch_ownership_records
      @book_status, @reader_status, @ownership_status = false, false, true
    else
      flash[:error] = "You found a unicorn of an error! Congrats, I guess."
      redirect_to root_path
    end
  end

  def fetch_book_records
    if @records.is_a?(Book)
      @books, @readers, @ownership_statuses = [@records], @records.readers, @records.ownerships.select(:status).distinct
    else
      readers, ownerships = [], []
      begin
        @records.each do |b|
          readers += b.readers
          ownerships += b.ownerships
        end
      rescue ActiveRecord::StatementInvalid => e
        flash[:error] = "Bad query. Baaaad query."
        redirect_to root_path
      else
        @books = @records
        @readers = readers.uniq
        @ownership_statuses = ownerships.uniq {|o| o.status }
      end
    end
  end

  def fetch_reader_records
    if @records.is_a?(Reader)
      @books, @readers, @ownership_statuses = @records.books, [@records], @records.ownerships.select(:status).distinct
    else
      books, ownerships = [], []
      begin
        @records.each do |r|
          books += r.books
          ownerships += r.ownerships
        end
      rescue ActiveRecord::StatementInvalid => e
        flash[:error] = "Bad query. Baaaad query."
        redirect_to root_path
      else
        @books = books.uniq
        @readers = @records
        @ownership_statuses = ownerships.uniq {|o| o.status }
      end
    end
  end

  def fetch_ownership_records
    if @records.is_a?(Ownership)
      @books, @readers, @ownership_statuses = @records.book, @records.reader, [@records]
    else
      books, readers = [], []
      begin
        @records.each do |o|
          books += [o.book]
          readers += [o.reader]
        end
      rescue ActiveRecord::StatementInvalid => e
        flash[:error] = "Bad query. Baaaad query."
        redirect_to root_path
      else
        @books = books.uniq
        @readers = readers.uniq
        @ownership_statuses = @records.select(:status).distinct
      end
    end
  end

end
