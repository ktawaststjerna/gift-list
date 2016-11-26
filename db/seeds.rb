Family.create(name: "McMahon")
Family.create(name: "Tawaststjerna")

User.create(name: "Kevin", password: "test")
User.create(name: "Andrew", password: "test")
User.create(name: "Charlotte", password: "test")
User.create(name: "Dale", password: "test")
User.create(name: "Leonard", password: "test")
User.create(name: "Heather", password: "test")
User.create(name: "D'Arcy", password: "test")

Pipe.create(to_type: "User", to_id: 1, from_type: "Family", from_id: 1)
Pipe.create(to_type: "User", to_id: 1, from_type: "Family", from_id: 2)

Pipe.create(to_type: "User", to_id: 2, from_type: "Family", from_id: 1)
Pipe.create(to_type: "User", to_id: 2, from_type: "Family", from_id: 2)

Pipe.create(to_type: "User", to_id: 3, from_type: "Family", from_id: 1)
Pipe.create(to_type: "User", to_id: 3, from_type: "Family", from_id: 2)

Pipe.create(to_type: "User", to_id: 4, from_type: "Family", from_id: 1)

Pipe.create(to_type: "User", to_id: 5, from_type: "Family", from_id: 2)

Pipe.create(to_type: "User", to_id: 6, from_type: "Family", from_id: 2)

Pipe.create(to_type: "User", to_id: 7, from_type: "Family", from_id: 2)
