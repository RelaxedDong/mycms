#coding:utf-8

import os
from alipay import AliPay,ISVAliPay
import json

appid = "2018091361386330"
app_notify_url = "https://www.donghao.club/notify/"
app_private_key_path = r"/home/mycms/utils/keys/private_2048.txt"
alipay_public_key_path = r"/home/mycms/utils/keys/alipay_key_2048.txt"
return_url = "https://www.donghao.club/reutrn_alipay/"

app_private_key_string = open(app_private_key_path).read()
alipay_public_key_string = open(alipay_public_key_path).read()

alipay = AliPay(
    appid=appid,
    app_notify_url=return_url,  # 默认回调url
    app_private_key_string=app_private_key_string,
    # 支付宝的公钥，验证支付宝回传消息使用，不是你自己的公钥,
    alipay_public_key_string=alipay_public_key_string,
    sign_type="RSA2", # RSA 或者 RSA2
    debug=False  # 默认False
)