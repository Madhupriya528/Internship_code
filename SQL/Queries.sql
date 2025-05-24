-- 1. Display snum, sname, city and comm of all salespeople.
SELECT snum, sname, city, comm
FROM SALESPEOPLE;

-- 2. Display all snum without duplicates from all orders.
SELECT DISTINCT snum 
FROM ORDERS;

-- 3. Display names and commissions of all salespeople in London.
SELECT sname, comm
FROM SALESPEOPLE
WHERE city = 'London';

-- 4. All customers with rating of 100.
SELECT cname 
FROM CUST
WHERE rating = 100;

-- 5. Produce orderno, amount and date from all rows in the order table.
SELECT ONUM, amt, odate
FROM ORDERS;

-- 6. All customers in San Jose, who have rating more than 200.
SELECT cname
FROM CUST
WHERE rating > 200;

-- 7. All customers who were either located in San Jose or had a rating above 200.
SELECT cname
FROM CUST
WHERE city = 'San Jose' OR rating > 200;

-- 8. All orders for more than $1000.
SELECT * 
FROM ORDERS
WHERE amt > 1000;

-- 9. Names and cities of all salespeople in London with commission above 0.10.
SELECT sname, city
FROM SALESPEOPLE
WHERE comm > 0.10 AND city = 'London';

-- 10. All customers excluding those with rating <= 100 unless they are located in Rome.
SELECT cname
FROM CUST
WHERE rating <= 100 OR city = 'Rome';

-- 11. All salespeople either in Barcelona or in London.
SELECT sname, city
FROM SALESPEOPLE
WHERE city IN ('Barcelona', 'London');

-- 12. All salespeople with commission between 0.10 and 0.12. (Boundary values should be excluded)
SELECT sname, comm
FROM SALESPEOPLE
WHERE comm > 0.10 AND comm < 0.12;

-- 13. All customers with NULL values in city column.
SELECT cname
FROM CUST
WHERE city IS NULL;

-- 14. All orders taken on Oct 3rd and Oct 4th 1994.
SELECT *
FROM ORDERS 
WHERE odate IN ('03-OCT-94', '04-OCT-94');

-- 15. All customers serviced by Peel or Motika.
SELECT cname
FROM CUST, ORDERS
WHERE ORDERS.cnum = CUST.cnum AND ORDERS.snum IN 
    (SELECT snum FROM SALESPEOPLE WHERE sname IN ('Peel', 'Motika'));

-- 16. All customers whose names begin with a letter from A to B.
SELECT cname
FROM CUST
WHERE cname LIKE 'A%' OR cname LIKE 'B%';

-- 17. All orders except those with 0 or NULL value in amt field.
SELECT onum
FROM ORDERS
WHERE amt != 0 OR amt IS NOT NULL;

-- 18. Count the number of salespeople currently listing orders in the order table.
SELECT COUNT(DISTINCT snum)
FROM ORDERS;

-- 19. Largest order taken by each salesperson, datewise.
SELECT odate, snum, MAX(amt)
FROM ORDERS
GROUP BY odate, snum
ORDER BY odate, snum;

-- 20. Largest order taken by each salesperson with order value more than $3000.
SELECT odate, snum, MAX(amt)
FROM ORDERS
WHERE amt > 3000
GROUP BY odate, snum
ORDER BY odate, snum;

-- 21. Which day had the highest total amount ordered.
SELECT odate, amt, snum, cnum
FROM ORDERS
WHERE amt = (SELECT MAX(amt) FROM ORDERS);

-- 22. Count all orders for Oct 3rd.
SELECT COUNT(*)
FROM ORDERS
WHERE odate = '03-OCT-94';

-- 23. Count the number of different non NULL city values in customers table.
SELECT COUNT(DISTINCT city)
FROM CUST;

-- 24. Select each customer’s smallest order.
SELECT cnum, MIN(amt)
FROM ORDERS
GROUP BY cnum;

-- 25. First customer in alphabetical order whose name begins with G.
SELECT MIN(cname)
FROM CUST
WHERE cname LIKE 'G%';

-- 26. Get the output like “For dd/mm/yy there are ___ orders.”
SELECT 'For ' || strftime('%d/%m/%y', odate) || ' there are ' || COUNT(*) || ' Orders'
FROM ORDERS
GROUP BY odate;

