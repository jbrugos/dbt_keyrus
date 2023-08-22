{% docs order_status %}
	
One of the following values: 

| status         | definition                                       |
|----------------|--------------------------------------------------|
| placed         | Order placed, not yet shipped                    |
| shipped        | Order has been shipped, not yet been delivered   |
| completed      | Order has been received by customers             |
| return pending | Customer indicated they want to return this item |
| returned       | Item has been returned                           |

{% enddocs %}

{% docs payment_method %}

| Payment method| definition
|---------------|---------------------------------------------------|
| credit card   |  visa and master card accepted                    |
| bank_transfer |  only accounts in UK                              |
| coupon        |  coupon number or bar code to be provided         |
| gift_card     |  stripe gift card bard code only                  |   


{% enddocs %}
