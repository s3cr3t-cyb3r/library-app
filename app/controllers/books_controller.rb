class BooksController < ApplicationController
    def index
        books = Book.all
        books_updated = []
        books.each do |book|
            book = {
                id: book.id,
                title: book.title,
                genre: book.genre,
                isbn: book.isbn,
                page_count: book.page_count,
                year_published: book.year_published,
                checked_out: book.checked_out
            }
            books_updated << book
        end

        render json: books_updated
    end

    def show
        book = Book.find_by(id: params[:id])

        if book
            render json: {
                id: book.id,
                title: book.title,
                genre: book.genre,
                isbn: book.isbn,
                page_count: book.page_count,
                year_published: book.year_published,
                checked_out: book.checked_out
            }
        else
            render json: { message: "Book doesn't exist." }, status: :not_found
        end
    end

    def create
        book = Book.new(
            title: params[:title],
            isbn: params[:isbn],
            genre: params[:genre],
            page_count: params[:page_count],
            year_published: params[:year_published],
            checked_out: params[:checked_out]
        )
        book.save
        if book.valid?
            render json: book, status: :created
        else
            render json: {errors: book.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def update
        book = Book.find_by(id: params[:id])

        if book
            if book.update(
                title: params[:title] || book.title,
                isbn: params[:isbn] || book.isbn,
                genre: params[:genre] || book.genre,
                page_count: params[:page_count] || book.page_count,
                year_published: params[:year_published] || book.year_published,
                checked_out: params[:checked_out] || book.checked_out
            )
                render json: book
            else
                render json: {errors: book.errors.full_messages}, status: :unprocessable_entity
            end
        else
            render json: { message: "Book not found in database" }, status: not_found
    end

    def delete
        book = Book.find_by(id: params[:id])

        if book
            book.destroy
            render json: {message: "Deleted successfully"}
        else
            render json: {message: "Book not existing. Please try again."}, status: :not_found
        end
    end
end
