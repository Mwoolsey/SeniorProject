# functions for getting random numbers
def rand_int(from, to)
  rand_in_range(from, to).to_i
end
def rand_price(from, to)
  rand_in_range(from, to).round(2)
end
def rand_time(from, to=Time.now)
  Time.at(rand_in_range(from.to_f, to.to_f))
end
def rand_in_range(from, to)
  rand * (to - from) + from
end
#-------------------------------------------------------------------------------

# create users from Tyson's examples, just added some extra stuff
users = User.create(
  [
    { email: 'a@a.com', address: "somewhere over the rainbow", phone: rand(1111111111..9999999999).to_s, name: "Mr. Aardvark", password: "a", password_confirmation: "a", ssn: rand_int(111111111,999999999)},
    { email: 'b@b.com', address: "somewhere over the rainbow", phone: rand(1111111111..9999999999).to_s, name: "Mr. Bear", password: "b", password_confirmation: "b", ssn: rand_int(111111111,999999999)},
    { email: 'c@c.com', address: "somewhere over the rainbow", phone: rand(1111111111..9999999999).to_s, name: "Mr. Cat", password: "c", password_confirmation: "c", ssn: rand_int(111111111,999999999)},
    { email: 'd@d.com', address: "somewhere over the rainbow", phone: rand(1111111111..9999999999).to_s, name: "Mr. Dog", password: "d", password_confirmation: "d", ssn: rand_int(111111111,999999999)},
    { email: 'e@e.com', address: "somewhere over the rainbow", phone: rand(1111111111..9999999999).to_s, name: "Mr. Elephant", password: "e", password_confirmation: "e", ssn: rand_int(111111111,999999999)},
    { email: 'f@f.com', address: "somewhere over the rainbow", phone: rand(1111111111..9999999999).to_s, name: "Mr. Fox", password: "f", password_confirmation: "f", ssn: rand_int(111111111,999999999)},
    { email: 'g@g.com', address: "somewhere over the rainbow", phone: rand(1111111111..9999999999).to_s, name: "Mr. Gopher", password: "g", password_confirmation: "g", ssn: rand_int(111111111,999999999)},
    { email: 'h@h.com', address: "somewhere over the rainbow", phone: rand(1111111111..9999999999).to_s, name: "Mr. Horse", password: "h", password_confirmation: "h", ssn: rand_int(111111111,999999999)},
    { email: 'i@i.com', address: "somewhere over the rainbow", phone: rand(1111111111..9999999999).to_s, name: "Mr. Iguana", password: "i", password_confirmation: "i", ssn: rand_int(111111111,999999999)},
    { email: 'j@j.com', address: "somewhere over the rainbow", phone: rand(1111111111..9999999999).to_s, name: "Mr. Jackrabbit", password: "j", password_confirmation: "j", ssn: rand_int(111111111,999999999)},
    { email: 'k@k.com', address: "somewhere over the rainbow", phone: rand(1111111111..9999999999).to_s, name: "Mr. Kangaroo", password: "k", password_confirmation: "k", ssn: rand_int(111111111,999999999)},
    { email: 'l@l.com', address: "somewhere over the rainbow", phone: rand(1111111111..9999999999).to_s, name: "Mr. Llama", password: "l", password_confirmation: "l", ssn: rand_int(111111111,999999999)},
    { email: 'm@m.com', address: "somewhere over the rainbow", phone: rand(1111111111..9999999999).to_s, name: "Mr. Mouse", password: "m", password_confirmation: "m", ssn: rand_int(111111111,999999999)},
    { email: 'n@n.com', address: "somewhere over the rainbow", phone: rand(1111111111..9999999999).to_s, name: "Mr. Numbat", password: "n", password_confirmation: "n", ssn: rand_int(111111111,999999999)},
    { email: 'o@o.com', address: "somewhere over the rainbow", phone: rand(1111111111..9999999999).to_s, name: "Mr. Opossum", password: "o", password_confirmation: "o", ssn: rand_int(111111111,999999999)},
    { email: 'p@p.com', address: "somewhere over the rainbow", phone: rand(1111111111..9999999999).to_s, name: "Mr. Peacock", password: "p", password_confirmation: "p", ssn: rand_int(111111111,999999999)},
    { email: 'q@q.com', address: "somewhere over the rainbow", phone: rand(1111111111..9999999999).to_s, name: "Mr. Quail", password: "q", password_confirmation: "q", ssn: rand_int(111111111,999999999)},
    { email: 'r@r.com', address: "somewhere over the rainbow", phone: rand(1111111111..9999999999).to_s, name: "Mr. Rabbit", password: "r", password_confirmation: "r", ssn: rand_int(111111111,999999999)},
    { email: 's@s.com', address: "somewhere over the rainbow", phone: rand(1111111111..9999999999).to_s, name: "Mr. Snake", password: "s", password_confirmation: "s", ssn: rand_int(111111111,999999999)},
    { email: 't@t.com', address: "somewhere over the rainbow", phone: rand(1111111111..9999999999).to_s, name: "Mr. Tiger", password: "t", password_confirmation: "t", ssn: rand_int(111111111,999999999)},
    { email: 'u@u.com', address: "somewhere over the rainbow", phone: rand(1111111111..9999999999).to_s, name: "Mr. Urial", password: "u", password_confirmation: "u", ssn: rand_int(111111111,999999999)},
    { email: 'v@v.com', address: "somewhere over the rainbow", phone: rand(1111111111..9999999999).to_s, name: "Mr. Vulture", password: "v", password_confirmation: "v", ssn: rand_int(111111111,999999999)},
    { email: 'w@w.com', address: "somewhere over the rainbow", phone: rand(1111111111..9999999999).to_s, name: "Mr. Wombat", password: "w", password_confirmation: "w", ssn: rand_int(111111111,999999999)},
    { email: 'x@x.com', address: "somewhere over the rainbow", phone: rand(1111111111..9999999999).to_s, name: "Mr. Xenons", password: "x", password_confirmation: "x", ssn: rand_int(111111111,999999999)},
    { email: 'y@y.com', address: "somewhere over the rainbow", phone: rand(1111111111..9999999999).to_s, name: "Mr. Yak", password: "y", password_confirmation: "y", ssn: rand_int(111111111,999999999)},
    { email: 'z@z.com', address: "somewhere over the rainbow", phone: rand(1111111111..9999999999).to_s, name: "Mr. Zebra", password: "z", password_confirmation: "z", ssn: rand_int(111111111,999999999)},
  ]
)

