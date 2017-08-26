namespace :db do
  desc "Populate database"
  task populate: :environment do
    reviewer_fred = Reviewer.create!(name: "Fred Fredson")
    
    brothers_k = Book.create!(title: "Brothers Karamazov")
    fyodor_d = Author.create!(name: "Fyodor Dostoevsky")
    brothers_k.authors << fyodor_d
    Review.create!(book: brothers_k, reviewer: reviewer_fred, content: "a classic")

    fatal_e = Book.create!(title: "The Fatal Eggs")
    mikhail_b = Author.create!(name: "Mikhail Bulgakov")
    fatal_e.authors << mikhail_b

  end
end
