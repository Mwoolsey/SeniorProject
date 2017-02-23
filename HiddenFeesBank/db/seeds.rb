# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create(
  [
    { email: 'a@a.com', address: "somewhere over the rainbow", phone: (1111111111 + rand(9999999999)).to_s, name: "Mr. Aardvark", password: "a", password_confirmation: "a"},
    { email: 'b@b.com', address: "somewhere over the rainbow", phone: (1111111111 + rand(9999999999)).to_s, name: "Mr. Bear", password: "b", password_confirmation: "b"},
    { email: 'c@c.com', address: "somewhere over the rainbow", phone: (1111111111 + rand(9999999999)).to_s, name: "Mr. Cat", password: "c", password_confirmation: "c"},
    { email: 'd@d.com', address: "somewhere over the rainbow", phone: (1111111111 + rand(9999999999)).to_s, name: "Mr. Dog", password: "d", password_confirmation: "d"},
    { email: 'e@e.com', address: "somewhere over the rainbow", phone: (1111111111 + rand(9999999999)).to_s, name: "Mr. Elephant", password: "e", password_confirmation: "e"},
    { email: 'f@f.com', address: "somewhere over the rainbow", phone: (1111111111 + rand(9999999999)).to_s, name: "Mr. Fox", password: "f", password_confirmation: "f"},
    { email: 'g@g.com', address: "somewhere over the rainbow", phone: (1111111111 + rand(9999999999)).to_s, name: "Mr. Gopher", password: "g", password_confirmation: "g"},
    { email: 'h@h.com', address: "somewhere over the rainbow", phone: (1111111111 + rand(9999999999)).to_s, name: "Mr. Horse", password: "h", password_confirmation: "h"},
    { email: 'i@i.com', address: "somewhere over the rainbow", phone: (1111111111 + rand(9999999999)).to_s, name: "Mr. Iguana", password: "i", password_confirmation: "i"},
    { email: 'j@j.com', address: "somewhere over the rainbow", phone: (1111111111 + rand(9999999999)).to_s, name: "Mr. Jackrabbit", password: "j", password_confirmation: "j"},
    { email: 'k@k.com', address: "somewhere over the rainbow", phone: (1111111111 + rand(9999999999)).to_s, name: "Mr. Kangaroo", password: "k", password_confirmation: "k"},
    { email: 'l@l.com', address: "somewhere over the rainbow", phone: (1111111111 + rand(9999999999)).to_s, name: "Mr. Llama", password: "l", password_confirmation: "l"},
    { email: 'm@m.com', address: "somewhere over the rainbow", phone: (1111111111 + rand(9999999999)).to_s, name: "Mr. Mouse", password: "m", password_confirmation: "m"},
    { email: 'n@n.com', address: "somewhere over the rainbow", phone: (1111111111 + rand(9999999999)).to_s, name: "Mr. Numbat", password: "n", password_confirmation: "n"},
    { email: 'o@o.com', address: "somewhere over the rainbow", phone: (1111111111 + rand(9999999999)).to_s, name: "Mr. Opossum", password: "o", password_confirmation: "o"},
    { email: 'p@p.com', address: "somewhere over the rainbow", phone: (1111111111 + rand(9999999999)).to_s, name: "Mr. Peacock", password: "p", password_confirmation: "p"},
    { email: 'q@q.com', address: "somewhere over the rainbow", phone: (1111111111 + rand(9999999999)).to_s, name: "Mr. Quail", password: "q", password_confirmation: "q"},
    { email: 'r@r.com', address: "somewhere over the rainbow", phone: (1111111111 + rand(9999999999)).to_s, name: "Mr. Rabbit", password: "r", password_confirmation: "r"},
    { email: 's@s.com', address: "somewhere over the rainbow", phone: (1111111111 + rand(9999999999)).to_s, name: "Mr. Snake", password: "s", password_confirmation: "s"},
    { email: 't@t.com', address: "somewhere over the rainbow", phone: (1111111111 + rand(9999999999)).to_s, name: "Mr. Tiger", password: "t", password_confirmation: "t"},
    { email: 'u@u.com', address: "somewhere over the rainbow", phone: (1111111111 + rand(9999999999)).to_s, name: "Mr. Urial", password: "u", password_confirmation: "u"},
    { email: 'v@v.com', address: "somewhere over the rainbow", phone: (1111111111 + rand(9999999999)).to_s, name: "Mr. Vulture", password: "v", password_confirmation: "v"},
    { email: 'w@w.com', address: "somewhere over the rainbow", phone: (1111111111 + rand(9999999999)).to_s, name: "Mr. Wombat", password: "w", password_confirmation: "w"},
    { email: 'x@x.com', address: "somewhere over the rainbow", phone: (1111111111 + rand(9999999999)).to_s, name: "Mr. Xenons", password: "x", password_confirmation: "x"},
    { email: 'y@y.com', address: "somewhere over the rainbow", phone: (1111111111 + rand(9999999999)).to_s, name: "Mr. Yak", password: "y", password_confirmation: "y"},
    { email: 'z@z.com', address: "somewhere over the rainbow", phone: (1111111111 + rand(9999999999)).to_s, name: "Mr. Zebra", password: "z", password_confirmation: "z"},
  ]
)

(1..100).each do |n|
  actNum = (111111111 + rand(999999999))
  user = (1 + rand(26))
  accts = Account.create (
   [
     { acctNumber: actNum, balance: (rand * (100000 - 0) + 0 ), acctType: (1 + rand(2)) }
   ]
  )
  user_accts = UserAccount.create (
    [
      { user_id: user, account_id: (1 + rand(100)) },
      { user_id: (1 + rand(26)), account_id: actNum }
    ]
  )
end
