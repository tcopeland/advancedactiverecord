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

parent1_comment = Comment.create!(body: "I like Ruby")
p1child1_comment = Comment.create!(body: "Me too!", parent: parent1_comment)
p1child2_comment = Comment.create!(body: "And me!", parent: parent1_comment)
p1child3_comment = Comment.create!(body: "Although refinements amirite?", parent: parent1_comment)
pc3_comment = Comment.create!(body: "Well maybe", parent: p1child3_comment)

parent2_comment = Comment.create!(body: "Rails is great")
p2child1_comment = Comment.create!(body: "And how!", parent: parent2_comment)
p2child2_comment = Comment.create!(body: "For reals!", parent: parent2_comment)
p2child3_comment = Comment.create!(body: "Bring back RJS!", parent: parent2_comment)

parent1_ancestry_comment = AncestryComment.create!(body: "I like Ruby")
p1child1_ancestry_comment = AncestryComment.create!(body: "Me too!", parent: parent1_ancestry_comment)
p1child2_ancestry_comment = AncestryComment.create!(body: "And me!", parent: parent1_ancestry_comment)
p1child3_ancestry_comment = AncestryComment.create!(body: "Although refinements amirite?", parent: parent1_ancestry_comment)
pc3_ancestry_comment = AncestryComment.create!(body: "Well maybe", parent: p1child3_ancestry_comment)

parent2_ancestry_comment = AncestryComment.create!(body: "Rails is great")
p2child1_ancestry_comment = AncestryComment.create!(body: "And how!", parent: parent2_ancestry_comment)
p2child2_ancestry_comment = AncestryComment.create!(body: "For reals!", parent: parent2_ancestry_comment)
p2child3_ancestry_comment = AncestryComment.create!(body: "Bring back RJS!", parent: parent2_ancestry_comment)

p1_ct_comment = CtComment.create(body: "Rails is create!")
p1_ct_comment.children.create!(body: "Me too!")
p1_ct_comment.children.create!(body: "And me!")
p2_ct_comment = p1_ct_comment.children.create!(body: "Although refinements amirite?")
p2_ct_comment.children.create!(body: "Well maybe")