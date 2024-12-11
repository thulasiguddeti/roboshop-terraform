- name: Roboshop SG and Rules
  security_groups:
  - DB:
    - mongodb
    - redis
    - mysql
    - rabbitmq
  - APP:
    - catalogue
    - user
    - cart
    - shipping
    - payment
  - WEB:
    - web
  - VPN:
    - vpn
  ingress_rule:
  - mongodb:
    - name: mongodb_vpn
      purpose: mongodb should accept traffic on 22 from vpn
    - name: mongodb_catalogue
      purpose: mongodb should accept traffic on 27017 from catalogue
    - name: mongodb_user
      purpose: mongodb should accept traffic on 27017 from user
  - redis:
    - name: redis_vpn
      purpose: redis should accept traffic on 22 from vpn
    - name: redis_user
      purpose: redis should accept traffic on 6379 from user
    - name: redis_cart
      purpose: redis should accept traffic on 6379 from cart
  - mysql:
    - name: mysql_vpn
      purpose: mysql should accept traffic on 22 from vpn
    - name: mysql_shipping
      purpose: mysql should accept traffic on 3306 from shipping
  - rabbitmq:
    - name: rabbitmq_vpn
      purpose: rabbitmq should accept traffic on 22 from vpn
    - name: rabbitmq_payment
      purpose: rabbitmq should accept traffic on 5672 from payment
  - catalogue:
    - name: catalogue_vpn
      purpose: catalogue should accept traffic on 22 from vpn
    - name: catalogue_web
      purpose: catalogue should accept traffic on 8080 from web
    - name: catalogue_cart
      purpose: catalogue should accept traffic on 8080 from cart
  - user:
    - name: user_vpn
      purpose: user should accept traffic on 22 from vpn
    - name: user_web
      purpose: user should accept traffic on 8080 from web
    - name: user_payment
      purpose: user should accept traffic on 8080 from payment
  - cart:
    - name: cart_vpn
      purpose: cart should accept traffic on 22 from vpn
    - name: cart_web
      purpose: cart should accept traffic on 8080 from web
    - name: cart_shipping
      purpose: cart should accept traffic on 8080 from shipping
    - name: cart_payment
      purpose: cart should accept traffic on 8080 from payment
  - shipping:
    - name: shipping_vpn
      purpose: shipping should accept traffic on 22 from vpn
    - name: shipping_web
      purpose: shipping should accept traffic on 8080 from web
  - payment:
    - name: payment_vpn
      purpose: payment should accept traffic on 22 from vpn
    - name: payment_web
      purpose: payment should accept traffic on 8080 from web
  - web:
    - name: web_vpn
      purpose: web should accept traffic on 22 from vpn
    - name: web_internet
      purpose: web should accept traffic on 80 from internet