namespace :db do
  desc "Populate database"
  task populate: :environment do
    Book.create!(title: "Brothers Karamazov")
    Author.create!(name: "Fyodor Dostoevsky")
    Book.last.authors << Author.last

    Book.create!(title: "The Fatal Eggs")
    Author.create!(name: "Mikhail Bulgakov")
    Book.last.authors << Author.last

  end
end
