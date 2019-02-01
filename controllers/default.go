package controllers

import (
	// "github.com/astaxie/beego"
	"myadmin/models"
	"strconv"
)

type MainController struct {
	BaseController
}

func (this *MainController) Get() {
	//作为默认首页，显示客户数量，产品数量，销售笔数
	// 客户数量clients
	client := &models.Client{}
	clients := client.List()
	this.Data["clients"] = len(clients)

	// 产品数量:{{.products}}
	product := &models.Product{}
	products := product.List()
	this.Data["products"] = len(products)

	// 销售笔数:{{.saless}}
	sale := &models.Sales{}
	sales := sale.List()
	this.Data["saless"] = len(sales)

	// 销售总计:{{.sum}}

	saleTotal := &models.Salespd{}
	total := saleTotal.List()
	var sum float32
	for _, v := range total {
		sum += v.Totail
	}
	sums := strconv.FormatFloat(float64(sum), 'f', 2, 32) 
	// sums := strconv.FormatFloat(float64(sum),'f',2,32)
	this.Data["sum"] = sums

	this.Data["pagetitle"]="首页"
	username := this.GetSession("username")
	this.Data["Website"] = username.(string)
	this.Data["Email"] = "astaxie@gmail.com"
	this.Layout="public/layout.html"
	this.TplName = "index.html"
}
