package controllers

import (
	"myadmin/models"
	"myadmin/libs"
	"github.com/astaxie/beego"
)
type LoginController struct {
	BaseController
}

func (this *LoginController) Login() {
	if this.IsPost() {
		user := this.GetString("username")
		pass := this.GetString("password")
		password := libs.Passwords(pass)
		users := &models.User{Username:user, Password:password}
		if err := users.Login();err != nil {
			result := make(map[string]interface{})
			result["info"] = "验证失败"
			this.Data["json"] = result
			this.ServeJSON()
		} else {
			this.SetSession("username", user)
			this.Redirect(beego.URLFor("/"), 302)
			// this.Redirect(beego.URLFor("MainController.Get"),302)
		}
	} else {
		this.Xsrf()
		this.Data["pagetitle"]="登录系统"
		this.TplName="login/index.html"
	}
}

func (this *LoginController) UpdatePass() {
	if this.IsPost() {
		result := make(map[string]interface{})
		id, err := this.GetInt("id")
		if err != nil {
			result["info"] = "参数错误"
			this.Data["json"] = result
			this.ServeJSON()
			this.StopRun()
		}
		pass1 := this.GetString("password1")
		pass2 := this.GetString("password2")
		if pass1 != pass2 {
			result["info"] = "密码不一致"
			this.Data["json"] = result
			this.ServeJSON()
			this.StopRun()
		}

		if len(pass1) < 6 {
			result["info"] = "密码长度不能小于6个"
			this.Data["json"] = result
			this.ServeJSON()
			this.StopRun()
		}

		password := libs.Passwords(pass1)
		users := &models.User{Id:id, Password:password}
		if err := users.UpdatePassword();err != nil {
			result["info"] = "修改失败"
			this.Data["json"] = result
			this.ServeJSON()
		} else {
			// this.Redirect(beego.URLFor("/"), 302)
			this.Redirect(beego.URLFor("MainController.Get"),302)
		}
	} else {
		this.Xsrf()
		user := &models.User{}
		this.Data["user"] = user.List()
		this.Data["pagetitle"]="修改密码"
		this.TplName="login/update.html"
	}
}

func (this *LoginController) UpdateNike() {
	if this.IsPost() {
		result := make(map[string]interface{})
		id, err := this.GetInt("id")
		if err != nil {
			result["info"] = "参数错误"
			this.Data["json"] = result
			this.ServeJSON()
			this.StopRun()
		}
		nikename := this.GetString("nikename")
		if nikename == "" {
			result["info"] = "昵称不能为空"
			this.Data["json"] = result
			this.ServeJSON()
			this.StopRun()
		}
		users := &models.User{Id:id, Nikename:nikename}
		if err := users.UpdateNikename();err != nil {
			result["info"] = "修改失败"
			this.Data["json"] = result
			this.ServeJSON()
		} else {
			// this.Redirect(beego.URLFor("/"), 302)
			this.Redirect(beego.URLFor("MainController.Get"),302)
		}
	} else {
		this.Xsrf()
		user := &models.User{}
		this.Data["user"] = user.List()
		this.Data["pagetitle"]="修改昵称"
		this.TplName="login/updatenike.html"
	}
}

func (this *LoginController) Logout() {
	this.DestroySession()
	this.Redirect(beego.URLFor("LoginController.Login"), 302)
}