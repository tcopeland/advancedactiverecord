reviewer1 = Reviewer.create!(name: Faker::Name.name)
reviewer2 = Reviewer.create!(name: Faker::Name.name)

brothers_k = Book.create!(title: "The Brothers Karamazov")
fyodor_d = Author.create!(name: "Fyodor Dostoevsky")
brothers_k.authors << fyodor_d
Review.create!(book: brothers_k, reviewer: reviewer2, content: "a classic").tap {|r| r.publish! }
Review.create!(book: brothers_k, reviewer: reviewer1, content: "great", featured: true).tap {|r| r.publish! }

fatal_e = Book.create!(title: "The Fatal Eggs")
mikhail_b = Author.create!(name: "Mikhail Bulgakov")
fatal_e.authors << mikhail_b
