#encoding:utf-8
from flask import jsonify


class HttpCode(object):
    Ok = 200
    ParamerError = 400
    Unauth = 401
    ServerError = 500

def RestfulResult(code,message,data):
    return jsonify({'code':code,'message':message,'data':data})



def success(message="",data=None):
    return RestfulResult(HttpCode.Ok,message=message,data=data)


def params_error(message="",data=None):
    return RestfulResult(HttpCode.ParamerError,message=message,data=data)

def unauth_error(message="",data=None):
    return RestfulResult(HttpCode.Unauth,message=message,data=None)

def server_error(message=""):
    return RestfulResult(HttpCode.ServerError,message=message,data=None)




