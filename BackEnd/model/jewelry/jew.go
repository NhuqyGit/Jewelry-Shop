package jewelry

type Jewelry struct {
	Id          string         `json:"idJew"`
	JewelryName string         `json:"jewName"`
	TypeName    string         `json:"jewType"`
	Price       int            `json:"price"`
	Des         string         `json:"jewDes"`
	Quantity    int            `json:"quantity"`
	Sizes       map[string]int `json:"sizes"`
	Material    string         `json:"material"`
	Images      []string       `json:"images"`
}

type InJew struct {
	Id          string
	IdCol       string            `json:"idCol"`
	IdType      string            `json:"idType"`
	JewelryName string            `json:"jewName"`
	Price       string            `json:"price"`
	Des         string            `json:"des"`
	Material    string            `json:"material"`
	Quantity    string            `json:"quantity"`
	Sizes       map[string]string `json:"sizes"`
	Images      []interface{}     `json:"images"`
}
