module BasketsHelper

  def render_user_address(user)
    str_address = []
    for i in user.addresses
      real_name = i.real_name
      phone_number = i.phone_number
      address_into = i.address_info
      tmp = "收件人: #{real_name}/ 电话:#{phone_number}/ 地址:#{address_into}" % [real_name, phone_number, address_into]
      str_address << tmp
    end
    str_address
  end
end
