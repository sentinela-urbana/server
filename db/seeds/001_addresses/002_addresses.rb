require "faker"

region = Region.first

PostalCode.where(region:).each do |postal_code|
  spot = Spot.create!(region:)
  spot.create_address(
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude,
    complement: Faker::Address.secondary_address,
    postal_code:
  )

  spot.save!
end
