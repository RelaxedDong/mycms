#encoding:utf-8


def distribution_bar(adresses):
    from pyecharts import Bar
    place = adresses.keys()
    count = adresses.values()
    bar = Bar("成员分析", "成员位置分布")
    bar.add("位置", list(place),list(count),is_more_utils=True)
    return bar