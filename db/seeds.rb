Family.create(name: 'McMahon')
Family.create(name: 'Tawaststjerna')

User.create(name: 'kevin', password: 'test')
User.create(name: 'andrew', password: 'test')
User.create(name: 'charlotte', password: 'test')
User.create(name: 'dale', password: 'test')
User.create(name: 'leonard', password: 'test')
User.create(name: 'heather', password: 'test')
User.create(name: 'darcy', password: 'test')

Pipe.create(to_type: 'User', to_id: 1, from_type: 'Family', from_id: 1)
Pipe.create(to_type: 'User', to_id: 1, from_type: 'Family', from_id: 2)

Pipe.create(to_type: 'User', to_id: 2, from_type: 'Family', from_id: 1)
Pipe.create(to_type: 'User', to_id: 2, from_type: 'Family', from_id: 2)

Pipe.create(to_type: 'User', to_id: 3, from_type: 'Family', from_id: 1)
Pipe.create(to_type: 'User', to_id: 3, from_type: 'Family', from_id: 2)

Pipe.create(to_type: 'User', to_id: 4, from_type: 'Family', from_id: 1)

Pipe.create(to_type: 'User', to_id: 5, from_type: 'Family', from_id: 2)

Pipe.create(to_type: 'User', to_id: 6, from_type: 'Family', from_id: 2)

Pipe.create(to_type: 'User', to_id: 7, from_type: 'Family', from_id: 2)
