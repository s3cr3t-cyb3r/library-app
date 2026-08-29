class AuthorsController < ApplicationController
    def index
        authors = Author.all
        authors_updated = []
        authors.each do |author|
            author = {
                id: author.id,
                age: author.age,
                biography: author.biography,
                name: author.name
            }
            authors_updated << author
        end

        render json: authors_updated
    end

    def show
        author = Author.find_by(id: params[:id])

        if author
            render json: {
                id: author.id,
                age: author.age,
                biography: author.biography,
                name: author.name
            }
        else
            render json: { message: "Author does not exist in database" }, status: :not_found
        end
    end

    def create
        author = Author.new(
            age: params[:age],
            biography: params[:biography],
            name: params[:name]
        )
        author.save
        if author.valid?
            render json: author, status: :created
        else
            render json: {errors: author.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def update
        author = Author.find_by(id: params[:id])

        if author
            if author.update(
                age: params[:age] || author.age,
                biography: params[:biography] || author.biography,
                name: params[:name] || author.name
            )
                render json: author
            else
                render json: { errors: author.errors.full_messages }, status: :unprocessable_entity
            end
        else
            render json: {  message: "Author not found in database" }, status: :not_found
        end
    end

    def delete
        author = Author.find_by(id: params[:id])

        if author
            author.destroy
            render json: {message: "Deleted successfully"}
        else
            render json: {  message: "Author not found in database" }, status: :not_found
        end
    end
end
