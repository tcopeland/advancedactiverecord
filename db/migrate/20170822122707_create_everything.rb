class CreateEverything < ActiveRecord::Migration[5.1]
  def change
    create_table :authors do |t|
      t.string :name
      t.timestamps
    end

    create_table :books do |t|
      t.string :title, comment: 'The book title'
      t.timestamps
    end

    create_table :authors_books do |t|
      t.references :author, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.index [:author_id, :book_id], unique: true
    end

    create_table :ratings do |t|
      t.integer :score, null: false
      t.boolean :approved, null: false, default: false
      t.references :book, null: false, foreign_key: true
      t.timestamps
    end

    create_table :reviewers do |t|
      t.string :name
      t.timestamps
    end

    create_table :reviews do |t|
      t.string :aasm_state, comment: 'The state of the review', null: false
      t.boolean :featured, null: false, default: false
      t.index [:book_id, :featured], unique: true, where: "featured = true"
      t.text :content, null: false
      t.references :book, null: false, foreign_key: true
      t.references :reviewer, null: false, foreign_key: true
      t.timestamps
    end
  end
end
