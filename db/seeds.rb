Author.create(name: "Jeff Kinney", age: 55)
Author.create(name: "Elisabetta Dami", age: 58)
Author.create(name: "Lauren Tarshis", age: 62)
Author.create(name: "Mary Pope Osborne", age: 77)
Author.create(name: "Rick Riordan", age: 62)
10.times do
    book = Book.create(title: Faker::Book.title, year_published: Faker::Number.normal, page_count: Faker::Number.normal, genre: Faker::Book.genre)
end