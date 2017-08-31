namespace :db do
  desc "Populate database"
  task populate: :environment do
    reviewer_sally = Reviewer.create!(name: "Sally Sallysdaughter")
    reviewer_fred = Reviewer.create!(name: "Fred Fredson")

    brothers_k = Book.create!(title: "The Brothers Karamazov")
    fyodor_d = Author.create!(name: "Fyodor Dostoevsky")
    brothers_k.authors << fyodor_d
    Review.create!(book: brothers_k, reviewer: reviewer_fred, content: "a classic").tap {|r| r.publish! }
    Review.create!(book: brothers_k, reviewer: reviewer_sally, content: "great", featured: true).tap {|r| r.publish! }

    fatal_e = Book.create!(title: "The Fatal Eggs")
    mikhail_b = Author.create!(name: "Mikhail Bulgakov")
    fatal_e.authors << mikhail_b

  end
end
