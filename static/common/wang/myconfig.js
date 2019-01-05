function fun() {
    var E = window.wangEditor
    var editor = new E('#editor');
    // 或者 var editor = new E( document.getElementById('editor') )
    editor.customConfig.emotions = [
        {
            // tab 的标题
            title: '默认',
            // type -> 'emoji' / 'image'
            type: 'image',
            // content -> 数组
            content: [
                {
                    'alt': '吃瓜',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/01/2018new_chigua_org.png'
                },
                {
                    'alt': '允悲',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/83/2018new_kuxiao_org.png'
                },
                {
                    'alt': '坏笑',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/4d/2018new_huaixiao_org.png'
                },
                {
                    'alt': '笑cry',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/4a/2018new_xiaoku_org.png'
                },
                {
                    'alt': '馋嘴',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/fa/2018new_chanzui_org.png'
                },
                {
                    'alt': '拜拜',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/fd/2018new_baibai_org.png'
                },
                {
                    'alt': '右哼哼',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/c1/2018new_youhengheng_org.png'
                },
                {
                    'alt': '左哼哼',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/43/2018new_zuohengheng_org.png'
                },
                {
                    'alt': '怒骂',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/87/2018new_zhouma_org.png'
                },
                {'alt': '顶', 'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/ae/2018new_ding_org.png'},
                {
                    'alt': '微笑',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/e3/2018new_weixioa02_org.png'
                },
                {
                    'alt': '偷笑',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/71/2018new_touxiao_org.png'
                },
                {
                    'alt': '舔屏',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/3e/2018new_tianping_org.png'
                },
                {
                    'alt': '亲亲',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/2c/2018new_qinqin_org.png'
                },
                {
                    'alt': '太开心',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/1e/2018new_taikaixin_org.png'
                },
                {
                    'alt': '挤眼',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/43/2018new_jiyan_org.png'
                },
                {
                    'alt': '衰',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/a2/2018new_shuai_org.png'
                },
                {
                    'alt': '感冒',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/2018new_kouzhao_org.png'
                },
                {
                    'alt': '可怜',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/96/2018new_kelian_org.png'
                },
                {'alt': '汗', 'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/28/2018new_han_org.png'},
                {
                    'alt': '色',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/9d/2018new_huaxin_org.png'
                },
                {
                    'alt': '可爱',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/09/2018new_keai_org.png'
                },
                {'alt': '钱', 'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/a2/2018new_qian_org.png'},
                {
                    'alt': '思考',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/30/2018new_sikao_org.png'
                },
                {
                    'alt': '生病',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/3b/2018new_shengbing_org.png'
                },
                {'alt': '困', 'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/3c/2018new_kun_org.png'},
                {
                    'alt': '互粉',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/86/2018new_hufen02_org.png'
                },
                {
                    'alt': '睡',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/e2/2018new_shuijiao_org.png'
                },
                {
                    'alt': '并不简单',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/aa/2018new_bingbujiandan_org.png'
                },
                {
                    'alt': '害羞',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/c1/2018new_haixiu_org.png'
                },
                {
                    'alt': '费解',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/2a/2018new_wenhao_org.png'
                },
                {
                    'alt': '挖鼻',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/9a/2018new_wabi_org.png'
                },
                {
                    'alt': '悲伤',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/ee/2018new_beishang_org.png'
                },
                {
                    'alt': '打脸',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/cb/2018new_dalian_org.png'
                },
                {
                    'alt': '抓狂',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/17/2018new_zhuakuang_org.png'
                },
                {
                    'alt': '哈哈',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/8f/2018new_haha_org.png'
                },
                {
                    'alt': '傻眼',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/dd/2018new_shayan_org.png'
                },
                {'alt': '晕', 'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/07/2018new_yun_org.png'},
                {
                    'alt': '鄙视',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/da/2018new_bishi_org.png'
                },
                {'alt': '哼', 'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/7c/2018new_heng_org.png'},
                {
                    'alt': '哈欠',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/55/2018new_dahaqian_org.png'
                },
                {
                    'alt': '泪',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/6e/2018new_leimu_org.png'
                },
                {'alt': '怒', 'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/f6/2018new_nu_org.png'},
                {
                    'alt': '闭嘴',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/62/2018new_bizui_org.png'
                },
                {
                    'alt': '疑问',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/b8/2018new_ningwen_org.png'
                },
                {
                    'alt': '白眼',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/ef/2018new_landelini_org.png'
                },
                {'alt': '吐', 'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/08/2018new_tu_org.png'},
                {
                    'alt': '黑线',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/a3/2018new_heixian_org.png'
                },
                {
                    'alt': '委屈',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/a5/2018new_weiqu_org.png'
                },
                {
                    'alt': '笑而不语',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/2d/2018new_xiaoerbuyu_org.png'
                },
                {
                    'alt': '阴险',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/9e/2018new_yinxian_org.png'
                },
                {'alt': '嘘', 'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/b0/2018new_xu_org.png'},
                {
                    'alt': '嘻嘻',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/33/2018new_xixi_org.png'
                },
                {
                    'alt': '爱你',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/f6/2018new_aini_org.png'
                },
                {
                    'alt': '吃惊',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/49/2018new_chijing_org.png'
                },
                {'alt': '污', 'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/10/2018new_wu_org.png'},
                {
                    'alt': '鼓掌',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/6e/2018new_guzhang_org.png'
                },
                {
                    'alt': '憧憬',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/c9/2018new_chongjing_org.png'
                },
                {'alt': '酷', 'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/c4/2018new_ku_org.png'},
                {
                    'alt': '失望',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/aa/2018new_shiwang_org.png'
                },
                {
                    'alt': 'good',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/8a/2018new_good_org.png'
                },
                {'alt': '弱', 'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/3d/2018new_ruo_org.png'},
                {'alt': '耶', 'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/29/2018new_ye_org.png'},
                {
                    'alt': '来',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/42/2018new_guolai_org.png'
                },
                {
                    'alt': '握手',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/e9/2018new_woshou_org.png'
                },
                {
                    'alt': '加油',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/9f/2018new_jiayou_org.png'
                },
                {
                    'alt': 'haha',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/1d/2018new_hahashoushi_org.png'
                },
                {
                    'alt': '拳头',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/86/2018new_quantou_org.png'
                },
                {'alt': '赞', 'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/e6/2018new_zan_org.png'},
                {'alt': 'ok', 'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/45/2018new_ok_org.png'},
                {'alt': 'NO', 'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/1e/2018new_no_org.png'},
                {
                    'alt': '作揖',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/e7/2018new_zuoyi_org.png'
                },
                {
                    'alt': '中国赞',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/6d/2018new_zhongguozan_org.png'
                },
                {
                    'alt': '广告',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/57/2018new_guanggao_thumb.png'
                },
                {
                    'alt': 'doge',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/a1/2018new_doge02_org.png'
                },
                {
                    'alt': '喵喵',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/7b/2018new_miaomiao_org.png'
                },
                {
                    'alt': '二哈',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/22/2018new_erha_org.png'
                },
                {
                    'alt': '抱抱',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/42/2018new_baobao_org.png'
                },
                {
                    'alt': '摊手',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/62/2018new_tanshou_org.png'
                },
                {'alt': '跪了', 'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/75/2018new_gui_org.png'},
                {
                    'alt': '给你小心心',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/ca/qixi2018_xiaoxinxin_org.png'
                },
                {
                    'alt': '吃狗粮',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/0b/qixi2018_chigouliang_org.png'
                },
                {
                    'alt': '蚁人',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/b6/manwei_yiren_org.png'
                },
                {
                    'alt': '黄蜂女',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/84/manwei_huangfengnv_org.png'
                },
                {
                    'alt': '星星',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/76/hot_star171109_org.png'
                },
                {
                    'alt': '半星',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/f9/hot_halfstar_org.png'
                },
                {
                    'alt': '空星',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/ff/hot_blankstar_org.png'
                },
                {
                    'alt': '草泥马',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/3b/2018new_caonima_org.png'
                },
                {
                    'alt': '浮云',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/61/2018new_yunduo_org.png'
                },
                {
                    'alt': '沙尘暴',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/b7/2018new_shachenbao_org.png'
                },
                {
                    'alt': '给力',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/36/2018new_geili_org.png'
                },
                {
                    'alt': '男孩儿',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/0a/2018new_nanhai_org.png'
                },
                {
                    'alt': '女孩儿',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/39/2018new_nvhai_org.png'
                },
                {
                    'alt': '奥特曼',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/c6/2018new_aoteman_org.png'
                },
                {
                    'alt': '话筒',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/48/2018new_huatong_org.png'
                },
                {
                    'alt': '礼物',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/0e/2018new_liwu_org.png'
                },
                {
                    'alt': '飞机',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/4a/2018new_feiji_org.png'
                },
                {
                    'alt': '干杯',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/2018new_ganbei_org.png'
                },
                {
                    'alt': '围脖',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/64/2018new_weibo_org.png'
                },
                {
                    'alt': '钟',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/8e/2018new_zhong_org.png'
                },
                {
                    'alt': '肥皂',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/d6/2018new_feizao_org.png'
                },
                {
                    'alt': '浪',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/46/2018new_xinlang_org.png'
                },
                {
                    'alt': '最右',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/be/remen_zuiyou180605_org.png'
                },
                {
                    'alt': '蜡烛',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/16/2018new_lazhu_org.png'
                },
                {'alt': '心', 'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/8a/2018new_xin_org.png'},
                {
                    'alt': '月亮',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/d5/2018new_yueliang_org.png'
                },
                {
                    'alt': '围观',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/6c/2018new_weiguan_org.png'
                },
                {
                    'alt': '蛋糕',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/f9/2018new_dangao_org.png'
                },
                {
                    'alt': '微风',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/c7/2018new_weifeng_org.png'
                },
                {
                    'alt': '音乐',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/1f/2018new_yinyue_org.png'
                },
                {
                    'alt': '猪头',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/1c/2018new_zhutou_org.png'
                },
                {
                    'alt': '鲜花',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/d4/2018new_xianhua_org.png'
                },
                {
                    'alt': '太阳',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/cd/2018new_taiyang_org.png'
                },
                {'alt': '下雨', 'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/7e/2018new_yu_org.png'},
                {
                    'alt': '伤心',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/6c/2018new_xinsui_org.png'
                },
                {
                    'alt': '兔子',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/c6/2018new_tuzi_org.png'
                },
                {
                    'alt': '骷髅',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/a1/2018new_kulou_org.png'
                },
                {
                    'alt': '照相机',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/78/2018new_xiangji_org.png'
                },
                {
                    'alt': '熊猫',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/aa/2018new_xiongmao_org.png'
                },
                {'alt': '喜', 'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/e0/2018new_xizi_org.png'},
                {
                    'alt': '绿丝带',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/cb/2018new_lvsidai_org.png'
                },
                {
                    'alt': '威武',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/14/2018new_weiwu_org.png'
                },
                {
                    'alt': '弗莱见钱眼开',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/83/2018newyear_richdog_org.gif'
                },
                {'alt': '看涨', 'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/fe/kanzhangv2_org.gif'},
                {'alt': '看跌', 'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/c5/kandiev2_org.gif'},
                {
                    'alt': '带着微博去旅行',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/ec/eventtravel_org.gif'
                },
                {'alt': '偷乐', 'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/fa/lxhtouxiao_org.gif'},
                {'alt': '笑哈哈', 'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/32/lxhwahaha_org.gif'},
                {'alt': '羞嗒嗒', 'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/df/lxhxiudada_org.gif'},
                {'alt': '好爱哦', 'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/74/lxhainio_org.gif'},
                {'alt': '赞啊', 'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/00/lxhzan_org.gif'},
                {
                    'alt': '求关注',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/ac/lxhqiuguanzhu_org.gif'
                },
                {'alt': '好喜欢', 'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/d6/lxhlike_org.gif'},
                {
                    'alt': '米奇喜欢',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/b5/mickey_xihuan_org.png'
                },
                {
                    'alt': '米奇飞吻',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/84/mickey_feiwen_org.png'
                },
                {
                    'alt': '米奇大哭',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/81/mickey_daku_org.png'
                },
                {
                    'alt': '米奇比心',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/31/mickey_bixin_org.png'
                },
                {
                    'alt': 'Aloha',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/7d/mickey_aloha_org.png'
                },
                {
                    'alt': '米奇爱你',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/17/mickey_aini_org.png'
                },
                {
                    'alt': '钢铁侠',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/44/fulian3_gangtiexia01_org.png'
                },
                {
                    'alt': '美国队长',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/1e/fulian3_meiguoduizhang01_org.png'
                },
                {
                    'alt': '浩克',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/5a/fulian3_haoke01_org.png'
                },
                {
                    'alt': '雷神',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/1f/fulian3_leishen01_org.png'
                },
                {
                    'alt': '洛基',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/69/fulian3_luoji01_org.png'
                },
                {
                    'alt': '蜘蛛侠',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/7e/fulian3_zhizhuxia01_org.png'
                },
                {
                    'alt': '奇异博士',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/a3/fulian3_qiyiboshi01_org.png'
                },
                {
                    'alt': '黑寡妇',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/78/fulian3_heiguafu01_org.png'
                },
                {
                    'alt': '冬兵',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/5e/fulian3_dongbing01_org.png'
                },
                {
                    'alt': '格鲁特',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/de/fulian3_gelute01_org.png'
                },
                {
                    'alt': '蚁人',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/b6/manwei_yiren_org.png'
                },
                {
                    'alt': '黄蜂女',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/84/manwei_huangfengnv_org.png'
                },
                {
                    'alt': '哆啦A梦花心',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/08/dorahaose_org.gif'
                },
                {
                    'alt': '哆啦A梦害怕',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/c7/dorahaipa_org.gif'
                },
                {
                    'alt': '哆啦A梦吃惊',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/f0/dorachijing_org.gif'
                },
                {'alt': '哆啦A梦汗', 'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/61/dorahan_org.gif'},
                {
                    'alt': '哆啦A梦微笑',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/9e/jqmweixiao_org.gif'
                },
                {
                    'alt': '伴我同行',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/ef/jqmbwtxing_org.gif'
                },
                {
                    'alt': '静香微笑',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/29/jiqimaojingxiang_org.gif'
                },
                {
                    'alt': '大雄微笑',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/8e/jiqimaodaxiong_org.gif'
                },
                {
                    'alt': '胖虎微笑',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/2f/jiqimaopanghu_org.gif'
                },
                {
                    'alt': '小夫微笑',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/21/jiqimaoxiaofu_org.gif'
                },
                {
                    'alt': '哆啦A梦笑',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/54/dora_xiao_org.png'
                },
                {
                    'alt': '哆啦A梦无奈',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/96/dora_wunai_org.png'
                },
                {
                    'alt': '哆啦A梦美味',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/21/dora_meiwei_org.png'
                },
                {
                    'alt': '哆啦A梦开心',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/df/dora_kaixin_org.png'
                },
                {
                    'alt': '哆啦A梦亲亲',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/e0/dora_qinqin_org.png'
                },
                {
                    'alt': '小黄人微笑',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/f0/xhrnew_weixiao_org.png'
                },
                {
                    'alt': '小黄人剪刀手',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/63/xhrnew_jiandaoshou_org.png'
                },
                {
                    'alt': '小黄人不屑',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/b2/xhrnew_buxie_org.png'
                },
                {
                    'alt': '小黄人高兴',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/41/xhrnew_gaoxing_org.png'
                },
                {
                    'alt': '小黄人惊讶',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/fd/xhrnew_jingya_thumb.png'
                },
                {
                    'alt': '小黄人委屈',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/79/xhrnew_weiqu_org.png'
                },
                {
                    'alt': '小黄人坏笑',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/be/xhrnew_huaixiao_thumb.png'
                },
                {
                    'alt': '小黄人白眼',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/e2/xhrnew_baiyan_org.png'
                },
                {
                    'alt': '小黄人无奈',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/15/xhrnew_wunai_org.png'
                },
                {
                    'alt': '小黄人得意',
                    'src': 'http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/c8/xhrnew_deyi_org.png'
                },
            ]
        },
    ]
    editor.customConfig.menus = [
        'emoticon',  // 表情
        'image',  // 插入图片
        'link',  // 插入链接
        'bold',  // 粗体
        'fontSize',  // 字号
        'fontName',  // 字体
        'foreColor',  // 文字颜色
        'backColor',  // 背景颜色
        'quote',  // 引用
        'justify',  // 对齐方式
        'undo',  // 撤销
    ]


    // 下面两个配置，使用其中一个即可显示“上传图片”的tab。但是两者不要同时使用！！！
    // editor.customConfig.uploadImgShowBase64 = true   // 使用 base64 保存图片
    editor.customConfig.customUploadImg = function (files, insert) {
        // files 是 input 中选中的文件列表
        // insert 是获取图片 url 后，插入到编辑器的方法
        var fm = new FormData();
        if (files.length > 1) {
            swal('请插入单张图片！');
            return;
        }
        fm.append('file', files[0]);
        zlajax.post({
            'url': '/c/upload/',
            processData: false,
            contentType: false,
            async: true,
            'data': fm,
            'success': function (data) {
                if (data['code'] == 200) {
                    insert(data['data'])
                }
            }
        })
        // 上传代码返回结果之后，将图片插入到编辑器中
    }
    return editor
}
