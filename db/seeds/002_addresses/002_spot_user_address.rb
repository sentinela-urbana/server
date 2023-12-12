require 'faker'

region = Region.first

postal_code = PostalCode.where(region:).first

user = User.create(
  name: 'Spot number 1',
  last_name: 'Spot',
  taxpayer_registry: '99914010033',
  role: 'spot',
  email: 'spot@email.com',
  password: '123456',
  password_confirmation: '123456'
)

spot = Spot.create!(region:, user:)
spot.create_address(
  latitude: Faker::Address.latitude,
  longitude: Faker::Address.longitude,
  complement: Faker::Address.secondary_address,
  postal_code:
)

region = Region.last

user = User.create(
  name: 'Spot number 2',
  last_name: 'Spot',
  taxpayer_registry: '99914010023',
  role: 'spot',
  email: 'spot+2@email.com',
  password: '123456',
  password_confirmation: '123456'
)

postal_code = PostalCode.where(region:).first

spot = Spot.create!(region:, user:)

spot.create_address(
  latitude: Faker::Address.latitude,
  longitude: Faker::Address.longitude,
  complement: Faker::Address.secondary_address,
  postal_code:
)
