package ring

import (
	j "JewelryShop/model/jewelry"
)

type Ring struct {
	j.Jewelry
	IdRing   string `json:"idRing"`
	Size     int    `json:"ringSize"`
	Material string `json:"ringMaterial"`
	Quantity int    `json:"ringQuantity"`
}