-- 27. Assume that each salesperson has a 12% commission. Produce order no., salesperson no., and amount of salesperson’s commission for that order.
SELECT onum, snum, amt, amt * 0.12
FROM ORDERS
ORDER BY snum;

-- 28. Find highest rating in each city. Put the output in this form. For the city (city), the highest rating is : (rating).
SELECT 'For the city (' || city || '), the highest rating is : (' || MAX(rating) || ')'
FROM CUST
GROUP BY city;

-- 29. Display the totals of orders for each day and place the results in descending order.
SELECT odate, COUNT(onum)
FROM ORDERS
GROUP BY odate
ORDER BY COUNT(onum) DESC;

-- 30. All combinations of salespeople and customers who shared a city. (i.e. same city).
SELECT sname, cname
FROM SALESPEOPLE, CUST
WHERE SALESPEOPLE.city = CUST.city;

-- 31. Name of all customers matched with the salespeople serving them.
SELECT cname, sname
FROM CUST, SALESPEOPLE
WHERE CUST.snum = SALESPEOPLE.snum;

-- 32. List each order number followed by the name of the customer who made the order.
SELECT onum, cname
FROM ORDERS, CUST
WHERE ORDERS.cnum = CUST.cnum;

-- 33. Names of salesperson and customer for each order after the order number.
SELECT onum, sname, cname
FROM ORDERS, CUST, SALESPEOPLE
WHERE ORDERS.cnum = CUST.cnum AND ORDERS.snum = SALESPEOPLE.snum;

-- 34. Produce all customers serviced by salespeople with a commission above 12%.
SELECT cname, sname, comm
FROM CUST, SALESPEOPLE
WHERE comm > 0.12 AND CUST.snum = SALESPEOPLE.snum;

-- 35. Calculate the amount of the salesperson’s commission on each order with a rating above 100.
SELECT sname, amt * comm
FROM ORDERS, CUST, SALESPEOPLE
WHERE rating > 100 AND SALESPEOPLE.snum = CUST.snum AND SALESPEOPLE.snum = ORDERS.snum AND CUST.cnum = ORDERS.cnum;

-- 36. Find all pairs of customers having the same rating.
SELECT a.cname, b.cname, a.rating
FROM CUST a, CUST b
WHERE a.rating = b.rating AND a.cnum != b.cnum;

-- 37. Find all pairs of customers having the same rating, each pair coming once only.
SELECT a.cname, b.cname, a.rating
FROM CUST a, CUST b
WHERE a.rating = b.rating AND a.cnum != b.cnum AND a.cnum < b.cnum;

-- 38. Policy is to assign three salesperson to each customer. Display all such combinations.
SELECT cname, sname
FROM SALESPEOPLE, CUST
WHERE sname IN (SELECT sname 
                FROM SALESPEOPLE
                WHERE rownum <= 3)
ORDER BY cname;

-- 39. Display all customers located in cities where salesman Serres has a customer.
SELECT cname
FROM CUST
WHERE city = (SELECT city 
              FROM CUST, SALESPEOPLE
              WHERE CUST.snum = SALESPEOPLE.snum AND sname = 'Serres');

SELECT cname 
FROM CUST
WHERE city IN (SELECT city
                FROM CUST, ORDERS
                WHERE CUST.cnum = ORDERS.cnum AND ORDERS.snum IN (SELECT snum FROM SALESPEOPLE WHERE sname = 'Serres'));

-- 40. Find all pairs of customers served by a single salesperson.
SELECT cname FROM CUST
WHERE snum IN (SELECT snum FROM CUST
               GROUP BY snum
               HAVING COUNT(snum) > 1);

SELECT DISTINCT a.cname
FROM CUST a, CUST b
WHERE a.snum = b.snum AND a.rowid != b.rowid;

-- 41. Produce all pairs of salespeople who are living in the same city. Exclude combinations of salespeople with themselves as well as duplicates with the order reversed.
SELECT a.sname, b.sname
FROM SALESPEOPLE a, SALESPEOPLE b
WHERE a.snum > b.snum AND a.city = b.city;

-- 42. Produce all pairs of orders by given customer, names that customers and eliminates duplicates.
SELECT c.cname, a.onum, b.onum
FROM ORDERS a, ORDERS b, CUST c
WHERE a.cnum = b.cnum AND a.onum > b.onum AND c.cnum = a.cnum;

