package main

import (
	_ "myadmin/routers"
	"github.com/astaxie/beego"
	"myadmin/models"
)

func main() {
	models.Init()
	beego.Run()
}

