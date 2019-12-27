require "pry"
def find_item_by_name_in_collection(name, collection)
  index = 0
  while index < collection.length do
   if name == collection[index][:item]
     return collection[index]
   else
     index += 1
   end
  end

  nil
  # Implement me first!
  #
  # Consult README for inputs and outputs
end

def consolidate_cart(cart)
  index = 0
  result = cart.uniq
  while index < result.length do
    inner_index = 0
    count = 0
    current_item = result[index][:item]
    while inner_index < cart.length do
      current_cart = cart[inner_index][:item]
      if current_item === current_cart
          count += 1
      end
      inner_index += 1
    end
    result[index][:count] = count
    index += 1
  end
  return result
  # Consult README for inputs and outputs
  #
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
end

def apply_coupons(cart, coupons)
  index = 0
  while index < coupons.length do
    inner_index = 0
    currrent_coupon = coupons[index][:item]
    while inner_index < cart.length do
      current_item = cart[inner_index][:item]
      if currrent_coupon == current_item && cart[inner_index][:count] >= coupons[index][:num]
        cart[inner_index][:count] = cart[inner_index][:count] - coupons[index][:num]
        cart << {:item => "#{coupons[index][:item]} W/COUPON", :price => coupons[index][:cost]/coupons[index][:num], :clearance => cart[inner_index][:clearance], :count => coupons[index][:num]}
      end
      inner_index += 1
    end
    index += 1
  end
return cart
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def apply_clearance(cart)
  index =  0
  while index < cart.length do
    if cart[index][:clearance]
      clearance_off = 0.20 * cart[index][:price]
      cart[index][:price] -= clearance_off
    end
  index += 1
  end
  return new_cart
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def checkout(cart, coupons)
  con_cart = consolidate_cart(cart)
  coup_check = apply_coupons(con_cart, coupons)
  final_cart = apply_clearance(coup_check)
  index = 0
  grand_total = 0
    while index < final_cart.length do
      # binding.pry
      if final_cart[index][:count] > 1
        price_for_all = final_cart[index][:price] * final_cart[index][:count]
        grand_total += price_for_all
      else
      grand_total += final_cart[index][:price]
      end
      index += 1
    end
  return grand_total

  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