-- 43. Produce names and cities of all customers with the same rating as Hoffman.
SELECT cname, city
FROM CUST
WHERE rating = (SELECT rating
                FROM CUST
                WHERE cname = 'Hoffman')
AND cname != 'Hoffman';

-- 44. Extract all the orders of Motika.
SELECT Onum
FROM ORDERS
WHERE snum = (SELECT snum
              FROM SALESPEOPLE
              WHERE sname = 'Motika');

-- 45. All orders credited to the same salesperson who services Hoffman.
SELECT onum, sname, cname, amt
FROM ORDERS a, SALESPEOPLE b, CUST c
WHERE a.snum = b.snum AND a.cnum = c.cnum AND
      a.snum = (SELECT snum
                FROM ORDERS
                WHERE cnum = (SELECT cnum
                              FROM CUST
                              WHERE cname = 'Hoffman'));

-- 46. All orders that are greater than the average for Oct 4.
SELECT * 
FROM ORDERS
WHERE amt > (SELECT avg(amt) 
             FROM ORDERS
             WHERE odate = '03-OCT-94');

-- 47. Find average commission of salespeople in London.
SELECT avg(comm)
FROM SALESPEOPLE
WHERE city = 'London';

-- 48. Find all orders attributed to salespeople servicing customers in London.
SELECT snum, cnum 
FROM ORDERS
WHERE cnum IN (SELECT cnum 
               FROM CUST
               WHERE city = 'London');

-- 49. Extract commissions of all salespeople servicing customers in London.
SELECT comm 
FROM SALESPEOPLE
WHERE snum IN (SELECT snum
               FROM CUST
               WHERE city = 'London');

-- 50. Find all customers whose cnum is 1000 above the snum of Serres.
SELECT cnum, cname FROM CUST
WHERE cnum > (SELECT snum + 1000 
              FROM SALESPEOPLE
              WHERE sname = 'Serres');

-- 51. Count the customers with rating above San Jose’s average.
SELECT cnum, rating
FROM CUST
WHERE rating > (SELECT avg(rating) 
                FROM CUST
                WHERE city = 'San Jose');

---

52. Obtain all orders for the customer named Cisnerous. (Assume you don’t know his customer no. (cnum)).

SELECT *
FROM Orders
WHERE cnum = (
    SELECT cnum
    FROM Cust
    WHERE cname = 'Cisnerous'
);


---

53. Produce the names and rating of all customers who have above average orders.

SELECT cname, rating
FROM Cust
WHERE cnum IN (
    SELECT cnum
    FROM Orders
    GROUP BY cnum
    HAVING AVG(amt) > (
        SELECT AVG(amt) FROM Orders
    )
);


---

54. Find total amount in orders for each salesperson for whom this total is greater than the amount of the largest order in the table.

SELECT snum, SUM(amt) AS total_amt
FROM Orders
GROUP BY snum
HAVING SUM(amt) > (
    SELECT MAX(amt) FROM Orders
);


---

55. Find all customers with order on 3rd Oct.

SELECT DISTINCT Cust.*
FROM Cust
JOIN Orders ON Cust.cnum = Orders.cnum
WHERE odate = '03-OCT-94';


---

56. Find names and numbers of all salesperson who have more than one customer.

SELECT s.snum, s.sname
FROM Salespeople s
JOIN Cust c ON s.snum = c.snum
GROUP BY s.snum, s.sname
HAVING COUNT(DISTINCT c.cnum) > 1;


---

57. Check if the correct salesperson was credited with each sale.

SELECT *
FROM Orders o
JOIN Cust c ON o.cnum = c.cnum
WHERE o.snum != c.snum;


---

58. Find all orders with above average amounts for their customers.

SELECT *
FROM Orders o
WHERE amt > (
    SELECT AVG(amt)
    FROM Orders o2
    WHERE o2.cnum = o.cnum
);


---

59. Find the sums of the amounts from order table grouped by date, eliminating all those dates where the sum was not at least 2000 above the maximum amount.

SELECT odate, SUM(amt) AS total_amt
FROM Orders
GROUP BY odate
HAVING SUM(amt) >= (
    SELECT MAX(amt) + 2000 FROM Orders
);


---

60. Find names and numbers of all customers with ratings equal to the maximum for their city.

