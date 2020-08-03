tecnologia = Category.create!(name: 'Tecnologia')
moda = Category.create!(name: 'Moda')

autor = User.create!(email: 'autor@autor.com', password: '123', password_confirmation: '123');
autor1 = User.create!(email: 'autor1@autor1.com', password: '123', password_confirmation: '123');

Post.create!(title: 'Ruby on Rails', body: 'Descrição Rails', category: tecnologia, user: autor)
Post.create!(title: 'Moda', body: 'Descrição moda', category: moda, user: autor1)