# create an array of 500 transaction locations to choose from
transactions = Array.new(500) {Array.new}
locationNumber = (0...9999).to_a.shuffle.take(500)
businesses = File.readlines("db/businesses.txt")
cities = File.readlines("db/cities.txt")
transactions.each_with_index do |t,i| 
  t << "POS PURCHASE MERCHANT PURCHASE TERMINAL,"
  t << "%04d" % locationNumber[i] + ","
  t << businesses[rand_int(0,businesses.size - 1)].chomp + ","
  t << cities[rand_int(0,cities.size - 1)].chomp + ","
  t << "CA\n"
end
#-------------------------------------------------------------------------------
File.delete("db/transactions.txt")
open('db/transactions.txt', 'a') do |f|
  transactions.each do |t|
    f << t.join("")
  end
end
# create accounts and user_accounts join table
actNum = 100000000
(1..100).each do |n|
  actNum += 1
  user = (1 + rand(26))
  accts = Account.create (
   [
     { balance: (rand * (100000 - 0) + 0 ), acctType: (1 + rand(2)), user_id: user }
   ]
  )
  accts.first.balance
  unless (user2 = (1 + rand(26))) == user
    user_accts = UserAccount.create (
      [
	{ user_id: user2, account_id: actNum }
      ]
    )
  end

  created = Time.now - 59.days
  type = accts.first.acctType
  # create 100 transactions for each account
  (1..100).each do |x|
    created += 4.hours
    #created = rand_time(60.days.ago)
    if ((x % 10 == 0) || (accts.first.acctType == 1))
      amt = rand_price(100,1000)
      accts.first.balance = accts.first.balance + amt
      trans = Transaction.create (
	[
	  { description: "Deposit", amount: amt, status: "complete", account_id: actNum, created_at: created, currentBalance: accts.first.balance }
	]
      )
    else
      amt = (rand_price(0.01, 500))
      accts.first.balance = accts.first.balance - amt
      trans = Transaction.create (
	[
	  { description: transactions.sample.join(" ").gsub(',',''), amount: (amt * -1), status: "complete", account_id: actNum, created_at: created, currentBalance: accts.first.balance }
	]
      )
    end
  end
      accts.first.save!
end
