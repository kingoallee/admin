package controllers

import (
	// "github.com/astaxie/beego"
	"myadmin/models"
	"strconv"
)

type SalesController struct {
	BaseController
}

func (this *SalesController) List() {
	limit, err := this.GetInt("limit")
	if err != nil {
		limit = 1
	}

	page, err := this.GetInt("page")
	if err != nil {
		page = 1
	}

	key := this.GetString("key")
	if key == "" {
		key = "*"
	}

	sale := &models.Sales{}
	sales, num := sale.ListLimit(limit, page, key)
	list := make([]map[string]interface{}, len(sales))
	for k, v := range sales {
		//先获取到客户信息
		row := make(map[string]interface{})
		client := v.Client.IdClinet()
		row["id"]=v.Id
		row["clientname"]=client.Name
		row["address"]=v.SalesAddress
		row["postid"]=v.SalesPostid
		row["phone"]=v.SalesPhone
		row["date"]=v.SalesData
		row["status"]=v.Status
		salespd := new(models.Salespd)
		row["salespd"]=salespd.IdSales(v.Id)
		var a float32
		for _,v := range salespd.IdSales(v.Id){
			a+=v.Totail
		}

		row["sums"]=strconv.FormatFloat(float64(a),'f',2,32)

		list[k]=row
	}
	if key == "*"{
		this.Data["key"]=""
	}else{
		this.Data["key"]=key
	}
	this.Xsrf()
	this.Data["pagecount"]=len(num)
	this.Data["pagelimit"]=limit
	this.Data["page"]=page
	this.Data["sales"]=list
	this.Data["pagetitle"]="显示销售单"
	this.Layout="public/layout.html"
	this.TplName="sales/list.html"
}
