reviewer1 = Reviewer.create!(name: "Sally Sallysdaughter")
reviewer2 = Reviewer.create!(name: "Fred Fredson")
reviewer3 = Reviewer.create!(name: "Jim Jimson")

brothers_k = Book.create!(title: "The Brothers Karamazov")
fyodor_d = Author.create!(name: "Fyodor Dostoevsky")
brothers_k.authors << fyodor_d
Review.create!(book: brothers_k, reviewer: reviewer2, content: "a classic").tap {|r| r.publish! }
Review.create!(book: brothers_k, reviewer: reviewer1, content: "great", featured: true).tap {|r| r.publish! }

fatal_e = Book.create!(title: "The Fatal Eggs")
mikhail_b = Author.create!(name: "Mikhail Bulgakov")
fatal_e.authors << mikhail_b

low_rating = Rating.create!(score: 1, approved: false, book: fatal_e)
high_rating_fe = Rating.create!(score: 5, approved: true, book: fatal_e)
high_rating_bk = Rating.create!(score: 5, approved: true, book: brothers_k)
