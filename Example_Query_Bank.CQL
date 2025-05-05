// Create Nodes
CREATE (:Bank {id: "B1", name: "Chase Bank"});
CREATE (:Bank {id: "B2", name: "Bank of America"});
CREATE (:StockMarket {id: "S1", name: "NYSE"});
CREATE (:StockMarket {id: "S2", name: "NASDAQ"});
CREATE (:PaymentProcessor {id: "P1", name: "PayPal"});
CREATE (:PaymentProcessor {id: "P2", name: "Stripe"});
CREATE (:RegulatoryBody {id: "R1", name: "SEC"});
CREATE (:RegulatoryBody {id: "R2", name: "FDIC"});
CREATE (:InvestmentFirm {id: "I1", name: "Goldman Sachs"});
CREATE (:InvestmentFirm {id: "I2", name: "Morgan Stanley"});
CREATE (:Customer {id: "C1", name: "Alice Johnson"});
CREATE (:Customer {id: "C2", name: "Bob Smith"});

// Create Relationships
// Banks providing services to customers
MATCH (b:Bank {name: "Chase Bank"}), (c:Customer {name: "Alice Johnson"})
CREATE (b)-[:PROVIDES_SERVICE]->(c);
MATCH (b:Bank {name: "Bank of America"}), (c:Customer {name: "Bob Smith"})
CREATE (b)-[:PROVIDES_SERVICE]->(c);
// Payment processors partnering with banks
MATCH (p:PaymentProcessor {name: "PayPal"}), (b:Bank {name: "Chase Bank"})
CREATE (p)-[:PARTNERS_WITH]->(b);
MATCH (p:PaymentProcessor {name: "Stripe"}), (b:Bank {name: "Bank of America"})
CREATE (p)-[:PARTNERS_WITH]->(b);
// Stock markets being regulated by regulatory bodies
MATCH (s:StockMarket {name: "NYSE"}), (r:RegulatoryBody {name: "SEC"})
CREATE (s)-[:REGULATED_BY]->(r);
MATCH (s:StockMarket {name: "NASDAQ"}), (r:RegulatoryBody {name: "SEC"})
CREATE (s)-[:REGULATED_BY]->(r);
// Investment firms investing in stock markets
MATCH (i:InvestmentFirm {name: "Goldman Sachs"}), (s:StockMarket {name: "NYSE"})
CREATE (i)-[:INVESTS_IN]->(s);
MATCH (i:InvestmentFirm {name: "Morgan Stanley"}), (s:StockMarket {name: "NASDAQ"})
CREATE (i)-[:INVESTS_IN]->(s);

// Customers transacting through payment processors
MATCH (c:Customer {name: "Alice Johnson"}), (p:PaymentProcessor {name: "PayPal"})
CREATE (c)-[:TRANSACTS_WITH]->(p);
MATCH (c:Customer {name: "Bob Smith"}), (p:PaymentProcessor {name: "Stripe"})
CREATE (c)-[:TRANSACTS_WITH]->(p);
// Regulatory bodies overseeing payment processors
MATCH (p:PaymentProcessor {name: "PayPal"}), (r:RegulatoryBody {name: "FDIC"})
CREATE (r)-[:REGULATES]->(p);
MATCH (p:PaymentProcessor {name: "Stripe"}), (r:RegulatoryBody {name: "FDIC"})
CREATE (r)-[:REGULATES]->(p);
