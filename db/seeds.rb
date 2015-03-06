ownership = ["missing", "bought", "borrowed", "bought", "borrowed", "bought", "borrowed"]

lotr = Book.create!(
  title: "The Lord of the Rings",
  author: "J. R. R. Tolkien"
)

prince = Book.create!(
  title: "The Little Prince",
  author: "Antoine de Saint-Exupéry"
)

achristie = Book.create!(
  title: "And Then There Were None",
  author: "Agatha Christie"
)

hp = Book.create!(
  title: "Harry Potter and the Philosopher's Stone",
  author: "J. K. Rowling"
)

bnw = Book.create!(
  title: "Brave New World",
  author: "Aldous Huxley"
)

lolita = Book.create!(
  title: "Lolita",
  author: "Vladimir Nabokov"
)

cloud = Book.create!(
  title: "Cloud Atlas",
  author: "David Mitchell"
)

agg = Book.create!(
  title: "Anne of Green Gables",
  author: "Lucy Maud Montgomery"
)

wap = Book.create!(
  title: "War and Peace",
  author: "Leo Tolstoy"
)

murakami = Book.create!(
  title: "Kafka on the Shore",
  author: "Haruki Murakami"
)

ggs = Book.create!(
  title: "Guns, Germs, and Steel",
  author: "Jared Diamond"
)

wfip = Book.create!(
  title: "How to Win Friends and Influence People",
  author: "Dale Carnegie"
)

pap = Book.create!(
  title: "Pride and Prejudice",
  author: "Jane Austen"
)

thg = Book.create!(
  title: "The Hunger Games",
  author: "Suzanne Collins"
)

hol = Book.create!(
  title: "House of Leaves",
  author: "Mark Z. Danielewski"
)

giver = Book.create!(
  title: "The Giver",
  author: "Lois Lowry"
)


reader = Reader.create!(
  name: "Geoffrey Scott",
  age: 58,
  gender: "M"
)
reader.books += [lotr, cloud, wap, ggs]

reader = Reader.create!(
  name: "Enrique Mills",
  age: 18,
  gender: "M"
)
reader.books += [lotr, bnw, pap]

reader = Reader.create!(
  name: "Nicolas Singleton",
  age: 31,
  gender: "M"
)
reader.books += [cloud, murakami, hol, wfip]

reader = Reader.create!(
  name: "Ken Greene",
  age: 22,
  gender: "M"
)
reader.books += [ggs, wfip, cloud, hol]

reader = Reader.create!(
  name: "Ralph Tran",
  age: 10,
  gender: "M"
)
reader.books << hp

reader = Reader.create!(
  name: "Benny Francis",
  age: 8,
  gender: "M"
)
reader.books += [hp, giver]

reader = Reader.create!(
  name: "Jeff Rosamund",
  age: 12,
  gender: "M"
)
reader.books << lotr 

reader = Reader.create!(
  name: "Derek Parsons",
  age: 40,
  gender: "M"
)

reader = Reader.create!(
  name: "Craig Curtis",
  age: 27,
  gender: "M"
)
reader.books += [wap, bnw, achristie, hol]

reader = Reader.create!(
  name: "Milton Jenkins",
  age: 35,
  gender: "M"
)
reader.books += [agg, prince, hp, thg, giver]

reader = Reader.create!(
  name: "Rosa Ortiz",
  age: 39,
  gender: "F"
)
reader.books += [murakami, cloud, hol, wfip]

reader = Reader.create!(
  name: "Joy Lewis",
  age: 20,
  gender: "F"
)
reader.books += [hp, lolita, pap]

reader = Reader.create!(
  name: "Kerry Cooper",
  age: 23,
  gender: "F"
)
reader.books += [wap, prince, thg]

reader = Reader.create!(
  name: "Ada Alvarez",
  age: 6,
  gender: "F"
)

reader = Reader.create!(
  name: "Evelyn Watts",
  age: 60,
  gender: "F"
)
reader.books += [achristie, agg, giver]

reader = Reader.create!(
  name: "Samantha Collier",
  age: 18,
  gender: "F"
)
reader.books += [lolita, lotr, bnw, pap, wfip]

reader = Reader.create!(
  name: "Crystal Gonzalez",
  age: 9,
  gender: "F"
)
reader.books += [agg, hp, achristie, giver, thg]

reader = Reader.create!(
  name: "Kate Gonzales",
  age: 13,
  gender: "F"
)
reader.books += [achristie, lotr, thg]

reader = Reader.create!(
  name: "Inez Singleton",
  age: 32,
  gender: "F"
)
reader.books += [prince, murakami, ggs, pap]

reader = Reader.create!(
  name: "Felicia Sandoval",
  age: 58,
  gender: "F"
)
reader.books += [cloud, lolita, hol]

@readers = Reader.all

@readers.each do |r|
  r.ownerships.each do |o|
    o.update_attribute(:status, ownership[rand(0..6)])
  end
end

# @book.libraries.create(:reader_id => @reader.id)


# @book = Book.new(params[:book])
# @book.readers << Reader.find(params[:reader_id])

# @book = Book.new(params[:book])
# @book.readers.create(params[:reader])

# Libraries.where("book_id = ? and reader_id = ?", book.id, reader.id).role
# update_attributes(name: "")

# book.libraries.where(reader_id: reader.id).update_attribute(:name, "")