from dosql import *
import cgi
import simplejson as json

def index(req, RestaurantMenu_id):
    RestaurantMenu_id = cgi.escape(RestaurantMenu_id)

    x = doSql()
    rets = x.execqry("select * from get_RestaurantMenu_perid('" + RestaurantMenu_id +  "');", False)
    result = []
    for ret in rets:
        stringed = map(str, ret)
        result.append(stringed)

    return json.dumps(result)
