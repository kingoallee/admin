package routers

import (
	"myadmin/controllers"
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/context"
)

func init() {
	beego.Router("/", &controllers.MainController{})
	// 用户开始
	beego.Router("/login", &controllers.LoginController{}, "*:Login")
	beego.Router("/logout",&controllers.LoginController{},"*:Logout")
	beego.Router("/updatepass",&controllers.LoginController{},"*:UpdatePass")
	beego.Router("/updatenike",&controllers.LoginController{},"*:UpdateNike")
	// 用户结束

	// 销售开始
	beego.Router("/sales/list",&controllers.SalesController{},"*:List")
	
	var UrlManager = func(ctx *context.Context) {
		// 数据库读取全部的 url mapping 数据
		_, ok := ctx.Input.Session("username").(string)
		if !ok && ctx.Request.RequestURI != "/login" {
			ctx.Redirect(302, "/login")
		}
	}
	
	beego.InsertFilter("/*",beego.BeforeRouter,UrlManager)
}
