class BooksController < ApplicationController
  def index
    @books = Book.all

    respond_to do |format|
      format.html
      format.text
      format.csv {send_data Book.generate_csv(@books)}
      format.json do
        render json: @books.map {|book| book.to_json}
      end
    end
  end

end
