use ('productDB')

db.products.insertMany([
  { _id: 1, name: "Laptop", category: "Electronics", price: 50000, stock: 10 },
  { _id: 2, name: "Phone", category: "Electronics", price: 20000, stock: 15 },
  { _id: 3, name: "Headphones", category: "Electronics", price: 2000, stock: 25 },
  { _id: 4, name: "Shoes", category: "Fashion", price: 3000, stock: 20 },
  { _id: 5, name: "T-Shirt", category: "Fashion", price: 800, stock: 50 },
  { _id: 6, name: "Watch", category: "Accessories", price: 2500, stock: 18 },
  { _id: 7, name: "Bag", category: "Accessories", price: 1500, stock: 22 },
  { _id: 8, name: "Tablet", category: "Electronics", price: 30000, stock: 8 }
])

db.reviews.insertMany([
  { product_id: 1, user: "Afsar", rating: 5, comment: "Excellent" },
  { product_id: 1, user: "Rahul", rating: 4, comment: "Good" },
  { product_id: 2, user: "Kumar", rating: 3, comment: "Average" },
  { product_id: 2, user: "Arun", rating: 4, comment: "Nice" },
  { product_id: 3, user: "Vijay", rating: 5, comment: "Great sound" },
  { product_id: 3, user: "Ajay", rating: 4, comment: "Worth it" },
  { product_id: 4, user: "Mani", rating: 3, comment: "Okay" },
  { product_id: 5, user: "Siva", rating: 4, comment: "Comfortable" }
])

db.products.find({ category: "Electronics" })

db.reviews.find({ product_id: 1 }).sort({ rating: -1 })

db.reviews.aggregate([
  { $group: { _id: "$product_id", avg_rating: { $avg: "$rating" } } }
])

db.products.find({ price: { $gte: 1000, $lte: 30000 } })

db.products.updateOne(
  { _id: 1 },
  { $set: { stock: 12 } }
)