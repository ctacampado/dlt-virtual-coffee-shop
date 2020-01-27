package main

type docProduct struct {
	Key    string  `json:"Key"`
	Record product `json:"Record"`
}

type docOrder struct {
	Key    string        `json:"Key"`
	Record orderResponse `json:"Record"`
}

type plist []docProduct

type olist []docOrder

type shopRecord struct {
	Vendor string  `json:"Vendor,omitempty"`
	Olist  olist   `json:"Olist,omitempty"`
	Plist  plist   `json:"Plist,omitempty"`
	TSales float32 `json:"Tsales,omitempty"`
}

type productTransientInput struct {
	Name  string
	Type  string
	Price float32
}

type product struct {
	ObjectType string  `json:"docType"` // docType is used to distinguish the various types of objects in state database
	Name       string  `json:"Name"`
	Type       string  `json:"Type"`
	Price      float32 `json:"Price"`
}

type orderRequest struct {
	ID      string                `json:"ID"`
	Name    string                `json:"Name"`    // customer name
	Vendor  string                `json:"Vendor"`  // vendor name
	Product productTransientInput `json:"Product"` // name, type, and price
	Qty     int                   `json:"Qty"`     // order quantity
	Payment float32               `json:"Payment"` // amount paid by the customer. could be more or less than the product price
}

type orderResponse struct {
	ObjectType   string       `json:"docType"` // docType is used to distinguish the various types of objects in state database
	OrderRequest orderRequest `json:"OrderRequest"`
	Change       float32      `json:"Change"`
}
