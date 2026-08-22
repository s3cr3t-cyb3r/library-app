class AuthorsController < ApplicationController
    def index
        authors = Author.all
        authors_updated = []
        authors.each do |author|
            author = {
                id: author.id
                age: author.age
                bio: author.biography
                name: author.name
            }
            authors_updated << author
        end

        render json: authors_updated
    end

    def show
        author = Author.find_by(id: params[:id])

        render json: {
            id: author.id
            age: author.age
            bio: author.biography
            name: author.name
        }
    end

    def create
        author = Author.create(
            age: params[:age]
            bio: params[:biography]
            name: params[:name]
        )
        if author.valid?
            render json: author
        else
            render json: {errors: product.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def update
        author = Author.find_by(id: params[:id])

        author.update(
            age: params[:age] || author.age
            bio: params[:biography] || author.biography
            name: params[:name] || author.name
        )

        render json: author
    end

    def delete
        author = Author.find_by(id: params[:id])

        author.destroy

        render json: {message: "Deleted successfully"}
    end
end