SELECT c1.cnum, c1.cname
FROM Cust c1
WHERE rating = (
    SELECT MAX(c2.rating)
    FROM Cust c2
    WHERE c2.city = c1.city
);


---

61. Find all salespeople who have customers in their cities who they don’t service (both using Join and Correlated subquery).

Using Join:

SELECT DISTINCT s.*
FROM Salespeople s
JOIN Cust c ON s.city = c.city
WHERE s.snum != c.snum;

Using Correlated Subquery:

SELECT *
FROM Salespeople s
WHERE EXISTS (
    SELECT 1
    FROM Cust c
    WHERE c.city = s.city AND c.snum != s.snum
);


---

62. Extract cnum, cname and city from customer table if and only if one or more of the customers are located in San Jose.

SELECT cnum, cname, city
FROM Cust
WHERE EXISTS (
    SELECT 1
    FROM Cust c2
    WHERE c2.city = 'San Jose'
);


---

63. Find salespeople no. who have multiple customers.

SELECT snum
FROM Cust
GROUP BY snum
HAVING COUNT(*) > 1;


---

64. Find salesperson number, name and city who have multiple customers.

SELECT s.snum, s.sname, s.city
FROM Salespeople s
JOIN Cust c ON s.snum = c.snum
GROUP BY s.snum, s.sname, s.city
HAVING COUNT(*) > 1;


---

65. Find salespeople who serve only one customer.

SELECT s.*
FROM Salespeople s
JOIN Cust c ON s.snum = c.snum
GROUP BY s.snum, s.sname, s.city, s.commission
HAVING COUNT(DISTINCT c.cnum) = 1;


---

66. Extract rows of all salespeople with more than one current order.

SELECT s.*
FROM Salespeople s
JOIN Orders o ON s.snum = o.snum
GROUP BY s.snum, s.sname, s.city, s.commission
HAVING COUNT(*) > 1;


---

67. Find all salespeople who have customers with a rating of 300. (Use EXISTS)

SELECT *
FROM Salespeople s
WHERE EXISTS (
    SELECT 1
    FROM Cust c
    WHERE c.snum = s.snum AND c.rating = 300
);


---

68. Find all salespeople who have customers with a rating of 300. (Use JOIN)

SELECT DISTINCT s.*
FROM Salespeople s
JOIN Cust c ON s.snum = c.snum
WHERE c.rating = 300;


---

69. Select all salespeople with customers located in their cities who are not assigned to them. (Use EXISTS)

SELECT *
FROM Salespeople s
WHERE EXISTS (
    SELECT 1
    FROM Cust c
    WHERE c.city = s.city AND c.snum != s.snum
);


---

70. Extract every customer assigned a salesperson who has at least one other customer with orders (besides the selected customer).

SELECT DISTINCT c1.*
FROM Cust c1
WHERE EXISTS (
    SELECT 1
    FROM Cust c2
    JOIN Orders o ON o.cnum = c2.cnum
    WHERE c2.snum = c1.snum AND c2.cnum != c1.cnum
);


---

71. Find salespeople with customers located in their cities (using both ANY and IN).

SELECT *
FROM Salespeople
WHERE city = ANY (
    SELECT city FROM Cust WHERE Cust.snum = Salespeople.snum
)
AND city IN (
    SELECT city FROM Cust
);


---

72. Find all salespeople for whom there are customers that follow them in alphabetical order. (Using ANY and EXISTS)

SELECT *
FROM Salespeople s
WHERE EXISTS (
    SELECT 1
    FROM Cust c
    WHERE c.sname > s.sname
)
AND s.sname < ANY (
    SELECT cname FROM Cust
);


---

73. Select customers who have a greater rating than any customer in Rome.

SELECT *
FROM Cust
WHERE rating > ANY (
    SELECT rating
    FROM Cust
    WHERE city = 'Rome'
);


---

74. Select all orders with amounts greater than at least one of the orders from Oct 6.

SELECT *
FROM Orders
WHERE amt > ANY (
    SELECT amt
    FROM Orders
    WHERE odate = '06-OCT-94'
);


---

75. Find all orders with amounts smaller than any amount for a customer in San Jose.

Using ANY:

SELECT *
FROM Orders
WHERE amt < ANY (
    SELECT amt
    FROM Orders o
    JOIN Cust c ON o.cnum = c.cnum
    WHERE c.city = 'San Jose'
);

Without using ANY:

