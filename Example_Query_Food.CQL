// Create Users
CREATE (:User {id: "U1", name: "Emma Smith"});
CREATE (:User {id: "U2", name: "Liam Johnson"});
CREATE (:User {id: "U3", name: "Olivia Brown"});
CREATE (:User {id: "U4", name: "Noah Davis"});
CREATE (:User {id: "U5", name: "Sophia Martinez"});
CREATE (:User {id: "U6", name: "James Wilson"});
CREATE (:User {id: "U7", name: "Mia Garcia"});
CREATE (:User {id: "U8", name: "Ethan Lee"});
CREATE (:User {id: "U9", name: "Isabella Anderson"});
CREATE (:User {id: "U10", name: "Logan Thomas"});
CREATE (:User {id: "U11", name: "Ava Hernandez"});
CREATE (:User {id: "U12", name: "Benjamin Moore"});
CREATE (:User {id: "U13", name: "Charlotte White"});
CREATE (:User {id: "U14", name: "Lucas Hall"});
CREATE (:User {id: "U15", name: "Amelia King"});
CREATE (:User {id: "U16", name: "Harper Scott"});
CREATE (:User {id: "U17", name: "Daniel Young"});
CREATE (:User {id: "U18", name: "Ella Walker"});
CREATE (:User {id: "U19", name: "Matthew Harris"});

