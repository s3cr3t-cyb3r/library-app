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

        render json: {
            id: book.id,
            title: book.title,
            genre: book.genre,
            isbn: book.isbn,
            page_count: book.page_count,
            year_published: book.year_published,
            checked_out: book.checked_out
        }
    end

    def create
        book = Book.create(
            title: params[:title],
            isbn: params[:isbn],
            genre: params[:genre],
            page_count: params[:page_count],
            year_published: params[:year_published],
            checked_out: params[:checked_out]
        )
        if book.valid?
            render json: book
        else
            render json: {errors: product.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def update
        book = Book.find_by(id: params[:id])

        book.update(
            title: params[:title] || book.title,
            isbn: params[:isbn] || book.isbn,
            genre: params[:genre] || book.genre,
            page_count: params[:page_count] || book.page_count,
            year_published: params[:year_published] || book.year_published,
            checked_out: params[:checked_out] || book.checked_out
        )

        render json: book
    end

    def delete
        book = Book.find_by(id: params[:id])

        book.destroy

        render json: {message: "Deleted successfully"}
    end
end
