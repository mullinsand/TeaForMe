# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

customer1 = Customer.create!(first_name: 'bob', last_name: 'fred', email: 'asdfasdf', address: 'asdlkfhjasd', api_key: 123456)

sub1 = Subscription.create!(title: 'asdf', price: '1232', frequency: '12')

tea1 = Tea.create!(title: 'asdfasdf', description: 'asdkljasdfhjkasfhjkasfgkhasdfghujk', brew_time: '12', temperature: '123')

cust_sub = CustomersSubscription.create!(customer_id: customer1.id, subscription_id: sub1.id, status: 0)
sub_tea = SubscriptionsTea.create!(subscription_id: sub1.id, tea_id: tea1.id)