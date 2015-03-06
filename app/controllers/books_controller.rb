class BooksController < ApplicationController
  def index
    @ownership_statuses = Ownership.distinct.pluck(:status)
    @books = Book.all
    @readers = Reader.all
  end
end