// Create Restaurants
CREATE (:Restaurant {id: "R1", name: "Pizza Hut"});
CREATE (:Restaurant {id: "R2", name: "Taco Bell"});
CREATE (:Restaurant {id: "R3", name: "Subway"});
CREATE (:Restaurant {id: "R4", name: "KFC"});
CREATE (:Restaurant {id: "R5", name: "Chipotle"});
CREATE (:Restaurant {id: "R6", name: "Cava"});
CREATE (:Restaurant {id: "R7", name: "Jimmy Johns"};
CREATE (:Restaurant {id: "R8", name: "Dominos"});
CREATE (:Restaurant {id: "R9", name: "Indian Food (any local chain)"});
CREATE (:Restaurant {id: "R10", name: "Panera bread"});

// Create Orders
CREATE (:Order {id: "O1", date: "2024-11-20", total: 30.00});
CREATE (:Order {id: "O2", date: "2024-11-21", total: 12.50});
CREATE (:Order {id: "O3", date: "2024-11-22", total: 25.75});
CREATE (:Order {id: "O4", date: "2024-11-23", total: 18.90});
CREATE (:Order {id: "O5", date: "2024-11-20", total: 22.75});
CREATE (:Order {id: "O6", date: "2024-11-19", total: 15.00});
CREATE (:Order {id: "O7", date: "2024-11-18", total: 40.50});
CREATE (:Order {id: "O8", date: "2024-11-17", total: 12.99});
CREATE (:Order {id: "O9", date: "2024-11-16", total: 9.99});
CREATE (:Order {id: "O10", date: "2024-11-15", total: 29.75});
CREATE (:Order {id: "O11", date: "2024-11-14", total: 18.99});
CREATE (:Order {id: "O12", date: "2024-11-13", total: 24.50});
CREATE (:Order {id: "O13", date: "2024-11-12", total: 35.25});
CREATE (:Order {id: "O14", date: "2024-11-11", total: 45.00});
CREATE (:Order {id: "O15", date: "2024-11-10", total: 28.00});
CREATE (:Order {id: "O16", date: "2024-11-09", total: 19.99});
CREATE (:Order {id: "O17", date: "2024-11-08", total: 50.75});
CREATE (:Order {id: "O18", date: "2024-11-07", total: 22.50});
CREATE (:Order {id: "O19", date: "2024-11-06", total: 11.00});

// Create Items
CREATE (:Item {id: "I1", name: "Large Pepperoni Pizza", price: 20.00});
CREATE (:Item {id: "I2", name: "Taco Combo", price: 10.00});
CREATE (:Item {id: "I3", name: "Footlong Veggie Sandwich", price: 7.50});
CREATE (:Item {id: "I4", name: "Bucket of Chicken", price: 18.90});
CREATE (:Item {id: "I5", name: "Cheesy Gordita Crunch", price: 5.00});
CREATE (:Item {id: "I6", name: "Meatball Marinara Sub", price: 8.25});
CREATE (:Item {id: "I7", name: "Cheese Pizza", price: 15.00});
CREATE (:Item {id: "I8", name: "Burrito Bowl", price: 12.75});
CREATE (:Item {id: "I9", name: "Chicken Sandwich", price: 8.00});
CREATE (:Item {id: "I10", name: "Gyro Wrap", price: 11.00});
CREATE (:Item {id: "I11", name: "Tacos Al Pastor", price: 10.00});
CREATE (:Item {id: "I12", name: "Chicken Caesar Salad", price: 14.99});
CREATE (:Item {id: "I13", name: "Italian Sub", price: 8.50});
CREATE (:Item {id: "I14", name: "Garlic Knots", price: 5.00});
CREATE (:Item {id: "I15", name: "Butter Chicken", price: 13.25});
CREATE (:Item {id: "I16", name: "Bagel Sandwich", price: 6.00});

// Relationships
// Emma placed an order containing a Large Pepperoni Pizza from Pizza Hut
MATCH (u:User {id: "U1"}), (o:Order {id: "O1"}), (i:Item {id: "I1"}), (r:Restaurant {id: "R1"})
CREATE (u)-[:PLACED]->(o)
CREATE (o)-[:CONTAINS]->(i)
CREATE (i)-[:SERVED_BY]->(r);
// Liam placed an order containing a Taco Combo and Cheesy Gordita Crunch from Taco Bell
MATCH (u:User {id: "U2"}), (o:Order {id: "O2"}), (i1:Item {id: "I2"}), (i2:Item {id: "I5"}),
(r:Restaurant {id: "R2"})
CREATE (u)-[:PLACED]->(o)
CREATE (o)-[:CONTAINS]->(i1)
CREATE (o)-[:CONTAINS]->(i2)
CREATE (i1)-[:SERVED_BY]->(r)
CREATE (i2)-[:SERVED_BY]->(r);

// Olivia placed an order containing a Footlong Veggie Sandwich and Meatball Marinara Sub
from Subway
MATCH (u:User {id: "U3"}), (o:Order {id: "O3"}), (i1:Item {id: "I3"}), (i2:Item {id: "I6"}),
(r:Restaurant {id: "R3"})
CREATE (u)-[:PLACED]->(o)
CREATE (o)-[:CONTAINS]->(i1)
CREATE (o)-[:CONTAINS]->(i2)
CREATE (i1)-[:SERVED_BY]->(r)
CREATE (i2)-[:SERVED_BY]->(r);
// Noah placed an order containing a Bucket of Chicken from KFC
MATCH (u:User {id: "U4"}), (o:Order {id: "O4"}), (i:Item {id: "I4"}), (r:Restaurant {id: "R4"})
CREATE (u)-[:PLACED]->(o)
CREATE (o)-[:CONTAINS]->(i)
CREATE (i)-[:SERVED_BY]->(r);

//Repeat with random orders and items
MATCH (u:User {id: "U5"}), (o:Order {id: "O5"}), (i:Item {id: "I7"}), (r:Restaurant {id: "R1"})
CREATE (u)-[:PLACED]->(o)
CREATE (o)-[:CONTAINS]->(i)
CREATE (i)-[:SERVED_BY]->(r);

MATCH (u:User {id: "U6"}), (o:Order {id: "O6"}), (i:Item {id: "I8"}), (r:Restaurant {id: "R5"})
CREATE (u)-[:PLACED]->(o)
CREATE (o)-[:CONTAINS]->(i)
CREATE (i)-[:SERVED_BY]->(r);
MATCH (u:User {id: "U7"}), (o:Order {id: "O7"}), (i:Item {id: "I9"}), (r:Restaurant {id: "R4"})
CREATE (u)-[:PLACED]->(o)
CREATE (o)-[:CONTAINS]->(i)
CREATE (i)-[:SERVED_BY]->(r);
MATCH (u:User {id: "U8"}), (o:Order {id: "O8"}), (i:Item {id: "I10"}), (r:Restaurant {id: "R6"})
CREATE (u)-[:PLACED]->(o)
CREATE (o)-[:CONTAINS]->(i)
CREATE (i)-[:SERVED_BY]->(r);
MATCH (u:User {id: "U9"}), (o:Order {id: "O9"}), (i:Item {id: "I11"}), (r:Restaurant {id: "R2"})
CREATE (u)-[:PLACED]->(o)
CREATE (o)-[:CONTAINS]->(i)
CREATE (i)-[:SERVED_BY]->(r);

MATCH (u:User {id: "U10"}), (o:Order {id: "O10"}), (i:Item {id: "I12"}), (r:Restaurant {id: "R10"})
CREATE (u)-[:PLACED]->(o)
CREATE (o)-[:CONTAINS]->(i)
CREATE (i)-[:SERVED_BY]->(r);
MATCH (u:User {id: "U11"}), (o:Order {id: "O11"}), (i:Item {id: "I13"}), (r:Restaurant {id: "R7"})
CREATE (u)-[:PLACED]->(o)
CREATE (o)-[:CONTAINS]->(i)
CREATE (i)-[:SERVED_BY]->(r);
MATCH (u:User {id: "U12"}), (o:Order {id: "O12"}), (i:Item {id: "I14"}), (r:Restaurant {id: "R8"})
CREATE (u)-[:PLACED]->(o)
CREATE (o)-[:CONTAINS]->(i)
CREATE (i)-[:SERVED_BY]->(r);
MATCH (u:User {id: "U13"}), (o:Order {id: "O13"}), (i:Item {id: "I15"}), (r:Restaurant {id: "R9"})
CREATE (u)-[:PLACED]->(o)
CREATE (o)-[:CONTAINS]->(i)
CREATE (i)-[:SERVED_BY]->(r);
MATCH (u:User {id: "U14"}), (o:Order {id: "O14"}), (i:Item {id: "I16"}), (r:Restaurant {id: "R10"})
CREATE (u)-[:PLACED]->(o)
CREATE (o)-[:CONTAINS]->(i)
CREATE (i)-[:SERVED_BY]->(r);

MATCH (u:User {id: "U15"}), (o:Order {id: "O15"}), (i:Item {id: "I7"}), (r:Restaurant {id: "R1"})
CREATE (u)-[:PLACED]->(o)
CREATE (o)-[:CONTAINS]->(i)
CREATE (i)-[:SERVED_BY]->(r);
MATCH (u:User {id: "U16"}), (o:Order {id: "O16"}), (i:Item {id: "I8"}), (r:Restaurant {id: "R5"})
CREATE (u)-[:PLACED]->(o)
CREATE (o)-[:CONTAINS]->(i)
CREATE (i)-[:SERVED_BY]->(r);
MATCH (u:User {id: "U17"}), (o:Order {id: "O17"}), (i:Item {id: "I9"}), (r:Restaurant {id: "R4"})
CREATE (u)-[:PLACED]->(o)
CREATE (o)-[:CONTAINS]->(i)
CREATE (i)-[:SERVED_BY]->(r);
MATCH (u:User {id: "U18"}), (o:Order {id: "O18"}), (i:Item {id: "I10"}), (r:Restaurant {id: "R6"})
CREATE (u)-[:PLACED]->(o)
CREATE (o)-[:CONTAINS]->(i)
CREATE (i)-[:SERVED_BY]->(r);

MATCH (u:User {id: "U19"}), (o:Order {id: "O19"}), (i:Item {id: "I11"}), (r:Restaurant {id: "R2"})
CREATE (u)-[:PLACED]->(o)
CREATE (o)-[:CONTAINS]->(i)
CREATE (i)-[:SERVED_BY]->(r);



