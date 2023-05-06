require "open-uri"

puts "Seeds"
Property.destroy_all
User.destroy_all

User.create!(email: "test@test.com", password: "123456")
User.create!(email: "test_2@test.com", password: "123456")

properties = [
  {
    title: "Campo",
    property_type: 0,
    description: "Casa de campo",
    price: 400,
    comuna: "Test",
    area: 200,
    rooms: 4,
    bathrooms: 2,
    user: User.first,
  },
  {
    title: "Playa",
    property_type: 1,
    description: "Casa de playa",
    price: 400,
    comuna: "Test",
    area: 200,
    rooms: 4,
    bathrooms: 2,
    user: User.last,
  },
  {
    title: "Ciudad",
    property_type: 0,
    description: "Departamento en la ciudad",
    price: 400,
    comuna: "Test",
    area: 200,
    rooms: 4,
    bathrooms: 2,
    user: User.first,
  },
  {
    title: "Gran Mansion",
    property_type: 0,
    description: "Mansion en las afueras de la ciudad",
    price: 400,
    comuna: "Test",
    area: 200,
    rooms: 4,
    bathrooms: 2,
    user: User.last,
  },
  {
    title: "Campo",
    property_type: 1,
    description: "Casa de campo",
    price: 400,
    comuna: "Test",
    area: 200,
    rooms: 4,
    bathrooms: 2,
    user: User.first,
  },
  {
    title: "Campo",
    property_type: 0,
    description: "Casa de campo",
    price: 400,
    comuna: "Test",
    area: 200,
    rooms: 4,
    bathrooms: 2,
    user: User.last,
  },
  {
    title: "Campo",
    property_type: 1,
    description: "Casa de campo",
    price: 400,
    comuna: "Test",
    area: 200,
    rooms: 4,
    bathrooms: 2,
    user: User.first,
  },
  {
    title: "Campo",
    property_type: 0,
    description: "Casa de campo",
    price: 400,
    comuna: "Test",
    area: 200,
    rooms: 4,
    bathrooms: 2,
    user: User.first,
  },
  {
    title: "Campo",
    property_type: 1,
    description: "Casa de campo",
    price: 400,
    comuna: "Test",
    area: 200,
    rooms: 4,
    bathrooms: 2,
    user: User.first,
  },
  {
    title: "Campo",
    property_type: 0,
    description: "Casa de campo",
    price: 400,
    comuna: "Test",
    area: 200,
    rooms: 4,
    bathrooms: 2,
    user: User.last,
  },
]

properties.each do |property_params|
  property = Property.new(property_params)
  file = URI.open("https://static.tokkobroker.com/water_pics/107068807746308055748147392669671913858653841137006818529867832733281774390128.jpg")
  property.photos.attach(io: file, filename: "property.jpg", content_type: "image/jpg")
  property.save!
end
