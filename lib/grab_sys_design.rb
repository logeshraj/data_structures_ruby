# In Grab, we award users Loyalty Points for taking rides and using GrabPay. These Loyalty Points could be used to purchase Rewards later.

# Design a Point management system, that support:
# - Award x amount points to a user, with a description of the awarding
# - Deduct x amount of points from a user, with a description of the deduction
# - Get current balance of a user
# - Get point history of a single user, sorted by time

# 1. scope 
# Grabcar
# Grabtaxi

# Grabfood voucher - 23l2h9u2
# starbuck voucher - 2323k994

# points - 

# credit and debit

# 2. User base
# finite amount - 100 million

# 3. Daily active users
# 3 million

# 4. Spike 
# 1000 requests per second

# 5. Consistency 
# eventual consistency - few seconds to one hour


# Database Design


# User
# user_id
# phone no
# email


# UserPoint
# user_id
# current_balance >= 0

# Point
# uuid - unique
# user_id
# desc_id
# credit
# created_at

# consistent

# Description
# desc_id
# desc



# Api
# REST
# 1. add_points(user_id,desc, points) -> add_points(1, "GrabCar", 10)  add_points(1, "Visa", 5)
# insert to Point (1, "GrabCar", 10)
# update to UserPoint(1, 10) current_balance = current_balance + points
# transaction do 
#     desc_id = select desc_id from Description where( desc = "GrabCar")
#     insert into point(uuid, user_id, desc_id, credit) values(1,1, desc_id, 10)
#     balance = select balance from user_point where(user_id = 1)
#     update set Point values current_balance = balance + 10 where user_id = 1
# end

# 2. deduct_points(user_id, desc, points)
# deduct_points(1, "Starbucks", -10)
# deduct_points(1, "Revoke GrabCar", -10)

# insert to Point (1, "Starbucks", -10)

# balance = select balance from user_point where(user_id = 1)
# balance >= points
# transaction do 
#     desc_id = select desc_id from Description where( desc = "Starbucks")
#     insert into point(user_id, desc_id, credit) values(1, desc_id, -10)
#     balance = select balance from user_point where(user_id = 1)
#     update set Point values current_balance = balance + (-10) where user_id = 1
# end

# 3. get_balance(user_id)
# balance = select balance from user_point where(user_id = 1)

# 4. get_points_history(user_id, no_of_transaction)

# select * from point where(user_id = 1) order_by created_at desc  limit 10


# add_points(1, "GrabCar", 10) timeout

# balance = 20

# id, user_id, des_id, points
# 1, 1, 1, 10
# 1, 1, 1, 10