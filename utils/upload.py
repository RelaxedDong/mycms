#encoding:utf-8
import oss2
import os, sys
from datetime import datetime
auth = oss2.Auth('LTAIkjj8twuSyGfv','EI8KJb6iCpPAytr4mqd4u3Zm9fNsh9')

bucket = oss2.Bucket(auth,'oss-cn-beijing.aliyuncs.com','donghaocms')


base_posts_url = 'https://donghaocms.oss-cn-beijing.aliyuncs.com/posts/'
base_avater_url = 'https://donghaocms.oss-cn-beijing.aliyuncs.com/avater/'
base_groups_url = 'https://donghaocms.oss-cn-beijing.aliyuncs.com/groups/'
base_images_url = 'https://donghaocms.oss-cn-beijing.aliyuncs.com/images/'

bucket_post = oss2.Bucket(auth,'oss-cn-beijing.aliyuncs.com','donghaocms')



def change_filename(filename):
    dt = datetime.now()
    time = dt.strftime('%Y%m%d%H%M%S')
    filename = time+filename
    return filename


def percentage(consumed_bytes, total_bytes):
    if total_bytes:
        rate = int(100 * (float(consumed_bytes) / float(total_bytes)))
        print('\r{0}% '.format(rate), end='')
        sys.stdout.flush()






