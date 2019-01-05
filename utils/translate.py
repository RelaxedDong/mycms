import urllib.request
import urllib.parse


def get_result(input):
    data = {
        'action': 'FY_BY_CLICKBUTTION',
        'client': 'fanyideskweb',
        'doctype': 'json',
        'from': 'ch',
        'i': input,
        'keyfrom': 'fanyi.web',
        'salt': '1529810657469',
        'sign': 'fab79ba66f7ce5b14f9bfa6433858f3a',
        'smartresult': 'dict',
        'to': 'en',
        'typoResult': 'false',
        'version': '2.1',
    }

    data = urllib.parse.urlencode(data).encode('utf-8')
    result = urllib.request.Request(url="http://fanyi.youdao.com/translate?smartresult=dict&smartresult=rule"
                                    , method="POST", data=data)
    Response = urllib.request.urlopen(result)
    end = eval(Response.read().decode("utf-8").strip())
    trslateresult = end['translateResult'][0][0]['tgt']
    return trslateresult