SELECT *
FROM Orders o1
WHERE EXISTS (
    SELECT 1
    FROM Orders o2
    JOIN Cust c ON o2.cnum = c.cnum
    WHERE c.city = 'San Jose' AND o1.amt < o2.amt
);


---

76. Select those customers whose ratings are higher than every customer in Paris. (Using both ALL and NOT EXISTS)

Using ALL:

SELECT *
FROM Cust
WHERE rating > ALL (
    SELECT rating
    FROM Cust
    WHERE city = 'Paris'
);

Using NOT EXISTS:

SELECT *
FROM Cust c1
WHERE NOT EXISTS (
    SELECT 1
    FROM Cust c2
    WHERE c2.city = 'Paris' AND c1.rating <= c2.rating
);


---

77. Select all customers whose ratings are equal to or greater than ANY of the Seeres.

SELECT *
FROM Cust
WHERE rating >= ANY (
    SELECT rating
    FROM Cust
    WHERE cname = 'Seeres'
);


---

78. Find all salespeople who have no customers located in their city. (Both using ANY and ALL)

Using ALL:

SELECT *
FROM Salespeople
WHERE city != ALL (
    SELECT city FROM Cust WHERE Cust.snum = Salespeople.snum
);

Using ANY (logic inversion):

SELECT *
FROM Salespeople s
WHERE NOT EXISTS (
    SELECT 1
    FROM Cust c
    WHERE s.snum = c.snum AND s.city = c.city
);


---

79. Find all orders for amounts greater than any for the customers in London.

SELECT *
FROM Orders
WHERE amt > ANY (
    SELECT amt
    FROM Orders o
    JOIN Cust c ON o.cnum = c.cnum
    WHERE c.city = 'London'
);

---

80. Find all orders with amounts larger than any amount for a customer in San Jose.

SELECT *
FROM Orders
WHERE amt > ANY (
    SELECT amt
    FROM Orders o
    JOIN Cust c ON o.cnum = c.cnum
    WHERE c.city = 'San Jose'
);


---

81. Find all salespeople who have customers in their cities but were not assigned to them (both using JOIN and EXISTS).

Using JOIN:

SELECT DISTINCT s.*
FROM Salespeople s
JOIN Cust c ON s.city = c.city
WHERE s.snum != c.snum;

Using EXISTS:

SELECT *
FROM Salespeople s
WHERE EXISTS (
    SELECT 1
    FROM Cust c
    WHERE c.city = s.city AND c.snum != s.snum
);


---

82. Find all salespeople who have customers in their cities but were not assigned to them (use IN and ALL).

Using IN and ALL:

SELECT *
FROM Salespeople
WHERE city IN (
    SELECT city FROM Cust
)
AND snum != ALL (
    SELECT snum FROM Cust WHERE Cust.city = Salespeople.city
);


---

83. Find all customers whose rating is greater than all customers in London.

SELECT *
FROM Cust
WHERE rating > ALL (
    SELECT rating
    FROM Cust
    WHERE city = 'London'
);


---

84. Find all customers whose rating is greater than any customer in Rome.

SELECT *
FROM Cust
WHERE rating > ANY (
    SELECT rating
    FROM Cust
    WHERE city = 'Rome'
);


---

85. Find all orders for more than any order placed on October 3.

SELECT *
FROM Orders
WHERE amt > ANY (
    SELECT amt
    FROM Orders
    WHERE odate = '03-OCT-94'
);


---

86. List all customers whose rating is equal to the maximum rating in the table.

SELECT *
FROM Cust
WHERE rating = (
    SELECT MAX(rating)
    FROM Cust
);


---

87. Find all orders of customers who have a rating equal to the minimum rating in the table.

SELECT o.*
FROM Orders o
JOIN Cust c ON o.cnum = c.cnum
WHERE c.rating = (
    SELECT MIN(rating)
    FROM Cust
);


---

88. Find all customers who are served by the salesperson with the highest commission.

SELECT *
FROM Cust
WHERE snum = (
    SELECT snum
    FROM Salespeople
    WHERE commission = (
        SELECT MAX(commission)
        FROM Salespeople
    )
);


---

89. Find all orders that are the highest amount placed by each customer.

SELECT *
FROM Orders o1
WHERE amt = (
    SELECT MAX(amt)
    FROM Orders o2
    WHERE o1.cnum = o2.cnum
);

