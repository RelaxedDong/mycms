import random
import string
# Image：一个画布
# ImageDraw：一个画笔
# ImageFont:画笔的字体
from PIL import Image,ImageDraw,ImageFont
# pip install pillow

# Captcha验证码

class Captcha(object):
    # 生成几位数的验证码
    number = 4
    # 验证码图片的宽度和高度
    size = (50,30)
    # 验证码字体大小
    fontsize = 25
    # 加入干扰线的条数
    line_number = 1

    # 构建一个验证码源文本
    SOURCE = list(string.ascii_letters)
    for index in range(0, 10):
        SOURCE.append(str(index))


    #用来绘制干扰线
    @classmethod
    def __gene_line(cls,draw,width,height):
        begin = (random.randint(0, width), random.randint(0, height))
        end = (random.randint(0, width), random.randint(0, height))
        draw.line([begin, end], fill = cls.__gene_random_color(),width=2)


    # 用来绘制干扰点
    @classmethod
    def __gene_points(cls,draw,point_chance,width,height):
        chance = min(100, max(0, int(point_chance))) # 大小限制在[0, 100]
        for w in range(width):
            for h in range(height):
                tmp = random.randint(0, 100)
                if tmp > 100 - chance:
                    draw.point((w, h), fill=cls.__gene_random_color())


    # 生成随机的颜色
    @classmethod
    def __gene_random_color(cls,start=0,end=255):
        random.seed()
        return (random.randint(start,end),random.randint(start,end),random.randint(start,end))


    # 随机选择一个字体
    @classmethod
    def __gene_random_font(cls):
        fonts = [
            'AdobeHeitiStd-Regular',
            'AdobeMyungjoStd-Medium'
        ]
        font = random.choice(fonts)
        return 'utils/captcha/'+font


    # 用来随机生成一个字符串(包括英文和数字)
    @classmethod
    def gene_text(cls, number):
        # number是生成验证码的位数
        return ''.join(random.sample(cls.SOURCE, number))


    #生成验证码
    @classmethod
    def gene_graph_captcha(cls):
        # 验证码图片的宽和高
        width,height = cls.size
        # 创建图片
        # R：Red（红色）0-255
        # G：G（绿色）0-255
        # B：B（蓝色）0-255
        # A：Alpha（透明度）
        image = Image.new('RGBA',(width,height),cls.__gene_random_color(0,100))
        # 验证码的字体
        font = ImageFont.load_default().font
        # 创建画笔
        draw = ImageDraw.Draw(image)
        # 生成字符串
        text = cls.gene_text(cls.number)
        # 获取字体的尺寸
        font_width, font_height = font.getsize(text)
        # 填充字符串
        draw.text(((width - font_width) / 2, (height - font_height) / 2),text,font= font,fill=cls.__gene_random_color(150,255))
        # 绘制干扰线
        for x in range(0, cls.line_number):
            cls.__gene_line(draw, width, height)
        # 绘制噪点
        cls.__gene_points(draw, 10, width, height)
        return (text,image)